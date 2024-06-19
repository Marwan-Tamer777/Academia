'use client';
import React, { useState } from 'react';
import styles from './Test.module.css';
import { UserCirlceAdd } from 'iconic-react';

const tabsData = [
  { id: 1, title: 'Tab 1', content: 'Content for Tab 1' },
  { id: 2, title: 'Tab 2', content: 'Content for Tab 2' },
  { id: 3, title: 'Tab 3', content: 'Content for Tab 3' },
];

const Test = () => {
  const [activeTab, setActiveTab] = useState(tabsData[0].id);

  const handleTabClick = (tabId) => {
    setActiveTab(tabId);
  };

  return (
    <div className={styles.tabsContainer}>
      <div className={styles.tabs}>
        {tabsData.map((tab) => (
          <div
            key={tab.id}
            className={`${styles.tab} ${activeTab === tab.id ? styles.active : ''}`}
            onClick={() => handleTabClick(tab.id)}
          >
            {tab.title}
          </div>
        ))}
      </div>
      <div className={styles.contentContainer}>
        {tabsData.map((tab) => (
          <div
            key={tab.id}
            className={`${styles.tabContent} ${activeTab === tab.id ? styles.active : ''}`}
          >
            {tab.content}
          </div>
        ))}
      </div>
    </div>
  );
};

export default Test;
