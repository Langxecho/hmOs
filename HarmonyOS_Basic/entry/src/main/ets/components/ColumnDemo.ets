@Component
@Preview
export struct ColumnDemo {
  build() {
    Column({space: 16}){
      // 图标和标题区域
      Row({ space: 12 }) {
        Text('🔔')
          .fontSize(24)
        Text('签到提醒')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
      }
      .alignItems(VerticalAlign.Center)
      .width('100%')

      Text('上课前5分钟扫码签到，不要忘记哦～')
        .fontSize(15)
        .fontColor('#E8F4FD')
        .maxLines(2)
        .lineHeight(22)
        .layoutWeight(1)

      Button('设置提醒')
        .width('100%')
        .height(44)
        .backgroundColor('#FFFFFF')
        .fontColor('#4A90E2')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .borderRadius(8)
        .onClick(() => {
          console.log('允许签到')
        })
    }
    .width('100%')
    .height(180)
    .padding(20)
    .borderRadius(16)
    .backgroundColor('#4A90E2')
    .shadow({
      radius: 12,
      color: '#4A90E2',
      offsetX: 0,
      offsetY: 4
    })
  }
}