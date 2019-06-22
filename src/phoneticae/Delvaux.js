import React, { Component } from 'react';
import M from "materialize-css";

class Delvaux extends Component {

  componentDidMount() {
    const elems = document.querySelectorAll('.scrollspy');
    // Auto initialize all the things!
    M.ScrollSpy.init(elems, {});
  }

  render() {

    return (
      <div>

        <div class="row">

          <div class="col hide-on-small-only push-m1 m3 l3">

            <ul className="section table-of-contents pinned">
              <div style={{height:"100px"}}></div>
              <li><a href="#introduction">hehe</a></li>
              <li><a href="#structure">Structure</a></li>
              <li><a href="#initialization">Intialization</a></li>
            </ul>
          </div>


          <div class="col s12 m6 l8">
            <div id="introduction" class="section scrollspy table-of-contents">
                         <br/>
                         <br/>
              <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quae, rerum exercitationem sapiente consequuntur, nesciunt eos itaque quia animi laboriosam cupiditate asperiores ratione illo ipsa dolore quasi dolorum distinctio repudiandae perspiciatis et harum qui quidem voluptas. Quaerat autem ipsam facilis nemo asperiores non harum nesciunt deserunt, consectetur temporibus quo adipisci distinctio quis voluptatibus iure odit aliquid quibusdam ratione omnis maiores incidunt laudantium voluptate officiis dolorem? Minima aliquam ab aliquid, unde itaque quibusdam est dicta voluptatum ipsam mollitia placeat commodi non, rem incidunt asperiores animi, minus inventore officiis exercitationem ratione. Illum expedita maxime quis quam quas culpa placeat, autem doloremque exercitationem voluptates!</p>
            </div>

            <div id="structure" class="section scrollspy">
              <p>oh yearLorem ipsum dolor sit, amet consectetur adipisicing elit. Quae, rerum exercitationem sapiente consequuntur, nesciunt eos itaque quia animi laboriosam cupiditate asperiores ratione illo ipsa dolore quasi dolorum distinctio repudiandae perspiciatis et harum qui quidem voluptas. Quaerat autem ipsam facilis nemo asperiores non harum nesciunt deserunt, consectetur temporibus quo adipisci distinctio quis voluptatibus iure odit aliquid quibusdam ratione omnis maiores incidunt laudantium voluptate officiis dolorem? Minima aliquam ab aliquid, unde itaque quibusdam est dicta voluptatum ipsam mollitia placeat commodi non, rem incidunt asperiores animi, minus inventore officiis exercitationem ratione. Illum expedita maxime quis quam quas culpa placeat, autem doloremque exercitationem voluptates!</p>
            </div>

            <div id="initialization" class="flow-test section scrollspy">
              <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quae, rerum exercitationem sapiente consequuntur, nesciunt eos itaque quia animi laboriosam cupiditate asperiores ratione illo ipsa dolore quasi dolorum distinctio repudiandae perspiciatis et harum qui quidem voluptas. Quaerat autem ipsam facilis nemo asperiores non harum nesciunt deserunt, consectetur temporibus quo adipisci distinctio quis voluptatibus iure odit aliquid quibusdam ratione omnis maiores incidunt laudantium voluptate officiis dolorem? Minima aliquam ab aliquid, unde itaque quibusdam est dicta voluptatum ipsam mollitia placeat commodi non, rem incidunt asperiores animi, minus inventore officiis exercitationem ratione. Illum expedita maxime quis quam quas culpa placeat, autem doloremque exercitationem voluptates!</p>
            </div>

          </div>



        </div>




      </div>
    )
  }
}

export default Delvaux;