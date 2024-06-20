"use client";

import { localeNames, locales, usePathname, useRouter } from "@/navigation";
import styles from "./LangSwitcher.module.css";

import Image from "next/image";
import {EG} from "/public/navbar/eg.jpg";

export default function LocaleSwitcher({ locale }) {
  // `pathname` will contain the current
  // route without the locale e.g. `/about`...
  const pathname = usePathname();
  const router = useRouter();

  const changeLocale = (event) => {
    const newLocale = event.target.value;

    // ...if the user chose Arabic ("ar-eg"),
    // router.replace() will prefix the pathname
    // with this `newLocale`, effectively changing
    // languages by navigating to `/ar-eg/about`.
    router.replace(pathname, { locale: newLocale });
  };

  return (
    <div className={styles.langSwitcher}>
      <select
        value={locale}
        onChange={changeLocale}
        className={styles.langSwitcher}
      >
        {locales.map((loc) => (
          <option key={loc} value={loc} className={styles.langs}>
            {localeNames[loc]}
            {/* <Image src={EG}/> */}
          </option>
        ))}
      </select>
    </div>
  );
}
