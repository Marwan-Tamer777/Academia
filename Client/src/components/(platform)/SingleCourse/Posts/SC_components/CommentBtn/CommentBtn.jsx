"use client";
// import React, { createContext } from "react";
import Comment from "/public/(platform)/posts/CommentSvg.jsx";
import styles from "@/components/(platform)/SingleCourse/Posts/Posts.module.css";

// export const displayContext = createContext();


export default function CommentBtn() {
    // const { comment, setComment } = displayContext('none');
    const commentHandler = () => {
        // { comment === 'none' ? setComment('flex') : setComment('none') }
    }
    return (
        <button className={styles.button} onClick={commentHandler}>
            <Comment />
            {/* svg */}
            التعليقات
        </button>
    );
}



// //  comments
// import React, { createContext } from "react";
// import styles from "./Posts.module.css";

// // Rest of the code...

// // Create a new context
// const CommentsContext = createContext();

// // Comments provider component
// export function CommentsProvider({ children }) {
//     // Fetch comments data
//     const fetchData = async () => {
//         // Fetch comments data from the API
//         const data = await fetchCommentsData();
//         return data;
//     };

//     // Fetch comments data when the component mounts
//     useEffect(() => {
//         fetchData();
//     }, []);

//     return (
//         <CommentsContext.Provider value={/* Pass the fetched comments data here */}>
//             {children}
//         </CommentsContext.Provider>
//     );
// }

// // Comments component
// export async function Comments() {
//     const data = await fetchData({ route: "comments" });
//     return (
//         <CommentsContext.Consumer>
//             {(commentsData) => (
//                 <div className={styles.commentsContainer}>
//                     <div className={styles.comments}>
//                         {commentsData.map((comment, index) => (
//                             <div className={styles.singleComment} key={index}>
//                                 <User postedBy={comment.postedBy} />
//                                 <div className={styles.comment}>
//                                     <p>{comment.content}</p>
//                                 </div>
//                             </div>
//                         ))}
//                     </div>
//                 </div>
//             )}
//         </CommentsContext.Consumer>
//     );
// }