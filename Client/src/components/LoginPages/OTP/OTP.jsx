"use client";

// import e from "express";
import styles from "./OTP.module.css";
import { useState } from "react";

export default function OTP() {
  const [otp, setOtp] = useState(new Array(4).fill(""));

  function handleChange(e, index) {
    if (isNaN(e.target.value)) return false;

    setOtp([
      ...otp.map((data, indx) => (indx === index ? e.target.value : data)),
    ]);

    if (e.target.value && e.target.nextSibling) {
      e.target.nextSibling.focus();
    }
  }

  return (
      <div className={styles.otp_area}>
        {otp.map((data, i) => {
          return (
            <input
              className={styles.input}
              type="text"
              value={data}
              maxLength={1}
              onChange={(e) => handleChange(e, i)}
            />
          );
        })}
      </div>
  );
}
