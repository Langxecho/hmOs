@Component
@Preview
export struct FlexDemo {
  @State skills: string[] = ['项目管理','Vue.js','Java','鸿蒙开发']
  private skillColors: string[] = ['#FF6B6B', '#4ECDC4', '#45B7D1', '#96CEB4']
  
  build() {
    Flex({
      direction: FlexDirection.Row,
      wrap: FlexWrap.Wrap,
      justifyContent: FlexAlign.Start
    }){
      ForEach(this.skills,(skill:string,index: number) => {
        Text(skill)
          .fontSize(14)
          .fontColor('#FFFFFF')
          .backgroundColor(this.skillColors[index % this.skillColors.length])
          .padding({left: 16, right: 16, top: 8, bottom: 8})
          .borderRadius(20)
          .margin({right: 10, bottom: 10})
          .fontWeight(FontWeight.Medium)
          .shadow({
            radius: 4,
            color: this.skillColors[index % this.skillColors.length],
            offsetX: 0,
            offsetY: 2
          })
      })

    }
    .padding(4)
  }
}