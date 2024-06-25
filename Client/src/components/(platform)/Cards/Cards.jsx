import React from "react";
import styles from "./Cards.module.css";

// const data = [
//   {
//     img: "https://via.placeholder.com/150",
//     title: "Title 1",
//     subTitle: "Sub Title",
//     text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque.",
//   },
//   {
//     img: "https://via.placeholder.com/150",
//     title: "Title 2",
//     subTitle: "Sub Title",
//     text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque.",
//   },
//   {
//     img: "https://via.placeholder.com/150",
//     title: "Title 3",
//     subTitle: "Sub Title",
//     text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque.",
//   },
//   {
//     img: "https://via.placeholder.com/150",
//     title: "Title 4",
//     subTitle: "Sub Title",
//     text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque.",
//   },
//   {
//     img: "https://via.placeholder.com/150",
//     title: "Title 5",
//     subTitle: "Sub Title",
//     text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque.",
//   },
//   {
//     img: "https://via.placeholder.com/150",
//     title: "Title 6",
//     subTitle: "Sub Title",
//     text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque.",
//   },
// ];

async function cardData() {
    const dataFetsh = await fetch('https://jsonplaceholder.typicode.com/posts')
    const data = await dataFetsh.json()
    // data.then((res) => { return res })
    return data;
    
}

export default async function Cards() {
     const data = await cardData();
  return (
    <div className={styles.mainContainer}>
      <div className={styles.header}>
        <h2>Our Best Sellers</h2>
      </div>
      <div className={styles.container}>
        {data.map((item, index) => {
          return (
            <div key={index} className={styles.card}>
              <div className={styles.cardImg}>
                {/* <img src={item.img} alt={item.title} /> */}
              </div>
              <div className={styles.cardItemText}>
                <h3>{item.title}</h3>
                {/* <h6>{item.subTitle}</h6> */}
                <p>{item.body}</p>
              </div>
            </div>
          );
        })}
      </div>
    </div>
  );
}
