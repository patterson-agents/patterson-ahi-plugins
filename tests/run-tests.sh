#!/bin/sh
# Zero-dependency validation suite for patterson-ahi-plugins.
# POSIX sh + node one-liners. No dependencies, no network.
set -u
# Globbing off: $SKIP_FIND carries literal find patterns that must reach find unexpanded.
set -f

DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
EXPECTED_NAME="patterson-ahi-plugins"
fail=0
tmp=$(mktemp -d 2>/dev/null || echo /tmp/rt-$$)
mkdir -p "$tmp" 2>/dev/null
trap 'rm -rf "$tmp"' EXIT

ok()  { echo "ok   $1"; }
bad() { echo "FAIL $1"; fail=1; }

# --- 1. marketplace.json parses, name matches, plugin sources are ./-prefixed and exist ---
if node -e "
  const fs = require('node:fs');
  const path = require('node:path');
  const root = process.argv[1];
  const expected = process.argv[2];
  const raw = fs.readFileSync(path.join(root, '.claude-plugin/marketplace.json'), 'utf8');
  const m = JSON.parse(raw);
  if (m.name !== expected) { console.error('name is ' + JSON.stringify(m.name) + ', expected ' + expected); process.exit(1); }
  if (!Array.isArray(m.plugins) || m.plugins.length === 0) { console.error('plugins array is empty; this catalog ships patterson-ahi'); process.exit(1); }
  for (const p of (m.plugins || [])) {
    if (!p.source || !p.source.startsWith('./')) { console.error('plugin ' + p.name + ' source does not start with ./: ' + p.source); process.exit(1); }
    if (!fs.existsSync(path.join(root, p.source))) { console.error('plugin ' + p.name + ' source does not exist: ' + p.source); process.exit(1); }
  }
" "$DIR" "$EXPECTED_NAME" >"$tmp/mp.err" 2>&1; then
  ok "marketplace.json parses; name == $EXPECTED_NAME; plugin sources are ./-prefixed and exist"
else
  bad "marketplace.json validation: $(cat "$tmp/mp.err")"
fi

# Untracked toolchain and build output (the site/ VitePress workspace) are not shipped
# surface: node_modules, the VitePress cache, and dist are excluded from every check.
SKIP_FIND='-not -path */.git/* -not -path */node_modules/* -not -path */.vitepress/cache/* -not -path */.vitepress/dist/*'

# --- 2. every SKILL.md frontmatter name equals its parent directory name ---
find "$DIR" -name SKILL.md $SKIP_FIND >"$tmp/skills.list" 2>/dev/null
if [ -s "$tmp/skills.list" ]; then
  while IFS= read -r f; do
    dirname_actual=$(basename "$(dirname "$f")")
    fm_name=$(node -e "
      const fs = require('node:fs');
      const c = fs.readFileSync(process.argv[1], 'utf8');
      const m = c.match(/^---\r?\n([\s\S]*?)\r?\n---/);
      if (!m) process.exit(1);
      const n = m[1].match(/^name:\s*(.+?)\s*$/m);
      if (!n) process.exit(1);
      process.stdout.write(n[1].trim());
    " "$f" 2>/dev/null)
    if [ -z "$fm_name" ]; then
      bad "SKILL.md has no parseable frontmatter name: $f"
    elif [ "$fm_name" != "$dirname_actual" ]; then
      bad "SKILL.md name ($fm_name) != directory ($dirname_actual): $f"
    else
      ok "skill name == directory: $f"
    fi
  done <"$tmp/skills.list"
else
  ok "no SKILL.md files present (none to check)"
fi

# --- 3. forbidden strings: known off-brand/contamination markers ---
# Excludes .git, generated *.lock.yml (gh-aw output, marked linguist-generated), and this
# test script itself (which legitimately names the needles as literals to search for).
for needle in Figtree d98a00 c0392b rul6mjk; do
  hit=$(grep -rIl --exclude-dir=.git --exclude-dir=node_modules --exclude-dir=cache --exclude-dir=dist --exclude='*.lock.yml' --exclude='run-tests.sh' -- "$needle" "$DIR" 2>/dev/null | head -1)
  if [ -n "$hit" ]; then
    bad "forbidden string '$needle' found in $hit"
  else
    ok "forbidden string '$needle' absent"
  fi
done

# --- 4. node:20 is forbidden everywhere, including generated files (real finding if present) ---
hit=$(grep -rIl --exclude-dir=.git --exclude-dir=node_modules --exclude-dir=cache --exclude-dir=dist --exclude='run-tests.sh' -- "node:20" "$DIR" 2>/dev/null | head -1)
if [ -n "$hit" ]; then
  bad "forbidden reference 'node:20' found in $hit"
else
  ok "no 'node:20' reference anywhere in the repository"
fi

# --- 5. no Python files ---
hit=$(find "$DIR" $SKIP_FIND \( -name "*.py" -o -name "*.pyc" -o -name "*.pyi" \) 2>/dev/null | head -1)
if [ -n "$hit" ]; then
  bad "forbidden Python file: $hit"
else
  ok "no *.py / *.pyc / *.pyi files"
fi

# --- 6. no font binaries ---
hit=$(find "$DIR" $SKIP_FIND \( -iname "*.ttf" -o -iname "*.otf" -o -iname "*.woff" -o -iname "*.woff2" -o -iname "*.eot" \) 2>/dev/null | head -1)
if [ -n "$hit" ]; then
  bad "forbidden font binary: $hit"
else
  ok "no font binaries (ttf/otf/woff/woff2/eot)"
fi

# --- 7. no emoji on brand surfaces (README.md, docs/**, marketplace.json) ---
# Scoped, not repo-wide: the harvested agentic-workflow-designer skill (labs only) uses
# an emoji in its interview-format documentation, which is upstream content we adapt
# nothing in except paths, not a brand surface.
# Raster binaries (webp/png/jpg/gif/ico) are excluded: they are not text, and their bytes
# can decode into the emoji range by coincidence. SVG stays in scope because it is text.
brand_files=$(find "$DIR" $SKIP_FIND \( -iname "README.md" -o -path "*/docs/*" -o -iname "marketplace.json" \) -type f -not -iname "*.webp" -not -iname "*.png" -not -iname "*.jpg" -not -iname "*.jpeg" -not -iname "*.gif" -not -iname "*.ico" 2>/dev/null)
emoji_hit=""
if [ -n "$brand_files" ]; then
  emoji_hit=$(node -e "
    const fs = require('node:fs');
    const files = process.argv.slice(1);
    // Real emoji blocks only. Deliberately excludes plain typographic arrows (U+2190-U+21FF)
    // and general technical symbols (U+2B00-U+2BFF) -- both used routinely in prose (e.g. '->')
    // and not emoji.
    const emojiRe = /[\u{1F300}-\u{1FAFF}\u{2600}-\u{27BF}]/u;
    for (const f of files) {
      let c;
      try { c = fs.readFileSync(f, 'utf8'); } catch { continue; }
      if (emojiRe.test(c)) { console.log(f); process.exit(0); }
    }
  " $brand_files 2>/dev/null)
fi
if [ -n "$emoji_hit" ]; then
  bad "emoji found on a brand surface: $emoji_hit"
else
  ok "no emoji on brand surfaces (README.md, docs/**, marketplace.json)"
fi

if [ "$fail" -eq 0 ]; then
  echo "ALL TESTS PASSED"
else
  echo "TESTS FAILED"
fi
exit "$fail"
