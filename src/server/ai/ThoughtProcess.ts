import { Thought } from './Thought'

/**
 * Finite state machine implementation
 */
export class ThoughtProcess {
  states: Map<string, Thought> = new Map()
  currentState = 'Idle'

  constructor () {

  }
}
