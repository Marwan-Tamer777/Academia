import * as React from "react"
const SvgComponent = (props) => (
  <svg
    xmlns="http://www.w3.org/2000/svg"
    width={20}
    height={20}
    fill="none"
    {...props}
  >
    <path
      fill="#EB5757"
      stroke="#EB5757"
      strokeLinecap="round"
      strokeLinejoin="round"
      d="M11.808 17.011a2.534 2.534 0 0 1-3.61 0L2.128 11c-4.057-4.06 1.243-13.029 7.873-6.397 6.62-6.619 11.92 2.348 7.873 6.397l-6.066 6.011Z"
    />
  </svg>
)
export default SvgComponent
