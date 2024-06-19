'use client';
import { ArrowCircleDown2, ArrowDown } from "iconic-react";
import styles from "./HeroSection.module.css";
import Arc from "/public/arc.svg";
import Image from "next/image";
import NavBar from "@/components/lnading_page/NavBar/NavBar";
import Button from "@/components/lnading_page/landingCommon/Button/Button";

import { useTranslations } from "next-intl";

export default function HeroSection() {
  const t = useTranslations("landingPage.heroSection");

  const scrollToNextSection = () => {
    if (typeof window !== "undefined") {
      window.scrollTo({
        top: window.innerHeight,
        behavior: "smooth"
      });
    }
  };

  return (
    <section className={styles.section}>
      <div className={styles.nav}>
        <NavBar />

      </div>
      <div className={styles.heroSection}>
        <h1 className={styles.title}>{t("title")}</h1>
        <Image style={{ width: "400px" }} src={Arc} alt="Arc" />
        <p className={styles.disc}>{t("description")}</p>
        <div className={styles.arrowFrame} onClick={scrollToNextSection}>
          <ArrowDown className={styles.arrow} size="30px" color="var(--primary-color)" />
        </div>
      </div>
    </section>
  );
}

