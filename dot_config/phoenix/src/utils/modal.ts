interface Config {
  window?: Window
  origin?(frame: Rectangle): Point
  duration?: number
  weight?: number
  appearance?: Phoenix.ModalAppearance
  icon?: Phoenix.Icon
  text?: string
}

const defaultConfig: Config = {
  window: Window.focused(),
}

export function show(text = '', config?: Partial<Config>) {
  const {window, ...modalConfig} = {...defaultConfig, ...config}

  if (!window) return

  const point = window.topLeft()
  point.x += window.frame().width / 2
  point.y += window.frame().height / 2

  const modal = Modal.build({
    text,
    weight: 40,
    duration: 0.8,
    origin: (m) => ({
      x: point.x - m.width / 2,
      y: Screen.main().frame().height - (point.y + m.height / 2),
    }),
    ...modalConfig,
  })

  modal.show()
}
