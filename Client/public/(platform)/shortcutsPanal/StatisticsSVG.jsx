import * as React from "react"
const SvgComponent = (props) => (
  <svg
    xmlns="http://www.w3.org/2000/svg"
    width={18}
    height={18}
    fill="none"
    {...props}
  >
    <g clipPath="url(#a)">
      <path
        fill="currentColor"
        fillRule="evenodd"
        d="M0 1.929A1.929 1.929 0 0 1 1.929 0H16.07A1.928 1.928 0 0 1 18 1.929v1.767H0V1.93Zm0 3.375h18v6.91a1.929 1.929 0 0 1-1.929 1.929h-2.815l2.211 2.211a.963.963 0 1 1-1.363 1.363l-3.574-3.574h-.566v2.893a.964.964 0 0 1-1.928 0v-2.893H7.47l-3.574 3.574a.964.964 0 0 1-1.363-1.363l2.211-2.211H1.93A1.929 1.929 0 0 1 0 12.214v-6.91Z"
        clipRule="evenodd"
      />
    </g>
    <defs>
      <clipPath id="a">
        <path fill="#fff" d="M0 0h18v18H0z" />
      </clipPath>
    </defs>
  </svg>
)
export default SvgComponent
