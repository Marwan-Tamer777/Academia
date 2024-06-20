import { createSharedPathnamesNavigation } from 'next-intl/navigation';

export const locales = ['en', 'ar'];
export const localeNames = {
    "en": "English",
    "ar": "العربية (Arabic)",
};
export const localePrefix = 'always'; // Default

export const { Link, redirect, usePathname, useRouter } =
    createSharedPathnamesNavigation({ locales, localePrefix });