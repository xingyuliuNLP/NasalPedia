import React from 'react'

export default function hoc(Wrapped, Wrapper2, arg1) {
  return (props) => (
    // this is from the react router
    < div >
      {console.log(props)}

      <Wrapped {...props} />
      <Wrapper2 />
      {arg1}
      {/* arg1 */}
    </div >
  )
}
