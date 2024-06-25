import styles from "./SidePanal.module.css";

import classNames from "classnames";
import Image from "next/image";

// icons
import CloseMenu from "/public/(platform)/sidePanal/icons/CloseMenu.svg";

import { useTranslations } from "next-intl";


export const ClosePanal = () => {
    const t = useTranslations("platform.sidePanal");
    return (
      <div className={`${styles.buttomTabs} ${styles.closePanal}`} /*onClick={}*/>
        <Image
          style={{ margin: "3px 2px" }}
          width={15.556}
          height={14}
          src={CloseMenu}
        />
        {t("buttomTabs.0.name")}
      </div>
    );
  };