import React from "react";
import SectionStructure from "../landingCommon/SectionStructure/SectionStructure";
import styles from "./Team.module.css";

import Image from "next/image";
import SectionHeader from "../landingCommon/SectionHeader/SectionHeader";

import { useTranslations } from "next-intl";

export default function Team() {
  const t = useTranslations("landingPage.team");
  return (
    <SectionStructure>
      <SectionHeader
        smallTitle={t("smallTitle")}
        mainTitle={t("title")}
        desc={t("description")}
      />
      <div className={styles.container}>
        {t.raw('teamData').map((member, id) => {
          return (
            <div className={styles.member} key={id}>
              <Image
                width={100}
                height={100}
                className={styles.img}
                src={member.img}
              />
              <h1>{member.name}</h1>
              <h4 className={styles.position}>{member.position}</h4>
              <p>{member.description}</p>
              <div className={styles.socials}>
                {member.socials.map((social, id) => {
                  return (
                    <a href={social.link} key={id}>
                      <Image width={28} height={28} src={social.icon} />
                    </a>
                  );
                })}
              </div>
            </div>
          );
        })}
      </div>
    </SectionStructure>
  );
}
