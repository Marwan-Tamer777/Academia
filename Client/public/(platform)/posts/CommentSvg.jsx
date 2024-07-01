import * as React from "react"
const SvgComponent = (props) => (
  <svg
    xmlns="http://www.w3.org/2000/svg"
    width={21}
    height={20}
    fill="none"
    {...props}
  >
    <g clipPath="url(#a)">
      <path
        fill="currentColor"
        fillRule="evenodd"
        d="M3.903 0A2.143 2.143 0 0 0 1.76 2.143v12.741L.369 19.06a.714.714 0 0 0 .85.919l5.628-1.408h11.341a2.143 2.143 0 0 0 2.143-2.142V2.143A2.143 2.143 0 0 0 18.19 0H3.903Zm1.964 6.923c0-.494.4-.893.893-.893h8.571a.893.893 0 1 1 0 1.786H6.76a.893.893 0 0 1-.893-.893Zm.893 3.833a.893.893 0 0 0 0 1.785h5.714a.893.893 0 1 0 0-1.785H6.76Z"
        clipRule="evenodd"
      />
    </g>
    <defs>
      <clipPath id="a">
        <path fill="#fff" d="M.332 0h20v20h-20z" />
      </clipPath>
    </defs>
  </svg>
)
export default SvgComponent
