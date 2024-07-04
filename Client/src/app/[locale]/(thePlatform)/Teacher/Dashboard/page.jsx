// for fast refresh (remove this line after finish edit)
// @refresh reset

import React from "react";
import styles from "./page.module.css";
import { SidePanal } from "@/components/(platform)/Common/SidePanal/SidePanal";
import Banar from "@/components/(platform)/Dashboard/Banar/Banar";
import Cards from "@/components/(platform)/Dashboard/Cards/Cards";

import { useTranslations } from "next-intl";

export default function Page() {
  return (
    <div className={styles.container}>
      <Banar />
      <div className={styles.body}>
        <Cards />
      </div>
    </div>
  );
}
