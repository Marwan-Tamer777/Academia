import React from "react";
import styles from "./SectionHeader.module.css";

export default function SectionHeader({smallTitle, mainTitle, desc}) {
  return (
    <div className={styles.header}>
      <h6 className={styles.smallTitle}>{smallTitle}</h6>
      <h2 className={styles.mainTitle}>{mainTitle}</h2>
      <p>{desc}</p>
    </div>
  );
}
