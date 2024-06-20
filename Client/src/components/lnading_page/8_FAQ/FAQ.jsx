"use client";
import React from "react";
import { useState } from "react";

import styles from "./FAQ.module.css";
import SectionStructure from "../landingCommon/SectionStructure/SectionStructure";
import Button from "../landingCommon/Button/Button";
import { Minus, Add } from "iconic-react";

import { useTranslations } from "next-intl";

export default function FAQ() {
  const [selected, setSelected] = useState(null);

  const toggle = (i) => {
    if (selected === i) {
      return setSelected(null);
    }
    setSelected(i);
  };


  // Translation
  const t = useTranslations("landingPage.faq");
  return (
    <SectionStructure >
      <div className={styles.container}>
        <div className={styles.rightSide}>
          <div>
            <h1>{t('title')}</h1>
            <p>
              {t('desc')}
            </p>
          </div>
          <div className={styles.button}>
          <Button text={t('button')} />
          </div>
        </div>
        <div className={styles.leftSide}>
          {/* mapping */}
          {t.raw('Questions').map((quest, i) => (
            <div className={styles.item} onClick={() => toggle(i)} tabIndex={i}>
              <div className={styles.title}>
                <h3>{quest.question}</h3>
                <span>
                  {selected === i ? (
                    <Minus color="#FF7e31" />
                  ) : (
                    <Add color="#FF7e31" />
                  )}
                </span>
              </div>
              <div
                className={
                  selected === i
                    ? `${styles.show} ${styles.content}`
                    : styles.content
                }
              >
                {quest.answer}
              </div>
            </div>
          ))}
        </div>
      </div>
    </SectionStructure>
  );
}
