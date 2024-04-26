import styles from "./page.module.css";
import Form from "@/components/Form/Form";
import Button from "@/components/Button/Button";
import OTP from "@/components/OTP/OTP";
import FormHead from "@/components/FormHead/FormHead";

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
