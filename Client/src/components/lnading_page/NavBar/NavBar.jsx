import React from "react";
import styles from "./NavBar.module.css";
import Button from "@/components/lnading_page/landingCommon/Button/Button";
import Image from "next/image";
import Logo from "/public/logo-dark.svg";

import { useTranslations } from "next-intl";

export function Nav({color='var(--primary-color)'}) {

  const t = useTranslations("landingPage.navbar");

  return(
    <ul className={styles.navbarLinks} style={{color: `${color}`}}>
    {t.raw('tabs').map((tab, index) => (
      <ul key={index} className={styles.tab}>
        {tab}
      </ul>
    ))}
  </ul>
  );
}


export default function Header({children, background='var(--primary-color)', color='white'}) {
  const t = useTranslations("landingPage.navbar");

  return (
    <nav className={styles.navbar}>
      <Image
        className={styles.logo}
        src={Logo}
        alt="logo"
        // style={{ width: "90px", height: "inherit" }}
      />
      <Nav />
      <div className={styles.button}>
        <Button text={t('login')} background={background} color={color} />
      </div>
    </nav>
  );
}
