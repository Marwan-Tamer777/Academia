"use client";
import React, { useState } from "react";
import { Eye, EyeSlash } from "iconic-react";
import styles from "./Input.module.css";

export default function Password({ type, text }) {
  const [password, setPassword] = useState("");
  const [visible, setVisible] = useState();
  {
    if (type == "password") {
      return (
        <section className={styles.section}>
          <label htmlFor={type}>{text}</label>
          <div className={styles.password}>
            <input
              className={styles.input}
              value={password}
              type={visible ? "text" : "password"}
              name={type}
              // id="password"
              placeholder={text}
              onChange={(e) => setPassword(e.target.value)}
            />
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
      return (
        <section className={styles.section}>
          <label htmlFor={type} className={styles.label}>
            {text}{" "}
          </label>
          <input
            className={styles.input}
            type={type}
            name={type}
            placeholder={text}
          />
        </section>
      );
    }
  }
}
