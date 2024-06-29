import React from "react";
import styles from "./Posts.module.css";

import Avatar from "/public/(platform)/sidePanal/Avatar.svg";

import Image from "next/image";

// icons
import Like from "/public/(platform)/posts/icons.svg";
import LikeBigger from "/public/(platform)/posts/iconsBigger.svg";
import Comment from "/public/(platform)/posts/CommentSvg.jsx";
import Submit from "/public/(platform)/posts/SubmitSvg.jsx";

// api
import {
  fetchData,
  getUserById,
} from "@/components/(platform)/Common/API/fetch";

export default async function Posts() {
  const data = await fetchData({ route: "posts" });
  return (
    <div className={styles.mainContainer}>
      <div className={styles.header}>
        <h1>منهجيات البحث العلمي</h1>
        <p className={styles.courseCode}>IS1545</p>
      </div>
      <AddPost />
      <div className={styles.header}>
        <h1>منشورات</h1>
      </div>
      <SinglePost data={data} />
    </div>
  );
}
export function AddPost() {

  return (
    <div className={styles.addPost}>
      <div className={styles.user}>
        <Image src={Avatar} />
        <div className={styles.info}>
          <span>عبدالرحمن محمد أحمد</span>
          <p>مشرف</p>
        </div>
      </div>
      <form className={styles.inputForm}>
        <input
          className={styles.input}
          type="text"
          placeholder="أكتب ما بداخلك"
        />
        <div onClick={''} className={styles.submitPost} /*type="submit"*/>
          {" "}
          <Submit />
        </div>
      </form>
    </div>
  );
}

export async function User({ post }) {
  const user = await getUserById({ userID: post.postedBy });
  return (
    <div className={styles.user}>
      <Image src={Avatar} />
      <div className={styles.info}>
        <span className={styles.userName}>{user.name}</span>
        <p className={styles.userRole}>{user.title}</p>
      </div>
    </div>
  );
}

export async function SinglePost({ data }) {
  return (
    <div className={styles.posts}>
      {data.map((post, index) => (
        <div className={styles.singlePost} key={index}>
          <User post={post} />
          <div className={styles.post}>
            <h3>{post.title}</h3>
            <p>
              {post.content}هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة،
              لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل
              هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف
              التى يولدها التطبيق.{" "}
            </p>
          </div>
          <div className={styles.numLikesComments}>
            <p className={styles.like}>
              <Image src={Like} />
              {post.likes}دعم
            </p>
            <p className={styles.like}>{post.comments}تعليق</p>
          </div>
          <hr className={styles.line} />
          <div className={styles.doLikesComments}>
            <button className={styles.button}>
              <Image src={LikeBigger} />
              أدعم
            </button>
            <button className={styles.button}>
              <Comment />
              التعليقات
            </button>
          </div>
        </div>
      ))}
    </div>
  );
}

export async function Comments() {
  return (
    <div className={styles.comments}>
      <div className={styles.user}>
        <Image />
        <h3>UserName</h3>
        <h6>UserRole</h6>
      </div>
      <div className={styles.comment}>
        <p>Comment</p>
      </div>
    </div>
  );
}

// export async function getStaticPaths() {
//     return {
//         paths: [],
//         fallback: true,
//     };

// }

// export async function getStaticProps() {
//     const data = await fetchData({ route: "posts" });
//     return {
//         props: {
//         data,
//         },
//     };
// }
