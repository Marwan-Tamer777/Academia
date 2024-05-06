// import IconButton from "@material-ui/core/IconButton";
// import InputLabel from "@material-ui/core/InputLabel";
// import Visibility from "@material-ui/icons/Visibility";
// import InputAdornment from "@material-ui/core/InputAdornment";
// import VisibilityOff from "@material-ui/icons/VisibilityOff";
// import Input from "@material-ui/core/Input";

// const showPassword = () => {
// 	const [values, setValues] = useState({
// 		password: "",
// 		showPassword: false,
// 	});

// 	const handleClickShowPassword = () => {
// 		setValues({
// 			...values,
// 			showPassword: !values.showPassword,
// 		});
// 	};

// 	const handleMouseDownPassword = (event) => {
// 		event.preventDefault();
// 	};

// 	const handlePasswordChange = (prop) => (event) => {
// 		setValues({
// 			...values,
// 			[prop]: event.target.value,
// 		});
// 	};

// 	return (
// 		<div
// 			style={{
// 				marginLeft: "30%",
// 			}}
// 		>
// 			<h4>
// 				How to show and hide password in ReactJS?
// 			</h4>
// 			<InputLabel htmlFor="standard-adornment-password">
// 				Enter your Password
// 			</InputLabel>
// 			<Input
// 				type={
// 					values.showPassword
// 						? "text"
// 						: "password"
// 				}
// 				onChange={handlePasswordChange("password")}
// 				value={values.password}
// 				endAdornment={
// 					<InputAdornment position="end">
// 						<IconButton
// 							onClick={
// 								handleClickShowPassword
// 							}
// 							onMouseDown={
// 								handleMouseDownPassword
// 							}
// 						>
// 							{values.showPassword ? (
// 								<Visibility />
// 							) : (
// 								<VisibilityOff />
// 							)}
// 						</IconButton>
// 					</InputAdornment>
// 				}
// 			/>
// 		</div>
// 	);
// };

// export default showPassword;

"use client";
import React, { useState } from "react";
import styles from "./ShowPassword.module.css";
import { Eye, EyeSlash, Pointer } from "iconic-react";

export default function ShowPassword() {
  const [password, setPassword] = useState("");
  const [visible, setVisible] = useState();

  return (
    <div className={styles.container}>
      <label htmlFor="password">Password</label>
      <div>
        <input
          value={password}
          type={visible ? "text" : "password"}
          id="password"
          placeholder="password"
          onChange={(e) => setPassword(e.target.value)}
        />
        <div
          onClick={() => setVisible(!visible)}
          style={{ cursor: "pointer", position: "flex" }}
        >
          {visible ? <EyeSlash /> : <Eye />}
        </div>
      </div>
    </div>
  );
}
