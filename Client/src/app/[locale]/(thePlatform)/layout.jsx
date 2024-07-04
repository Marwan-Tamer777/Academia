// fast refresh for testing, (should be removed in production)
// @refresh reset

import { ThemeProvider } from "@/context/ThemeContext";

import { useLocale } from "next-intl";
import { Cairo } from "next/font/google";

import {SidePanal} from "@/components/(platform)/Common/SidePanal/SidePanal";

export default function RootLayout({ children, dir = "rtl" }) {
  const locale = useLocale();

  {
    locale === "en" ? (dir = "ltr") : "";
  }
  return (
    <ThemeProvider>
      <div className="platformContainer" dir={dir}>
        <SidePanal />
        {children}
        {/* <Background /> */}
      </div>
    </ThemeProvider>
  );
}
