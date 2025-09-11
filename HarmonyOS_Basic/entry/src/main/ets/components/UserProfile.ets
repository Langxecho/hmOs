import {UserInfo} from '../model/UserInfo'
@Component
export struct UserProfile {
  @Prop userInfo: UserInfo

  build() {
    Column() {
      Image(this.userInfo.avatar)
        .width(80)
        .height(80)
        .borderRadius(40)

      Text(`姓名：${this.userInfo.name}`)
        .fontSize(28)
        .margin({ top: 8 })

      Text(`年龄：${this.userInfo.age}`)
        .fontSize(26)
        .margin({ top: 4 })

      if (this.userInfo.email) {
        Text(`邮箱：${this.userInfo.email}`)
          .fontSize(26)
          .margin({ top: 4 })
      }

      Button(this.userInfo.active ? '禁用用户' : '启用用户')
        .margin({ top: 12 })
        .onClick(() => {
          this.userInfo.active = !this.userInfo.active
        })
    }
    .width('100%')
    .padding(16)
    .alignItems(HorizontalAlign.Center)
  }
}