import React from "react";
import Head from "next/head";
import Link from "next/link";
// for translation
import {useTranslations} from 'next-intl';


export default function Home() {

  const t = useTranslations('Index');

  return (
    <div>
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
    </div>
  );
}
