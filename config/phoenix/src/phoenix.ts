import {show} from './utils/modal'
import {shell} from './utils/task'

Phoenix.set({
  daemon: true,
  openAtLogin: true,
})

Key.on('g', ['option', 'shift'], async () => {
  await shell('say Hi World!')
})

Key.on('r', ['option', 'shift'], async () => {
  show('🏖')

  await shell('~/Scripts/rebuild-phoenix-config')
  show('🌟')

  Phoenix.reload()
})
