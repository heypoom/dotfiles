export const command = 'osascript ./applescript.scpt | echo'
export const refreshFrequency = 1000

export const className = {
  bottom: 'auto',
  right: 'auto',
  left: 0,
  top: 0,
  width: '30vh',
  fontSize: '1vh',
  lineHeight: '1.5',
  margin: '2vh',
  fontFamily: 'Input Serif Narrow, fixed',
  fontWeight: '500',
  color: 'white',
}

export const initialState = {playing: false}

export const updateState = (event, previousState) => {
  if (event.error) {
    return {...previousState, warning: `We got an error: ${event.error}`}
  }

  const [_, state, app, track, artist, position, length] = event.output.split(
    '\n'
  )

  const playing = state === 'playing'

  return playing
    ? {
        playing,
        data: {
          track,
          artist,
          position,
          length,
        },
      }
    : {playing}
}

const secToMin = (sec) => {
  let hms = new Date(1000 * sec).toISOString().substr(11, 8).split(':')
  if (sec < 60) {
    hms = [hms[2]]
  } else if (sec < 60 * 60) {
    hms = [hms[1], hms[2]]
  }
  return `${hms.join(':')}`
}

const displayData = ({artist, track, position, length, app}) => {
  const parsedLength = Number(length)
  const parsedPosition = Number(position)
  const percent = Math.floor((parsedPosition / parsedLength) * 100)
  const style = {
    position: 'absolute',
    top: 'auto',
    left: 0,
    bottom: '-.5vh',
    width: `${percent}%`,
    background: 'white',
    height: '.2vh',
  }
  const displayLength = secToMin(parsedLength)
  let displayPosition = secToMin(parsedPosition)

  while (displayPosition.length < displayLength.length) {
    displayPosition = '00:' + displayPosition
  }

  return (
    <div>
      <div>
        {artist} - {track}
      </div>
      <div>
        {displayPosition} - {displayLength}
      </div>
      <div style={style}></div>
      <Caa></Caa>
    </div>
  )
}

export const render = ({playing, data}) =>
  playing ? <div>{displayData(data)}</div> : <div></div>
