@Entry
@Component
struct Page2 {
  @State scale1: number = 1;
  @State opacity1: number = 1;

  build() {
    Column() {
      Button("返回页面1").onClick(() => {
        this.getUIContext().getRouter().pushUrl({
          url: "pages/Page1"
        });
      })
        .width(200)
        .height(60)
        .fontSize(36)
      Text("END")
        .fontSize(36)
        .textAlign(TextAlign.Center)
    }
    .scale({ x: this.scale1 })
    .opacity(this.opacity1)
    .height("100%")
    .width("100%")
    .backgroundColor(Color.Gray)
    .justifyContent(FlexAlign.Center)
  }

  // 自定义方式2：使用系统提供的多种默认效果(平移、缩放、透明度等)
  pageTransition() {
    PageTransitionEnter({ duration: 200 })
      .slide(SlideEffect.Right) //Right
    PageTransitionExit({ delay: 100 })
      .slide(SlideEffect.Right) //Right
  }
}