import * as React from "react"
const SvgComponent = (props) => (
  <svg
    xmlns="http://www.w3.org/2000/svg"
    width={24}
    height={24}
    fill="none"
    {...props}
  >
    <path
      fill="#4D4D4D"
      fillOpacity={0.8}
      fillRule="evenodd"
      d="M2 12.986a.684.684 0 0 0 .427.612l17.638 7.182a.684.684 0 0 0 .89-.894l-2.63-6.39-5.945.187a1.025 1.025 0 0 1-.065-2.048l5.946-.189 2.222-6.541a.684.684 0 0 0-.947-.836l-17.15 8.28a.683.683 0 0 0-.386.637Z"
      clipRule="evenodd"
    />
  </svg>
)
export default SvgComponent
