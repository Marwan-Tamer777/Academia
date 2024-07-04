 /* language configuration */

// /** @type {import('next').NextConfig} */
// import { i18n } from './next-i18next.config.mjs';

// const nextConfig = {
//     // i18n,
// };

// export default nextConfig;

import createNextIntlPlugin from 'next-intl/plugin';

const withNextIntl = createNextIntlPlugin();

/** @type {import('next').NextConfig} */
const nextConfig = {
  webpack(config, options) {
    // const fileLoaderRule = config.module.rules.find((rule) =>
    //     rule.test?.test?.('.svg'),
    //   );
    //   if (fileLoaderRule) {
    //     fileLoaderRule.exclude = /\.svg$/i;
    //   }
    // config.module.rules.push({
    //     // only work with imported SVGs with '.component.svg' ending files
    //   test: /\.component\.svg$/i,
    //   use: ['@svgr/webpack'],
    // });
    // fileLoaderRule.exclude = /\.svg$/i

    return config;
  },
};

export default withNextIntl(nextConfig)

/* svg for static and component imports configuration */

// import createNextIntlPlugin from 'next-intl/plugin';

// const withNextIntl = createNextIntlPlugin();

// /** @type {import('next').NextConfig} */
// const nextConfig = {
//   webpack(config, options) {
//     // Exclude .static.svg files from being processed by @svgr/webpack
//     const svgrLoaderRule = {
//       test: /\.component\.svg$/i, // Only process .component.svg files with @svgr/webpack
//       use: ['@svgr/webpack'],
//     };

//     // Add a new rule for handling .static.svg files as static files
//     // This rule is necessary to ensure that .static.svg files are copied to the output directory
//     // and can be accessed via a URL, which is required for using them with the Next.js Image component.
//     const staticSvgRule = {
//       test: /\.static\.svg$/i, // Match .static.svg files
//       type: 'asset/resource', // Use asset/resource to emit the file to the output directory
//     };

//     // Add both rules to the webpack configuration
//     config.module.rules.push(svgrLoaderRule, staticSvgRule);

//     return config;
//   },
// };

// export default withNextIntl(nextConfig);