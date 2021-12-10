import {show} from '../utils/modal'

export function focusWindow(direction: Phoenix.Direction) {
  const currentWindow = Window.focused()
  if (!currentWindow) return

  const activeSpace = Space.active()
  if (!activeSpace) return

  const activeSpaceHash = activeSpace.hash()
  let focusedWindow = currentWindow

  const success = currentWindow.neighbors(direction).some((window) => {
    if (window.hash() === currentWindow.hash()) return false

    const [currentSpace] = window.spaces()
    if (!currentSpace) return false
    if (currentSpace.hash() !== activeSpaceHash) return false

    if (!window.isVisible()) return false
    focusedWindow = window

    return window.focus()
  })

  if (!success || !focusedWindow) return
  show('👀', {window: focusedWindow, duration: 0.3})

  const frame = focusedWindow.frame()

  Mouse.move({
    x: frame.x + frame.width / 2,
    y: frame.y + frame.height / 2,
  })
}
