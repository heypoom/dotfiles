import {GAP, GAP_DOUBLED} from '../config'

import {show} from '../utils/modal'
import {getMenubarOffset} from '../utils/offset'

const Config = {
  left: (width: number) => ({
    x: 0 + GAP,
    width: width / 3 - GAP * 1.5,
  }),

  center: (width: number) => ({
    x: width / 3 + GAP / 2,
    width: width / 3 - GAP,
  }),

  right: (width: number) => ({
    x: (width / 3) * 2 + GAP / 2,
    width: width / 3 - GAP * 1.5,
  }),
}

export function resizeThird(position: 'left' | 'center' | 'right') {
  const screen = Screen.main()
  const screenFrame = screen.flippedVisibleFrame()
  const window = Window.focused()
  if (!window) return

  const topOffset = getMenubarOffset(screen)

  const config = Config[position]
  const {x, width} = config(screenFrame.width)

  window.setFrame({
    x,
    y: topOffset + 0 + GAP,
    width,
    height: screenFrame.height - GAP_DOUBLED,
  })

  show('⅓')
}
