import styles from "./page.module.css";
import HeroSection from "@/components/lnading_page/1_HeroSection/HeroSection";
import Features from "@/components/lnading_page/2_Features/Features";
import Control from "@/components/lnading_page/3&4_Control/Control";
import Flexibility from "@/components/lnading_page/5_Flexibility/Flexibility";
import Download from "@/components/lnading_page/6_DownloadNow/Download";
import Why from "@/components/lnading_page/7_Why/Why";
import FAQ from "@/components/lnading_page/8_FAQ/FAQ";
import Team from "@/components/lnading_page/9_Team/Team";
import TheLine from "@/components/lnading_page/10_TheLine/TheLine";
import Footer from "@/components/lnading_page/11_Footer/Footer";
// import Test from '@/components/lnading_page/Test/Test'

import { useTranslations, useLocale } from "next-intl";



export default function page({dir}) {
  const locale = useLocale();

  {locale === 'en' ? dir = 'ltr': '' }
  return (
      <div className={styles.mainContainer} style={{direction: `${dir}`}}>
        <HeroSection />
        <Features />
        <Control />
        <Control education={true} />
        <Flexibility />
        <Download />
        <Why />
        <FAQ />
        <Team />
        <TheLine />
        <Footer />
        {/* <Test /> */}
      </div>
  );
}
