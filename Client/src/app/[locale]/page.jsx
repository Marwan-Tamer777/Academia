import React from "react";
import Head from "next/head";
import Link from "next/link";
// for translation
import {useTranslations} from 'next-intl';

import styles from "./page.module.css";


export default function Home() {

  const t = useTranslations('Index');

  return (
    <div className={styles.container}>
      <h1>{t('title')}</h1>;
      <Link
        style={{
          top: "50%",
          right: "50%",
          color: "white",
          textDecoration: "none",
        }}
        href="/ar/login"
      >
        login
      </Link>
      <Link
        style={{
          top: "50%",
          right: "50%",
          color: "white",
          textDecoration: "none",
        }}
        href="/ar/landing_page"
      >
        landing_page
      </Link>
      <Link
        style={{
          top: "50%",
          right: "50%",
          color: "white",
          textDecoration: "none",
        }}
        href="/ar/Teacher/Dashboard"
      >
        teacher dashboard
      </Link>
    </div>
  );
}

