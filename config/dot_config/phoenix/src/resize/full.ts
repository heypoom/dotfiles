import {GAP, GAP_DOUBLED} from '../config'

import {show} from '../utils/modal'
import {getMenubarOffset} from '../utils/offset'

export function resizeFull() {
  const screen = Screen.main()
  const window = Window.focused()
  if (!window) return

  const screenFrame = screen.flippedVisibleFrame()
  const topOffset = getMenubarOffset(screen)

  window.setFrame({
    x: GAP,
    y: topOffset + GAP,
    width: screenFrame.width - GAP_DOUBLED,
    height: screenFrame.height - GAP_DOUBLED,
  })

  show('🖥')
}
