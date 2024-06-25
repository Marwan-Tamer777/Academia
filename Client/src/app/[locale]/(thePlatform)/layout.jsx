import Background from "../../../components/LoginPages/Background/Background";

import { ThemeProvider } from "@/context/ThemeContext";

import { useLocale } from "next-intl";
import { Cairo } from "next/font/google";


export default function RootLayout({ children, dir = "rtl" }) {
  const locale = useLocale();

  {
    locale === "en" ? (dir = "ltr") : "";
  }
  return (
    <div /*className="loginContainer"*/ dir={dir}>
      <ThemeProvider>
        {children}
        <Background />
      </ThemeProvider>
    </div>
  );
}
