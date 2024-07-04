
import React from 'react';
import ShortCutsPanal from '@/components/(platform)/Common/ShortCutsPanal/ShortCutsPanal';

export default function RootLayout({ children }) {

  return (
      <div className='coursesContainer'>
        {children}
        
        <ShortCutsPanal />
      </div>
  );
}
