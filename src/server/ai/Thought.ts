
export abstract class Thought {
  blocked = false
  currentBlockTicks = 0

  /**
   * Executes this thought
   * @returns New state to go through, or none
   */
  protected abstract execute (): string | undefined

  /**
   * Executes the thought, respecting blocking.
   * @returns New state to go through, or none
   */
  think (): string | undefined {
    if (this.blocked) {
      if (this.currentBlockTicks > 0 && --this.currentBlockTicks <= 0) {
        this.unblock() // next tick will be unblocked
      }
      this.execute()
      return undefined
    }
    return this.execute()
  }

  /**
   * Block the thought from stopping permanently or for a specific amount of
   * time.
   * @param ticks Times to skip stopping
   */
  block (ticks?: number): void {
    this.currentBlockTicks = ticks ?? 0
    this.blocked = true
  }

  /**
   * Unblock the thought, letting it stop prematurely
   */
  unblock (): void {
    this.currentBlockTicks = 0
    this.blocked = false
  }
}
