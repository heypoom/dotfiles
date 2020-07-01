import {show} from './utils/modal'
import {shell} from './utils/task'

import {focusWindow} from './window/focus'

import {resizeWindowFull} from './resize/full'
import {resizeWindowHalf} from './resize/half'
import {resizeWindowThird} from './resize/third'
import {resizeWindowTwoThird} from './resize/two-third'

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

// Third
Key.on('1', ['control', 'shift'], () => resizeWindowThird('left'))
Key.on('2', ['control', 'shift'], () => resizeWindowThird('center'))
Key.on('3', ['control', 'shift'], () => resizeWindowThird('right'))

// Two thirds
Key.on('4', ['control', 'shift'], () => resizeWindowTwoThird('left'))
Key.on('5', ['control', 'shift'], () => resizeWindowTwoThird('right'))

Key.on('r', ['option', 'shift'], async () => {
  show('🏖')

  await shell('~/Scripts/rebuild-phoenix-config')
  show('🌟')

  Phoenix.reload()
})
