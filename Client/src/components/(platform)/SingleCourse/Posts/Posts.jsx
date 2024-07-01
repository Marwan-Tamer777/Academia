import React from "react";
import styles from "./Posts.module.css";

import Image from "next/image";
import Avatar from "/public/(platform)/sidePanal/Avatar.svg";

// components

import CommentBtn from "@/components/(platform)/SingleCourse/Posts/SC_components/CommentBtn/commentBtn";

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

// main function Posts
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

// add post
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
        <div style={{ width: "42px" }}></div>
        <input
          className={styles.input}
          type="text"
          placeholder="أكتب ما بداخلك"
        />
        <div onClick={""} className={styles.submitPost} /*type="submit"*/>
          {" "}
          <Submit /> {/* svg */}
        </div>
      </form>
    </div>
  );
}

// user
export async function User({ postedBy }) {
  // user data for post, comments, create post & comment
  const user = await getUserById({ userID: postedBy });

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

// single post
export async function SinglePost({ data }) {
  return (
    <div className={styles.posts}>
      {data.map((post) => (
        <div className={styles.singlePost} key={post.id}>
          <User postedBy={post.postedBy} />
          <div className={styles.post}>
            <div style={{display: 'flex', width: '42px'}}></div>
            <div>
              <h3>{post.title}</h3>
              <p>
                {post.content}هذا النص هو مثال لنص يمكن أن يستبدل في نفس
                المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن
                تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد
                الحروف التى يولدها التطبيق.{" "}
              </p>
            </div>
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
            <CommentBtn />
          </div>
          <Comments />
        </div>
      ))}
    </div>
  );
}

//  comments

export async function Comments() {
  const data = await fetchData({ route: "comments" });
  return (
    <div className={styles.commentsContainer}>
      <div className={styles.comments}>
        {data.map((comment, index) => (
          <div className={styles.singleComment} key={index}>
            <User postedBy={comment.postedBy} />
            <div className={styles.comment}>
              <p>{comment.content}</p>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
