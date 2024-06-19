import Background from "../../../components/LoginPages/Background/Background";


export default function RootLayout({ children }) {
  return (
    <div className="loginContainer">
      {children}
      <Background />
    </div>
  );
}
