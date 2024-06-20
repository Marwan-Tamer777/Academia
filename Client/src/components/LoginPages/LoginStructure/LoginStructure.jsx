import React from "react";
import styles from "./LoginStructure.module.css";

import Background from "../Background/Background";

export default function LoginStructure({ children }) {
  return (
      <div className={styles.container}>{children}</div>
  );
}
