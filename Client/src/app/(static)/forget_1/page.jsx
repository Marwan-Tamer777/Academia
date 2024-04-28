import styles from "./page.module.css";
import Form from "@/components/Form/Form";
import Button from "@/components/Button/Button";
import Input from "@/components/Input/Input";
import FormHead from "@/components/FormHead/FormHead";

export default function forget_1() {
  return (
    <div className={styles.mainContainer}>
      <Form>
        <FormHead
          title="تحقق من بريدك الإلكتروني"
          sub="أدخل بريدك الإلكتروني لإرسال رمز التأكيد"
        />
        <Input text="البريد الإلكتروني" type="username" />
        <Button text="إرسال الرمز" />
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
