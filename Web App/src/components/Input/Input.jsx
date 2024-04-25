import styles from "./Input.module.css";

export default function Input({ type, text }) {
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
