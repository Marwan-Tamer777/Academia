import React from "react";
import styles from "./ShortCutsPanal.module.css";

import Link from "next/link";
import { useTranslations } from "next-intl";

// icons
import Stat from "/public/(platform)/shortcutsPanal/StatisticsSVG";
import Assignment from "/public/(platform)/shortcutsPanal/AssignmentSvg";
import Quizes from "/public/(platform)/shortcutsPanal/QuizSvg";
import Setting from "/public/(platform)/shortcutsPanal/SettingSvg";

export default function ShortCutsPanal() {
  const t = useTranslations("platform.shortCutsPanal");
  return (
    <div className={styles.container}>
      <div className={styles.title}>
        {t("title")}
      </div>
      <ul className={styles.tabs}>
        <Link className={styles.link} href={"/"}>
          <Stat />
          {t("tabs.0.name")}
        </Link>
        <Link className={styles.link}  href={"/"}>
          <Assignment />
          {t("tabs.1.name")}
        </Link>
        <Link className={styles.link} href={"/"}>
          <Quizes />
          {t("tabs.2.name")}
        </Link>
        <Link className={styles.link} href={"/"}>
          <Setting />
          {t("tabs.1.name")}
        </Link>
      </ul>
    </div>
  );
}
