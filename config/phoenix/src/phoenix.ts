import {show} from './utils/modal'
import {shell} from './utils/task'

import {focusWindow} from './focus'

import {resizeWindowFull} from './resize/full'
import {resizeWindowHalf} from './resize/half'

Phoenix.set({
  daemon: true,
  openAtLogin: true,
})

Key.on('t', ['alt'], () => shell('~/Scripts/kitty-spawn'))
Key.on('f', ['alt'], resizeWindowFull)

const resizeLeft = () => resizeWindowHalf('left')
Key.on('h', ['option', 'shift'], resizeLeft)
Key.on('left', ['option', 'shift'], resizeLeft)

const resizeRight = () => resizeWindowHalf('right')
Key.on('l', ['option', 'shift'], resizeRight)
Key.on('right', ['option', 'shift'], resizeRight)

const focusWest = () => focusWindow('west')
Key.on('h', ['option'], focusWest)
Key.on('left', ['option'], focusWest)

const focusEast = () => focusWindow('east')
Key.on('l', ['option'], focusEast)
Key.on('right', ['option'], focusEast)

Key.on('r', ['option', 'shift'], async () => {
  show('🏖')

  await shell('~/Scripts/rebuild-phoenix-config')
  show('🌟')

  Phoenix.reload()
})
