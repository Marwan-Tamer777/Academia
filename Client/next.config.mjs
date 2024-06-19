// /** @type {import('next').NextConfig} */
// import { i18n } from './next-i18next.config.mjs';

// const nextConfig = {
//     // i18n,
// };

// export default nextConfig;

import createNextIntlPlugin from 'next-intl/plugin';
 
const withNextIntl = createNextIntlPlugin();
 
/** @type {import('next').NextConfig} */
const nextConfig = {};
 
export default withNextIntl(nextConfig);

// module.exports = {
//     reactStrictMode: true,
//     images: {
//       domains: ['localhost'], // Add here the domains of your images if they are hosted on an external server
//     },
//     webpack(config) {
//       config.module.rules.push({
//         test: /\.svg$/,
//         use: ['@svgr/webpack'],
//       });
  
//       return config;
//     },
//   };