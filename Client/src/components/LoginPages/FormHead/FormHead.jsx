import styles from "./FormHead.module.css";

export default function FormHead({ title, sub }) {
  return (
    <div className={styles.formHeader}>
      <h1 className={styles.h1}>{title}</h1>
      <p className={styles.p}>{sub} </p>
    </div>
  );
}
