import {show} from './modal'

interface TaskData {
  error: string
  output: string
  status: number
}

export class TaskError extends Error {
  public task: Task

  constructor(t: Task, message?: string) {
    super(message)

    this.task = t
  }

  public toString(): string {
    let extra = `status ${this.task.status}`

    if (this.task.output || this.task.error) {
      const data: TaskData = {
        error: this.task.error,
        output: this.task.output,
        status: this.task.status,
      }

      extra = `${JSON.stringify(data, null, '\t')}`
    }

    return `Error (Task): ${this.message} (${extra})`
  }
}

export const task = (name: string, ...args: string[]): Promise<Task> =>
  new Promise((resolve, reject) => {
    Task.run(name, args, (t) => {
      if (t.status !== 0) return reject(new TaskError(t, name))

      return resolve(t)
    })
  })

export const shellWithError = (...commands: string[]): Promise<string> =>
  new Promise((resolve, reject) => {
    Task.run(
      '/usr/local/bin/bash',
      ['--login', '-c', commands.join(' ')],
      (t) => {
        if (t.status !== 0) return reject(t.error)

        return resolve(t.output)
      },
    )
  })

export async function shell(...commands: string[]) {
  try {
    return await shellWithError(...commands)
  } catch (error) {
    show(error.toString(), {weight: 10})
    return error
  }
}

export const env = (name: string) => shell(`echo ${name}`)
