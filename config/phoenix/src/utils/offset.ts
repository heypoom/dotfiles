export function getMenubarOffset(screen = Screen.main()) {
  const visibleFrame = screen.visibleFrame()
  const fullFrame = screen.frame()

  return fullFrame.height - visibleFrame.height
}
