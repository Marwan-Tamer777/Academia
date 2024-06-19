import React from "react";
import { Anton } from "next/font/google"; // font
import styles from "./Control.module.css";
import Image from "next/image";
// images
import Corner from "/public/land_sec2/Corner.png";
import Img from "/public/land_sec3/Img.svg";
import Img2 from "/public/land_sec3/Img2.svg";
// components
import SectionStructure from "../landingCommon/SectionStructure/SectionStructure";
import SectionHeader from "../landingCommon/SectionHeader/SectionHeader";
// translations
import { useTranslations } from "next-intl";

const anton = Anton({ subsets: ["latin"], weight: "400" });

export function Bloc({ header, desc, num }) {
  return (
    <div className={styles.bloc}>
      <h1 className={`${styles.headNum} ${anton.className}`}>0{num}</h1>
      <h4>{header}</h4>
      <p>{desc}</p>
    </div>
  );
}

export default function Control({ education = false }) {
  // Dynamic switch for Control & Education components
  let margin = 1;
  let image = Img;
  let order = "row-reverse";
  let data = "ControlData";
  let translation = "landingPage.control";

  if (education) {
    margin = 5;
    image = Img2;
    order = "row";
    data = "EducationData";
    translation = "landingPage.education";
  }
  const t = useTranslations(translation);

  return (
    <SectionStructure>
      <SectionHeader
        smallTitle={t("smallTitle")}
        mainTitle={t("title")}
        desc={t("description")}
      />
      {/* Content */}
      <div
        className={`${styles.container} ${order === "row" ? styles.order : ""}`}
      >
        <div className={styles.imageContainer}>
          <Image className={styles.img} src={image} alt="Img" />
        </div>

        {/* blocs */}
        <div className={styles.blocs}>
          {t.raw(`${data}`).map((bloc, num) => (
            <Bloc
              key={num}
              header={bloc.header}
              desc={bloc.desc}
              num={num + margin}
            />
          ))}
        </div>
      </div>
    </SectionStructure>
  );
}
