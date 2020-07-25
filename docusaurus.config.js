/**
 * Copyright (c) 2017-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

// See https://docusaurus.io/docs/site-config for all the possible
// site configuration options.

// List of projects/orgs using your project for the users page.
const siteConfig = {
  title: 'Paracord',
  tagline: 'NodeJS Discord API framework built to scale',
  url: 'https://paracord.com',
  favicon: 'img/favicon.ico',
  baseUrl: '/',
  projectName: 'paracord',
  organizationName: 'paracordjs',
  scripts: ['https://buttons.github.io/buttons.js'],
  presets: [
    [
      '@docusaurus/preset-classic',
      {
        docs: {
          sidebarPath: require.resolve('./sidebars.json'),
        },
      },
    ],
  ],

  themeConfig: {
    navbar: {
      title: 'Paracord',
      logo: {
        alt: 'Paracord Logo',
        src: 'img/logo.svg',
      },
      links: [
        {
          href: 'https://github.com/paracordjs/paracord',
          label: 'GitHub',
          position: 'right',
        },
        {to: 'docs/simple_usage', label: 'Get Started' },
      ],
    },
    footer: {
      logo: {
        alt: 'Paracord Logo',
        src: 'img/logo.svg',
        href: 'https://paracord.js.com/',
      },
      copyright: `Copyright © ${new Date().getFullYear()} Paracordjs`, // You can also put own HTML here.
    },
    image: 'img/logo.svg',
    // Equivalent to `docsSideNavCollapsible`.
    sidebarCollapsible: false,
    // ...
  },
};

module.exports = siteConfig;
