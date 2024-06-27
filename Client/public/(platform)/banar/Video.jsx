import * as React from "react";
const SvgComponent = (props) => (
  <svg xmlns="http://www.w3.org/2000/svg" width={15} height={15} fill="none">
    <g
      stroke="currentColor"
      strokeLinecap="round"
      strokeLinejoin="round"
      strokeWidth={1.2}
      clipPath="url(#a)"
    >
      <path d="M1.22 6.639a6.506 6.506 0 0 0 0 1.593m2.505-5.933c.425-.321.889-.589 1.38-.797M1.678 4.93c.208-.49.475-.954.796-1.38m3.15 5.714V5.736c0-.408.474-.666.86-.468l3.44 1.765a.515.515 0 0 1 0 .934l-3.44 1.765c-.386.198-.86-.06-.86-.468Z" />
      <path d="M7.622 1c3.55 0 6.427 2.91 6.427 6.5S11.172 14 7.622 14c-2.446 0-4.573-1.382-5.66-3.416" />
    </g>
    <defs>
      <clipPath id="a">
        <path fill="none" d="M.61.5h14v14h-14z"  />
      </clipPath>
    </defs>
  </svg>
);
export default SvgComponent;
