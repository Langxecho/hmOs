@Component
@Preview
export struct ProfileCard {
  @Prop name: string = '张三'
  @Prop avatar: string = 'https://static-cdn-oss.mosoteach.cn/mosoteach2/common/images/activities-list-icon-discuss.png'
  @Prop title: string = '软件工程师'
  @Prop company: string = '华为'
  @Prop location: string = '深圳'

  build() {
    Column({ space: 12 }) {
      Image(this.avatar)
        .width(100)
        .height(100)
        .borderRadius(50)
        .margin({ top: 20 })

      Text(this.name)
        .fontSize(24)
        .fontWeight(FontWeight.Bold)

      Text(this.title)
        .fontSize(16)
        .fontColor('#666')

      Row({ space: 8 }) {

        Text(this.company)
          .fontSize(14)
      }

      Row({ space: 8 }) {

        Text(this.location)
          .fontSize(14)
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }
}