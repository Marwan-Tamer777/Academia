import React from "react";
import styles from "./Footer.module.css";
import SectionStructure from "../landingCommon/SectionStructure/SectionStructure";

import Image from "next/image";
import Logo from "/public/logo2.svg";

import { Nav } from "@/components/lnading_page/NavBar/NavBar";
import { Stores } from "@/components/lnading_page/6_DownloadNow/Download";

import { useTranslations } from "next-intl";

export default function Footer() {

  const t = useTranslations("landingPage.footer");

  return (
    <div className={styles.container}>
      <div className={styles.content}>
        <Image src={Logo} />
        <Nav color={"white"} />
        <Stores />
      </div>
      <hr className={styles.hrLine} />
      {/* <br /> */}
      <div className={styles.footer}>
        <div className={styles.footerRight}>
          <p>&copy; {t('copyRight')}</p>
        </div>
        <div className={styles.footerLeft}>
          <p>{t('terms')}</p>
          <p>{t('privacy')}</p>
          <p>{t('cookies')}</p>
        </div>
      </div>
    </div>
  );
}
