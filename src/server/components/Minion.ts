import { BaseComponent, Component } from '@flamework/components'
import { OnStart } from '@flamework/core'
import { ThoughtProcess } from 'server/ai/ThoughtProcess'

@Component({
  tag: 'minion'
})
export class MinionComponent extends BaseComponent implements OnStart {
  thoughtProcess!: ThoughtProcess

  onStart (): void {

  }
}
