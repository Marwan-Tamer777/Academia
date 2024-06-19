// 'use client'; // This directive ensures the component is treated as a Client Component

// import React from 'react';
// import { usePathname, useSearchParams, useRouter } from 'next/navigation';

// const LanguageSwitcher = () => {
//   const router = useRouter();
//   const pathname = usePathname();
//   const searchParams = useSearchParams();
//   const locales = ['en', 'fr', 'es'];
//   const locale = searchParams.get('locale') || 'en';

//   const changeLanguage = (lng) => {
//     const params = new URLSearchParams(searchParams);
//     params.set('locale', lng);
//     router.push(`${pathname}?${params.toString()}`);
//   };

//   return (
//     <div>
//       {locales.map((lng) => (
//         <button key={lng} onClick={() => changeLanguage(lng)} disabled={lng === locale}>
//           {lng}
//         </button>
//       ))}
//     </div>
//   );
// };

// export default LanguageSwitcher;


// app/_components/LocaleSwitcher.tsx

"use client";

import {
  localeNames,
  locales,
  usePathname,
  useRouter,
} from "@/i18n.config";

export default function LocaleSwitcher({
  locale,
}) {
  // `pathname` will contain the current
  // route without the locale e.g. `/about`...
  const pathname = usePathname();
  const router = useRouter();

  const changeLocale = (
    event,
  ) => {
    const newLocale = event.target.value ;

    // ...if the user chose Arabic ("ar-eg"),
    // router.replace() will prefix the pathname
    // with this `newLocale`, effectively changing
    // languages by navigating to `/ar-eg/about`.
    router.replace(pathname, { locale: newLocale });
  };

  return (
    <div>
      <select
        value={locale}
        onChange={changeLocale}
        className="..."
      >
        {locales.map((loc) => (
          <option key={loc} value={loc}>
            {localeNames[loc]}
          </option>
        ))}
      </select>
    </div>
  );
}