import React from 'react'
import styles from './Page.module.css'
import Posts from '@/components/(platform)/SingleCourse/Posts/Posts'

export default function Page() {
  return (
    <div className={styles.container}>
      <Posts />
    </div>
  )
}
