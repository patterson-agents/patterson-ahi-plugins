import { defineConfig } from 'vitepress'

// Documentation site for the patterson-ahi-plugins marketplace.
// Theme colors are documented Patterson tokens: see .vitepress/theme/patterson.css.
export default defineConfig({
  title: 'Animal Health International',
  description:
    'Documentation for patterson-ahi-plugins, the Animal Health International domain marketplace: production animal distribution capability with lot-level traceability analytics on Microsoft Fabric.',
  lang: 'en-US',
  head: [
    // Proxima Nova via Adobe Fonts kit uth1qfm (BG25 p.25). Kit reference only - no font
    // binaries are ever committed to a Patterson repository.
    ['link', { rel: 'stylesheet', href: 'https://use.typekit.net/uth1qfm.css' }],
    ['link', { rel: 'icon', type: 'image/svg+xml', href: '/patterson-logo-square-navy.svg' }]
  ],
  themeConfig: {
    logo: {
      light: '/patterson-logo-square-navy.svg',
      dark: '/patterson-logo-white.svg'
    },
    nav: [
      { text: 'Guide', link: '/guide/getting-started' },
      { text: 'Plugin', link: '/plugin/overview' },
      { text: 'Fabric', link: '/fabric/lot-traceability' },
      { text: 'GitHub', link: 'https://github.com/patterson-agents/patterson-ahi-plugins' }
    ],
    sidebar: [
      {
        text: 'Guide',
        items: [
          { text: 'Getting started', link: '/guide/getting-started' },
          { text: 'Where this catalog fits', link: '/guide/where-it-fits' },
          { text: 'Contributing', link: '/guide/contributing' }
        ]
      },
      {
        text: 'The patterson-ahi plugin',
        items: [
          { text: 'Overview', link: '/plugin/overview' },
          { text: 'Agents', link: '/plugin/agents' },
          { text: 'Skills', link: '/plugin/skills' }
        ]
      },
      {
        text: 'Microsoft Fabric',
        items: [
          { text: 'Lot traceability', link: '/fabric/lot-traceability' }
        ]
      }
    ],
    footer: {
      message: 'Patterson Companies Internal Use License (LicenseRef-Patterson-Internal).',
      copyright: 'Copyright Patterson Companies. Trusted Expertise. Unrivaled Support.'
    },
    search: { provider: 'local' }
  }
})
