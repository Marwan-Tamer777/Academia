import Image from "next/image";
import Pattern from "/public/Background/Pattern.svg";

export default function Background() {
  return (
    <Image
      alt="Background"
      src={Pattern}
      // placeholder="blur"
      quality={100}
      // fill
      // sizes="100vw"
      style={{
        objectFit: 'cover',
        zIndex: -1,
        position: 'fixed',
        height: '100%',
        width: '100%',
        inset: '0px',
      }}
    />
  );
}
