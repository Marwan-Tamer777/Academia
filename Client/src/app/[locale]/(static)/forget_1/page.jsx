import styles from "./page.module.css";
import Form from "@/components/LoginPages/Form/Form";
import Button from "@/components/LoginPages/Button/Button";
import Input from "@/components/LoginPages/Input/Input";
import FormHead from "@/components/LoginPages/FormHead/FormHead";
import { Login } from "iconic-react";

export default function forget_1() {
  return (
      <div className={styles.mainContainer}>
        <Form>
          <FormHead
            title="تحقق من بريدك الإلكتروني"
            sub="أدخل بريدك الإلكتروني لإرسال رمز التأكيد"
          />
          <Input text="البريد الإلكتروني" type="username" />
          <div className={styles.button}>
            <Button text="إرسال الرمز" />
          </div>
          <p style={{ fontSize: "14px", color: "#1D3149CC" }}>
            ليس لديك حساب؟{" "}
            <a href="/" style={{ color: "#ff7e31" }}>
              تواصل مع الدعم
            </a>
          </p>{" "}
        </Form>
      </div>
  );
}
