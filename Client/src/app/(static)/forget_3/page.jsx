import styles from "./page.module.css";
import Form from "@/components/Form/Form";
import Button from "@/components/Button/Button";
import Input from "@/components/Input/Input";
import FormHead from "@/components/FormHead/FormHead";

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
