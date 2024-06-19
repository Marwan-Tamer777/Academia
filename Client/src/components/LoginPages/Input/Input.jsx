"use client";
import{ useState } from "react";
import { Eye, EyeSlash } from "iconic-react";
import styles from "./Input.module.css";
import InputContext from "@/context/InputContext";
import Form from '../Form/Form'


export default function Input({ type, text }) {
  const [inputVal, setInputVal] = useState("");
  const [visible, setVisible] = useState();

  const inputValues = {inputVal, setInputVal}

  {
    if (type == "password") {
      // this return password input field
      return (
        <section className={styles.section}>
          <InputContext.Provider value={inputValues}>
            <Form />
          </InputContext.Provider>
          <label htmlFor={type}>{text}</label>
          <div className={styles.password}>
            <input
              className={styles.input}
              value={inputVal}
              type={visible ? "text" : "password"}
              name={type}
              // id="password"
              placeholder={text}
              onChange={(e) => setInputVal(e.target.value)}
            />
            {/* Eye Icon */}
            <div
              className={styles.icon}
              onClick={() => setVisible(!visible)}
              style={{ cursor: "pointer" }}
            >
              {visible ? <EyeSlash /> : <Eye />}
            </div>
          </div>
        </section>
      );
    } else {
      // this return text input field
      return (
        <section className={styles.section}>
          <label htmlFor={type} className={styles.label}>
            {text}{" "}
          </label>
          <input
            className={styles.input}
            value={inputVal}
            type={type}
            name={type}
            placeholder={text}
            onChange={(e) => setInputVal(e.target.value)}
          />
        </section>
      );
    }
  }
}
