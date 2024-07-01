import { Cairo } from "next/font/google";
import styles from "./page.module.css";
import Image from "next/image";
import Logo from "/public/logo.png";
import React from "react";
import classNames from "classnames";
import Link from "next/link";
// for api handling
import { redirect } from "next/navigation";
import { getSession, signin } from "./actions";

const cairo = Cairo({ subsets: ["arabic"] });

// async function getSession() {
//   const response = await fetch("https://academia-hvno.onrender.com/api/auth/login", {
//     method: "POST",
//     headers: {
//       "Content-Type": "application/json"
//     },
//     body: JSON.stringify({
//       email: "your_email",
//       password: "your_password"
//     })
//   });
//   const data = await response.json();
//   console.log(data);

//   return data;
// }

// async function cardData() {
//   const dataFetsh = await fetch(
//     "https://academia-hvno.onrender.com/api/courses/user/75a669da-5b0c-487c-a623-1d97f85afbf8"
//   );
//   const data = await dataFetsh.json();
//   // data.then((res) => { return res })
//   console.log(data);

//   return data;
// }

export default async function login() {
  const fullPage = classNames(cairo.className, styles.mainContainer);
  // const session = await getSession();

  return (
    <div className={fullPage}>
      {/* title and logo */}
      <Image className={styles.logo} src={Logo} alt="Logo" />
      <div className={styles.container}>
        <div className={styles.formHeader}>
          <h1 className={styles.h1}>مرحبًا بك في أكاديميا!</h1>
          <p className={styles.p}>
            لقد كنّا نفتقدك! اكتشف آخر الأخبار والمستجدات بتسجيل الدخول الآن{" "}
          </p>
        </div>
        {/* The Form fields */}
        <form
          className={styles.formBody}
          // action={async (formData) => {
          //   "use server";
          //   await signin(formData);
          //   redirect("/ar/landing_page");
          // }}
          action={signin}
          method="post"
          >
          <section className={styles.section}>
            <label htmlFor="email" className={styles.label}>
              البريد الإلكتروني
            </label>
            <input
              className={styles.input}
              type="email"
              name="email"
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
            <Link
              href="/ar/forget_1"
              style={{
                textDecoration: "none",
                color: "var(--primary-color)",
              }}
            >
              نسيت كلمةالمرور
            </Link>
          </section>
          <button type="submit" className={styles.button}>
            تسجيل الدخول
          </button>
        </form>
        {/* <pre>{JSON.stringify(session, null, 2)}</pre> */}
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
