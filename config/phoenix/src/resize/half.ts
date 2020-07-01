import {GAP, GAP_DOUBLED} from '../config'

import {show} from '../utils/modal'
import {getMenubarOffset} from '../utils/offset'

const Config = {
  left: () => GAP,
  right: (width: number) => width / 2 + GAP / 2,
}

export function resizeHalf(position: 'left' | 'right') {
  const screen = Screen.main()
  const screenFrame = screen.flippedVisibleFrame()
  const window = Window.focused()
  if (!window) return

  const topOffset = getMenubarOffset(screen)

  const config = Config[position]
  const x = config(screenFrame.width)

  window.setFrame({
    x,
    y: topOffset + 0 + GAP,
    width: screenFrame.width / 2 - GAP * 1.5,
    height: screenFrame.height - GAP_DOUBLED,
  })

  show('½')
}
