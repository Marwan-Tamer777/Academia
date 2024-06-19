import React from "react";
import styles from "./TheLine.module.css";

import { useTranslations } from "next-intl";

export default function TheLine() {

  const t = useTranslations("landingPage.theLine");
  return (
      <div className={styles.container}>
        <div className={styles.rightSide}>
          <h1>{t('title')}</h1>
        </div>
        <div className={styles.leftSide}>
          <p>
            {t('description')}
          </p>
        </div>
      </div>
  );
}
