// // next-i18next.config.mjs
// export const i18n = {
//     defaultLocale: 'ar',
//     locales: ['en', 'ar'],
//   };
  

import createNextIntlPlugin from 'next-intl/plugin';
 
const withNextIntl = createNextIntlPlugin();
 
/** @type {import('next').NextConfig} */
const nextConfig = {};
 
export default withNextIntl(nextConfig);