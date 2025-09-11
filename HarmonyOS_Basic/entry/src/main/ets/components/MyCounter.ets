import {UserInfo} from '../model/UserInfo'
@Component
export struct MyCounter {
  @State count: number = 0
  @State isLoading: boolean = false

  build() {
    Column({ space: 16 }) {
      Text(`当前计数：${this.count}`)
        .fontSize(24)
        .fontWeight(FontWeight.Bold)

      Row({ space: 12 }) {
        Button('-')
          .onClick(() => {
            this.count--
          })

        Button('+')
          .onClick(() => {
            this.count++
          })

        Button('重置')
          .onClick(() => {
            this.count = 0
          })
      }
    }
    .width('100%')
    .padding(16)
  }
}