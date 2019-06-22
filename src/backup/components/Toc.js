import React from 'react';
import Scrollspy from 'react-scrollspy';


const Toc = () => {
  return (<div>

    <div>
      <section style={{ height: "1000px" }} id="section-1">section 1 Lorem ipsum dolor sit amet consectetur adipisicing elit. Provident ut, quam alias laborum aperiam dignissimos itaque! Consequatur laborum corporis obcaecati hic incidunt consectetur, quibusdam minus pariatur eligendi fuga repellendus asperiores?</section>
      <section id="section-2">section 2</section>
      <section id="section-3">section 3</section>
    </div>

    <Scrollspy items={['section-1', 'section-2', 'section-3']} currentClassName="is-current">
      <li><a href="#section-1">section 1</a></li>
      <li><a href="#section-2">section 2</a></li>
      <li><a href="#section-3">section 3</a></li>
    </Scrollspy>

  </div>);
}

export default Toc;