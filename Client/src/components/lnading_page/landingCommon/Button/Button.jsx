import React from 'react'
import styles from './Button.module.css';

export default function Button({text, width='100%', background, color}) {
  return (
    <button style={{width: `${width}`, background: `${background}`, color: `${color}`, border: `${background}`}} className={styles.button}>
        {text}
    </button>
  )
}
