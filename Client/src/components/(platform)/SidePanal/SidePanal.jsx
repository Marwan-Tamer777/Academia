
import React from "react";
import styles from "./SidePanal.module.css";

import classNames from "classnames";
import Link from "next/link";
import Image from "next/image";

import { ClosePanal } from "./ClosePanal";
import DarkModeToggle from "@/components/DarkModeToggle/DarkModeToggle";

// icons
import DarkMode from "/public/(platform)/sidePanal/icons/DarkMode.svg";
import Lang from "/public/(platform)/sidePanal/icons/lang.svg";
import Logout from "/public/(platform)/sidePanal/icons/logout.svg";

import Avatar from "/public/(platform)/sidePanal/Avatar.png";
import Logo from "/public/logo-dark.svg";

import { useTranslations, useLocale } from "next-intl";
import LangSwitcher from "@/components/LangSwitcher/LangSwitcher";

export const Tab = ({ tabsData, width, height }) => {
  const t = useTranslations("platform.sidePanal");

  let tabsContainer = classNames(styles.tabsContainer);
  let singleTab = classNames(styles.tab);
  {
    tabsData === "otherTabs"
      ? ((tabsContainer = classNames(tabsContainer, styles.otherTabsContainer)),
        (singleTab = classNames(singleTab, styles.otherTabs)))
      : (tabsContainer = classNames(tabsContainer, styles.mainTabsContainer)),
      (singleTab = classNames(singleTab, styles.mainTabs));
  }
  return (
    <div className={tabsContainer}>
      {t.raw(tabsData).map((tab, index) => (
        <div key={index} className={singleTab}>
          <Link className={styles.link} href={tab.link}>
            {/* to be changed to svg */}
            <Image width={width} height={height} src={tab.icon} className={styles.img} color="#fff"/>
            {tab.name}
          </Link>
        </div>
      ))}
    </div>
  );
};

export const SidePanal = () => {
  const t = useTranslations("platform.sidePanal");
  const locale = useLocale();

  return (
    <div className={styles.container}>
      <div className={styles.logo}>
        <Image src={Logo} />
        {/* <Logo /> */}
      </div>
      <Tab tabsData={"tabs"} width={18} height={18} />
      <hr className={styles.hr} />
      <Tab tabsData={"otherTabs"} width={14} height={14} />
      {/* buttom section */}
      <div className={`${styles.tabsContainer} ${styles.buttomSection}`}>
        <ClosePanal />
        {/* dark mode */}
        <div className={styles.buttomTabs}>
          <Image width={18} height={18} src={DarkMode} />
          {t("buttomTabs.1.name")}
          <DarkModeToggle />
        </div>
        {/* lang switcher */}
        <div className={styles.buttomTabs}>
          <Image width={18} height={18} src={Lang} />
          {t("buttomTabs.2.name")}
          <LangSwitcher locale={locale} />
        </div>
      </div>
      <div className={styles.user}>
        <Image src={Avatar} width={40} height={40} />
        <div className={styles.info}>
          <span> عبد الرحمن محمد أحمد</span>
          <p>example@edu.com</p>
        </div>
        <Image src={Logout} width={20} height={20}/>
      </div>
    </div>
  );
};
