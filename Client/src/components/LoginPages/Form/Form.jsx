"use client";
import { useContext } from "react";
import styles from "./Form.module.css";
import { Cairo } from "next/font/google";
import InputContext from "@/context/InputContext";

import { Login } from "iconic-react";

const cairo = Cairo({ subsets: ["arabic"] });

export default function Form({ children }) {
  // const {inputVal} = useContext(InputContext)

  // if (!InputContext) {
  //   throw new Error('Form must be used within an InputValContext.Provider');
  // }

  // const { inputVal } = InputContext;

  const handleSubmit = (e) => {
    console.log({ inputVal });
    // alert({testVal})
    e.preventDefault();
  };

  return (
      <div className={styles.mainContainer}>
        <form className={styles.form} onSubmit={handleSubmit}>
          {children}
        </form>
      </div>
  );
}
