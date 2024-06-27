// for fast refresh (remove this line after finish edit)
// @refresh reset

import React from "react";
import styles from "./Banar.module.css";

import Image from "next/image";
import Img from "/public/(platform)/banar/Banar.png";

// icons
import Video from "/public/(platform)/banar/Video.jsx";
import Headphones from "/public/(platform)/banar/Headphones.jsx";

import Link from "next/link";

import { useTranslations } from "next-intl";

export default function Banar() {
  const t = useTranslations("platform.Banar");
  return (
    <div className={styles.mainContainer}>
      <Image className={styles.img} src={Img} />
      <div className={styles.container}>
        <div className={styles.text}>
          <h1 className={styles.title}>{t("title")}</h1>
          <p className={styles.desc}>{t("description")}</p>
        </div>
        <div className={styles.buttons}>
          <button className={styles.button}>
            <Video fill={"currentColor"} />
            {t("button")}
          </button>
          <Link href={"./"} className={styles.link}>
            <Headphones />
            {t("link")}
          </Link>
        </div>
      </div>
    </div>
  );
}
