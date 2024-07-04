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
        d="M7.072 0a1.286 1.286 0 0 0-1.286 1.286v.643a1.286 1.286 0 0 0 1.286 1.285h3.857a1.286 1.286 0 0 0 1.286-1.285v-.643A1.286 1.286 0 0 0 10.929 0H7.072ZM4.179 1.286h-.643a1.929 1.929 0 0 0-1.929 1.928v12.857A1.928 1.928 0 0 0 3.536 18h10.929a1.929 1.929 0 0 0 1.928-1.929V3.214a1.929 1.929 0 0 0-1.928-1.928h-.643v.643a2.893 2.893 0 0 1-2.893 2.892H7.072A2.893 2.893 0 0 1 4.179 1.93v-.643Zm8.614 6.3a.965.965 0 0 1 .193 1.35l-3.857 5.143a.965.965 0 0 1-1.306.223l-1.929-1.285a.966.966 0 0 1 .342-1.755.964.964 0 0 1 .728.15l1.17.78 3.31-4.413a.964.964 0 0 1 1.35-.193Z"
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
