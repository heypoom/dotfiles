import {show} from './utils/modal'
import {shell} from './utils/task'

import {focusWindow} from './window/focus'

import {resizeFull} from './resize/full'
import {resizeHalf} from './resize/half'
import {resizeThird} from './resize/third'
import {resizeTwoThird} from './resize/two-third'

Phoenix.set({
  daemon: true,
  openAtLogin: true,
})

Key.on('t', ['alt'], () => shell('~/Scripts/kitty-spawn'))
Key.on('f', ['alt'], resizeFull)

const resizeLeft = () => resizeHalf('left')
Key.on('h', ['option', 'shift'], resizeLeft)
Key.on('left', ['option', 'shift'], resizeLeft)

const resizeRight = () => resizeHalf('right')
Key.on('l', ['option', 'shift'], resizeRight)
Key.on('right', ['option', 'shift'], resizeRight)

const focusWest = () => focusWindow('west')
Key.on('h', ['option'], focusWest)
Key.on('left', ['option'], focusWest)

const focusEast = () => focusWindow('east')
Key.on('l', ['option'], focusEast)
Key.on('right', ['option'], focusEast)

// Third
Key.on('1', ['control', 'shift'], () => resizeThird('left'))
Key.on('2', ['control', 'shift'], () => resizeThird('center'))
Key.on('3', ['control', 'shift'], () => resizeThird('right'))

// Two thirds
Key.on('4', ['control', 'shift'], () => resizeTwoThird('left'))
Key.on('5', ['control', 'shift'], () => resizeTwoThird('right'))

Key.on('r', ['option', 'shift'], async () => {
  show('🏖')

  await shell('~/Scripts/rebuild-phoenix-config')
  show('🌟')

  Phoenix.reload()
})
