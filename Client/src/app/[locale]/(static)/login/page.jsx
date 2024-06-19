import { Cairo } from "next/font/google";
import styles from "./page.module.css";
import Image from "next/image";
import Logo from "/public/logo.png";
import React from "react";
import classNames from "classnames";
import Link from "next/link";

const cairo = Cairo({ subsets: ["arabic"] });

export default function login() {
  let fullPage = classNames(cairo.className, styles.mainContainer);

  return (
      <div className={fullPage}>
        <Image className={styles.logo} src={Logo} alt="Logo" />
        <div className={styles.container}>
          <div className={styles.formHeader}>
            <h1 className={styles.h1}>مرحبًا بك في أكاديميا!</h1>
            <p className={styles.p}>
              لقد كنّا نفتقدك! اكتشف آخر الأخبار والمستجدات بتسجيل الدخول الآن{" "}
            </p>
          </div>
          <form className={styles.formBody}>
            <section className={styles.section}>
              <label htmlFor="username" className={styles.label}>
                البريد الإلكتروني
              </label>
              <input
                className={styles.input}
                type="username"
                name="username"
                placeholder="أدخل بريدك الإلكتروني"
              />
            </section>
            <section className={styles.section}>
              <label htmlFor="password" className={styles.label}>
                {" "}
                كلمة المرور
              </label>
              <input
                className={styles.input}
                type="password"
                name="password"
                placeholder="أدخل كلمة المرور"
              />
            </section>
            <section className={styles.underForm}>
              <section className={styles.rememberMe}>
                <input type="checkbox" className={styles.checkBox} />
                <label htmlFor="rememberMe">تذكرني</label>
              </section>
              {/* <label htmlFor="Forget" style={{ cursor: "pointer" }}>
              نسيت كلمةالمرور
            </label> */}
              <Link
                href="/forget_1"
                style={{
                  textDecoration: "none",
                  color: "var(--primary-color)",
                }}
              >
                نسيت كلمةالمرور
              </Link>
            </section>
          </form>
          <button className={styles.button}>تسجيل الدخول</button>
          <p style={{ fontSize: "14px", color: "#1D3149CC" }}>
            ليس لديك حساب؟{" "}
            <a href="/" style={{ color: "#ff7e31" }}>
              تواصل مع الدعم
            </a>
          </p>{" "}
        </div>
      </div>
  );
}
