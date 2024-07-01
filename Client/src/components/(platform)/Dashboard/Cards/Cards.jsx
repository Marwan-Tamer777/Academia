import React from "react";
import styles from "./Cards.module.css";
import Link from "next/link";

import Image from "next/image";
import CoursePic from "/public/(platform)/cards/courses.png";
import Enter from "/public/(platform)/cards/EnterSvg.jsx";
import Notifi from "/public/(platform)/cards/NotifiSvg.jsx";

import { useTranslations } from "next-intl";

// api
import { fetchData } from "@/components/(platform)/Common/API/fetch";

export async function SingleCard() {
  let userID = "75a669da-5b0c-487c-a623-1d97f85afbf8";
  const data = await fetchData({ route: "courses/user/" + userID });
  return (
    <div className={styles.container}>
      {data.map((item, index) => {
        return (
          <div key={index} className={styles.card}>
            <div className={styles.cardImg}>
              <Image
                className={styles.coursePic}
                src={CoursePic}
                alt={item.name}
              />
            </div>
            <div className={styles.cardText}>
              <div>
                <h3>{item.name}</h3>
                <h6>{item.programName}</h6>
              </div>
              <p className={styles.cardDesc}>
                Lorem ipsum, dolor sit amet consectetur adipisicing elit. Non,
                repellendus ad architecto praesentium cumque eos ex cum porro
                sapiente asperiores quae. Fuga expedita modi provident ipsa
                atque culpa aperiam error!
              </p>
            </div>
            <LowerCard courseLink={item._id} />
          </div>
        );
      })}
    </div>
  );
}

export default function Cards() {
  const t = useTranslations("platform.cards");
  return (
    <div className={styles.mainContainer}>
      <div className={styles.header}>
        <h2>{t("title")}</h2>
      </div>
      <SingleCard />
    </div>
  );
}

export function LowerCard({ notifiNum, courseLink }) {
  const t = useTranslations("platform.cards");
  return (
    <div className={styles.lowerCard}>
      <Link href={`./Courses/${courseLink}`} className={styles.enter}>
        <p className={styles.enterIco} onCli>
          <Enter />
        </p>
        <p className={styles.enterTxt}>{t("enter")}</p>
      </Link>
      <div className={styles.notifi}>
        <Notifi />
        <p className={styles.notifiTxt}>
          {notifiNum}
          {t("notifi")}
        </p>
      </div>
    </div>
  );
}
