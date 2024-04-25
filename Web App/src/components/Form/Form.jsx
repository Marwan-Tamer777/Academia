import styles from "./Form.module.css";
import { Cairo } from "next/font/google";

const cairo = Cairo({ subsets: ["arabic"] });

export default function Form({ children }) {
  return (
    <div className={styles.mainContainer}>
        <form className={styles.form}>{children}</form>
    </div>
  );
}
