import React from "react";
import styles from "./Flexibility.module.css";
import Image from "next/image";

import SectionStructure from "../landingCommon/SectionStructure/SectionStructure";
import SectionHeader from "../landingCommon/SectionHeader/SectionHeader";

import {useTranslations} from 'next-intl';



export function Bloc({ header, desc, img }) {
  
  return (
    <div className={styles.bloc}>
      <div className={styles.imageContainer}>
        <Image
          src={img}
          alt="img"
          className={styles.image}
          width={100}
          height={100}
          />
      </div>
      <h4>{header}</h4>
      <p>{desc}</p>
    </div>
  );
}

export default function Flexibility() {
  const t = useTranslations('landingPage.flexibility');

  return (
    <SectionStructure>
      <SectionHeader smallTitle={t('smallTitle')} mainTitle={t('title')} desc={t('description')} />
      {/* blocs */}
      <div className={styles.blocs}>
        {t.raw('FlexibilityData').map((bloc, num) => (
          <Bloc
            key={num}
            img={bloc.img}
            header={bloc.header}
            desc={bloc.desc}
          />
        ))}
      </div>
    </SectionStructure>
  );
}
