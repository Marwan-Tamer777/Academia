import * as React from "react"
const SvgComponent = (props) => (
  <svg
    xmlns="http://www.w3.org/2000/svg"
    width={17}
    height={17}
    fill="none"
    {...props}
  >
    <path
      stroke="currentColor"
      strokeLinecap="round"
      strokeLinejoin="round"
      d="M6.86 5.426C4.665 3.929 2.62 5.07.905 6.83L4.7 9.117m6.708.857c1.497 2.195.354 4.24-1.406 5.955l-2.285-3.795"
    />
    <path
      stroke="currentColor"
      strokeLinecap="round"
      strokeLinejoin="round"
      d="m6.368 6.237 4.228 4.229M4.7 9.106l3.029 3.028c2.423-1.451 5.177-2.857 6.434-4.16 2.72-2.72 1.143-6.445 1.143-6.445S11.579-.05 8.859 2.67C7.556 3.93 6.14 6.694 4.7 9.106Z"
    />
    <path
      stroke="currentColor"
      strokeLinecap="round"
      strokeLinejoin="round"
      d="M12.334 5.071a.572.572 0 1 0 0-1.143.572.572 0 0 0 0 1.143ZM4.54 14.717c-.663.64-3.635 1.212-3.635 1.212s.572-2.972 1.212-3.635a1.715 1.715 0 1 1 2.423 2.423Z"
    />
  </svg>
)
export default SvgComponent
