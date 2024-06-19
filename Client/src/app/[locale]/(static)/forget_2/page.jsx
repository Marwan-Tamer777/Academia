import styles from "./page.module.css";
import Form from "@/components/LoginPages/Form/Form";
import Button from "@/components/LoginPages/Button/Button";
import OTP from "@/components/LoginPages/OTP/OTP";
import FormHead from "@/components/LoginPages/FormHead/FormHead";

export default function forget_2() {
  return (

    <div className={styles.mainContainer}>
      <Form>
        <FormHead
          title="رمز التحقق - OTP"
          sub="أدخل الرمز الذي أرسلناه إلي عناو بريد التالي"
        />
        <OTP />
        <Button text="تحقق من الرمز" />
          <a href="/" style={{ color: "#ff7e31", textDecoration:"none" }}>
            إعادة إرسال الرمز - 35 ثانية
          </a>
      </Form>
    </div>
  );
}
