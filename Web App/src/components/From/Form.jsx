import styles from "./Form.module.css";
import { Cairo } from "next/font/google";

const cairo = Cairo({ subsets: ["arabic"] });

export default function form() {
  return (
    <div className={styles.mainContainer}>
      <div className={styles.container}>
        <div className={styles.header}>
            <img src=".../public/logo.png" alt="logo" />
          <h1 className={styles.h1}>مرحبا بك في أكاديميا!</h1>
          <p className={styles.p}>
            لقد كنَّا نفتقدك! اكتشف آخر الأخبار والمستجدات بتسجيل الدخول الآن
          </p>
        </div>
        <form className={styles.form}>
          <label htmlFor="username">البريد الإلكتروني</label>
          <input
            type="username"
            name="username"
            placeholder="أدخل بريدك الإلكتروني"
          />
          <label htmlFor="password"> كلمة المرور</label>
          <input
            type="password"
            name="password"
            placeholder="أدخل كلمة المرور"
          />
        </form>
      </div>
    </div>
  );
}
