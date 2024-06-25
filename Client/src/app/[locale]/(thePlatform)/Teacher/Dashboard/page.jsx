// for fast refresh (remove this line after finish edit)
// @refresh reset

import React from 'react'
import styles from './page.module.css'
// import { SidePanal } from '@/components/(platform)/SidePanal/SidePanal'
import  Banar  from '@/components/(platform)/Banar/Banar'

import { useTranslations } from 'next-intl'

export default function Page() {

  return (
    <div className={styles.container}>
        <Banar />
        {/* <SidePanal /> */}
    </div>
  )
}
