import {show} from './utils/modal'
import {shell} from './utils/task'

Phoenix.set({
  daemon: true,
  openAtLogin: true,
})

Key.on('r', ['option', 'shift'], async () => {
  show('🏖')

  await shell('~/bin/rebuild-phoenix-config')
  show('🌟')

  Phoenix.reload()
})
