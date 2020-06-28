import {showWindowModal} from './modal'

Key.on('g', ['option', 'shift'], () => {
  showWindowModal('🍣')
})

Key.on('r', ['option', 'shift'], () => {
  showWindowModal('🏖')
  Phoenix.reload()
})
