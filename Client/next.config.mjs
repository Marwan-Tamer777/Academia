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
//   webpack(config, options) {
//     const fileLoaderRule = config.module.rules.find((rule) =>
//         rule.test?.test?.('.svg'),
//       );
//       if (fileLoaderRule) {
//         fileLoaderRule.exclude = /\.svg$/i;
//       }
//     config.module.rules.push({
//       test: /\.svg$/i,
//       use: ['@svgr/webpack'],
//     });
//     // fileLoaderRule.exclude = /\.svg$/i

//     return config;
//   },
};

export default withNextIntl(nextConfig)



