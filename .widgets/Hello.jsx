import {run, styled, css} from 'uebersicht'

export const className = css`
  left: 20px;
  top: 20px;

  color: #2d2d30;
  background: white;
  width: 180px;
  height: 35px;
  padding: 10px;
  font-family: Futura;
  font-size: 25px;
  user-select: none;

  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 50px;

  color: #2d2d30;
  // background: linear-gradient(to right, #f953c6, #b91d73);
  // box-shadow: 0 0 8px #b91d73CC;

  background: #ecf0f1;
  box-shadow: 0 0 8px rgba(0, 0, 0, 0.4);

  border-bottom: 4px solid #8e44ad;
`

export const command = () => {}
export const initialState = {init: false}
export const refreshFrequency = 1000

/**
 * @param {any} dispatch
 */
export function init(dispatch) {
  setTimeout(() => {
    let rootEl = document.querySelector('.widget-hello').parentElement
    rootEl.style.left = '20px'
    rootEl.style.top = '20px'

    makeDraggable(rootEl)

    console.log('-> Initialized.')
  }, 800)
}

/**
 * Make the widget dragable.
 *
 * @param {HTMLElement} element
 */
function makeDraggable(element) {
  var isMouseDown = false

  // initial mouse X and Y for `mousedown`
  let mouseX = 0
  let mouseY = 0

  // element X and Y before and after move
  var elementX = 0
  var elementY = 0

  // mouse button down over the element
  element.addEventListener('mousedown', onMouseDown)

  /**
   * Listens to `mousedown` event.
   *
   * @param {Object} event - The event.
   */
  function onMouseDown(event) {
    mouseX = event.clientX
    mouseY = event.clientY
    isMouseDown = true
  }

  // mouse button released
  element.addEventListener('mouseup', onMouseUp)

  /**
   * Listens to `mouseup` event.
   *
   * @param {Object} event - The event.
   */
  function onMouseUp(event) {
    isMouseDown = false
    elementX = parseInt(element.style.left) || 0
    elementY = parseInt(element.style.top) || 0
  }

  // need to attach to the entire document
  // in order to take full width and height
  // this ensures the element keeps up with the mouse
  document.addEventListener('mousemove', onMouseMove)

  /**
   * Listens to `mousemove` event.
   *
   * @param {Object} event - The event.
   */
  function onMouseMove(event) {
    if (!isMouseDown) return
    var deltaX = event.clientX - mouseX
    var deltaY = event.clientY - mouseY
    element.style.left = elementX + deltaX + 'px'
    element.style.top = elementY + deltaY + 'px'
  }
}

export const render = ({output, error}) => {
  if (error) return <div>Error!</div>

  /**
   * @param {number} n
   */
  let pad = (n) => String(n).padStart(2, 0)

  let now = new Date()
  let hh = pad(now.getHours())
  let mm = pad(now.getMinutes())
  let ss = pad(now.getSeconds())

  return (
    <div className="widget-hello">
      {hh}:{mm}:{ss}
    </div>
  )
}
