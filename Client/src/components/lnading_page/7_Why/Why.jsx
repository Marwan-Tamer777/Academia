"use client";
import { useState, createContext, useEffect } from "react";
import SectionStructure from "../landingCommon/SectionStructure/SectionStructure";
import styles from "./Why.module.css";
import Image from "next/image";

import SectionHeader from "../landingCommon/SectionHeader/SectionHeader";

import { useTranslations } from "next-intl";

const Taps = ({ setSelectedTab, selectedTab = 0 }) => {
  // useEffect(() => {
  //   setSelectedTab(0);
  // }, []);

  const handleSelectedTab = (tabIndex) => {
    setSelectedTab(tabIndex);
  };

  const t = useTranslations("landingPage.why");

  return (
    <div className={styles.tabs}>
      {t.raw('WhyData').map((tabIndex) => (
        <button
          key={tabIndex}
          className={`${styles.tab} ${
            selectedTab === tabIndex.id ? styles.active : ""
          }`}
          autoFocus={tabIndex.id === 0}
          onClick={() => handleSelectedTab(tabIndex.id)}
        >
          {tabIndex.section}
        </button>
      ))}
    </div>
  );
};

export default function Why() {
  const selectedTabContext = createContext();
  const [selectedTab, setSelectedTab] = useState(0);

  // translation
  const t = useTranslations("landingPage.why");
  
  return (
    <SectionStructure>
      <SectionHeader
        smallTitle={t("smallTitle")}
        mainTitle={t("title")}
        desc={t("description")}
      />

      <div className={styles.mainContainer}>
        <Taps setSelectedTab={setSelectedTab} />
        <selectedTabContext.Provider value={selectedTab}>
          {t.raw('WhyData').slice(selectedTab, selectedTab + 1).map((item, index) => (
            <div
              key={index}
              className={`${styles.container} ${
                selectedTab === item.id ? styles.active : ""
              }`}
            >
              <div className={styles.txtSide}>
                <h6 className={styles.smallTitle}>{item.smallTitle}</h6>
                <h1>{item.header}</h1>
                <p>{item.desc}</p>
                <ul className={styles.ul}>
                  {item.points.map((point, index) => (
                    <li key={index}><strong>{point.slice(0, point.indexOf(":")+1)}</strong>{point.slice(point.indexOf(":")+2)}</li>
                  ))}
                </ul>
              </div>
              <div>
                <Image
                  src={item.img}
                  className={styles.img}
                  width={500}
                  height={500}
                />
              </div>
            </div>
          ))}
        </selectedTabContext.Provider>
      </div>
    </SectionStructure>
  );
}
