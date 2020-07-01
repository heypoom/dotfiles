import {GAP, GAP_DOUBLED} from '../config'

import {show} from '../utils/modal'
import {getMenubarOffset} from '../utils/offset'

const Config = {
  left: () => 0 + GAP,
  right: (width: number) => width / 3 + GAP / 2,
}

export function resizeWindowTwoThird(position: 'left' | 'right') {
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
    width: (screenFrame.width * 2) / 3 - GAP * 1.5,
    height: screenFrame.height - GAP_DOUBLED,
  })

  show('⅔')
}
