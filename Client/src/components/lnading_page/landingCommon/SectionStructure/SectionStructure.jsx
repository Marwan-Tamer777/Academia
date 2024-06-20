import React from "react";
import styles from "./SectionStructure.module.css";
import SectionHeader from "../SectionHeader/SectionHeader";
import Background from "@/components/LoginPages/Background/Background";

let smallTitle = "smallTitle";
let mainTitle = "mainTitle";
let desc = "desc";

export default function SectionStructure({ children, color}) 


{
  return (
    <section
      className={styles.mainContainer}
      style={{ backgroundColor: `${color}` }}
    >
      {/* <Image className={styles.corner} src={Corner} alt="corner" /> */}

      {/* Header */}
      {/* {header && <SectionHeader smallTitle={smallTitle} mainTitle={mainTitle} desc={desc} />} */}

      {/* Content */}
      {children}
    </section>
  );
}
