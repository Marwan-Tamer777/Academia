import React from 'react'
import styles from './Page.module.css'
import Posts from '@/components/(platform)/SingleCourse/Posts/Posts'
import CommentBtn from '@/components/(platform)/SingleCourse/Posts/SC_components/CommentBtn/commentBtn'
export default function Page() {
  return (
    <div className={styles.container}>
      <Posts />
    </div>
  )
}
