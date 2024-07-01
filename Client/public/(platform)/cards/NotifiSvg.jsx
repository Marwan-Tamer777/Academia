import * as React from "react"
const SvgComponent = (props) => (
  <svg
    xmlns="http://www.w3.org/2000/svg"
    width={14}
    height={15}
    fill="none"
    {...props}
  >
    <g clipPath="url(#a)">
      <path
        stroke="#1D3149"
        strokeLinecap="round"
        strokeLinejoin="round"
        d="M9.933 8.5v1.534c0 .39.155.766.432 1.042.276.277.744.432 1.135.432H.5c.391 0 .859-.155 1.135-.432a1.47 1.47 0 0 0 .432-1.042V6.433A3.933 3.933 0 0 1 6 2.5M5 14h2m3.75-8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5Z"
      />
    </g>
    <defs>
      <clipPath id="a">
        <path fill="#fff" d="M0 .5h14v14H0z" />
      </clipPath>
    </defs>
  </svg>
)
export default SvgComponent
