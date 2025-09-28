@Component
@Preview
export struct RowDemo {
  build() {
    Row({space: 16}){
      // 课程图标
      Image("https://class-practice.oss-cn-nanjing.aliyuncs.com/20250427/123_61042.jpg")
        .width(48)
        .height(48)
        .borderRadius(8)
        .objectFit(ImageFit.Cover)

      // 课程信息
      Column({ space: 4 }) {
        Text('鸿蒙开发')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor('#2C3E50')
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
        
        Text('HarmonyOS应用开发实战')
          .fontSize(13)
          .fontColor('#7F8C8D')
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

      // 详情按钮
      Button('查看详情')
        .type(ButtonType.Capsule)
        .width(80)
        .height(32)
        .fontSize(12)
        .fontColor('#FFFFFF')
        .backgroundColor('#27AE60')
        .fontWeight(FontWeight.Medium)
    }
    .padding(16)
    .width('100%')
    .height(80)
    .backgroundColor('#FFFFFF')
    .borderRadius(12)
    .shadow({
      radius: 8,
      color: '#E0E0E0',
      offsetX: 0,
      offsetY: 2
    })
  }
}