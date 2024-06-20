import styles from "./page.module.css";
import Form from "@/components/LoginPages/Form/Form";
import Button from "@/components/LoginPages/Button/Button";
import Input from "@/components/LoginPages/Input/Input";
import FormHead from "@/components/LoginPages/FormHead/FormHead";

export default function forget_3() {
  return (
    <div className={styles.mainContainer}>
      <Form>
        <FormHead
          title="كلمة المرور الجديدة"
          sub="قم بإنشاء كلمة مرور جديدة لتسجيل الدخول"
        />
        <Input text="كلمة المرور" type="password" />
        <Input text="تأكيد كلمة المرور" type="password" />
        <Button text="إعادة تعيين كلمة المرور" />

      </Form>
    </div>
  );
}
