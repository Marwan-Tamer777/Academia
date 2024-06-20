import React from "react";
import styles from "./Features.module.css";
import Image from "next/image";

import SectionStructure from "../landingCommon/SectionStructure/SectionStructure";
import SectionHeader from "../landingCommon/SectionHeader/SectionHeader";

import { useTranslations } from "next-intl";

export default function Features() {
  const t = useTranslations("landingPage.features");

  return (
    <SectionStructure>
      <SectionHeader smallTitle={t("smallTitle")} mainTitle={t("title")} />
      <div className={styles.blocs}>
        {t.raw('features').map((item, index) => (
          <div className={styles.bloc} key={index}>
            <div className={styles.icon}>
              <Image className={styles.image} src={item.src} alt="icon" width={80} height={80}/>
            </div>
            <div>
              <h4>{item.title}</h4>
              <p>{item.description}</p>
            </div>
          </div>
        ))}
      </div>
    </SectionStructure>
  );
}
