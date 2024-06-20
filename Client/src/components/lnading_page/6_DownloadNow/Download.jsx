import React from "react";
import styles from "./Download.module.css";

import Image from "next/image";
import Iphone from "/public/land_sec5/col.svg";
import IphoneRes from "/public/land_sec5/phonesForResponsive.svg";
import playStore from "/public/land_sec5/playstore.svg";
import appStore from "/public/land_sec5/appstore.svg";

import SectionHeader from "../landingCommon/SectionHeader/SectionHeader";

import { useTranslations } from "next-intl";

export const Stores = () => {
  return (
    <div className={styles.stores}>
      <Image src={playStore} />
      <Image src={appStore} />
    </div>
  );
};

export default function Download() {
  const t = useTranslations("landingPage.download");
  return (
    // <SectionStructure header={false} color={'#FFEEE3'}>
    <div className={styles.mainContainer}>
      <div className={styles.textSide}>
        <h1>{t("title")}</h1>
        <p>{t("description")}</p>
        <Stores />
      </div>
      <div className={styles.picSide}>
        <Image className={styles.img} src={Iphone} />
        <Image className={styles.imgRes} src={IphoneRes} />
      </div>
    </div>
    // </SectionStructure>
  );
}
