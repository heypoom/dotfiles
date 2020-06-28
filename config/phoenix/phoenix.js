function showWindowModal(text = "", window = Window.focused()) {
  const point = window.topLeft()
  point.x += window.frame().width / 2
  point.y += window.frame().height / 2

  const modal = Modal.build({
    text,
    weight: 40,
    duration: 2.0,
    origin: (m) => ({
      x: point.x - m.width / 2,
      y: Screen.main().frame().height - (point.y + m.height / 2)
    })
  })

  modal.show()
}

Key.on("g", ["option", "shift"], () => showWindowModal("🍣"))

