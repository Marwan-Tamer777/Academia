import * as React from "react"
const SvgComponent = (props) => (
  <svg
    xmlns="http://www.w3.org/2000/svg"
    width={15}
    height={15}
    fill="none"
  >
    <g clipPath="url(#a)">
      <path
        stroke="currentColor"
        strokeLinecap="round"
        strokeLinejoin="round"
        d="M3.5 7.5V4.87A3.93 3.93 0 0 1 7.5 1a3.93 3.93 0 0 1 4 3.87V7.5m-2 5.25a2 2 0 0 0 2-2V8.5m-2 4.25A1.25 1.25 0 0 1 8.25 14h-1.5a1.25 1.25 0 0 1 0-2.5h1.5a1.25 1.25 0 0 1 1.25 1.25ZM2 6h1a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-.5.5H2a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1Zm11 4h-1a.5.5 0 0 1-.5-.5v-3A.5.5 0 0 1 12 6h1a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1Z"
      />
    </g>
    <defs>
      <clipPath id="a">
        <path fill="currentColor" d="M.5.5h14v14H.5z" />
      </clipPath>
    </defs>
  </svg>
)
export default SvgComponent
