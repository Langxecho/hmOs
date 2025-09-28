@Entry
@Component
struct Page1 {
  @State scale1: number = 1;
  @State opacity1: number = 1;

  build() {
    Column() {
      Button("去页面2").onClick(() => {
        this.getUIContext().getRouter().pushUrl({
          url: "pages/Page2"
        })
      })
        .width(200)
        .height(60)
        .fontSize(36)
      Text("START")
        .fontSize(36)
        .textAlign(TextAlign.Center)
    }
    .scale({ x: this.scale1 })
    .opacity(this.opacity1)
    .height("100%")
    .width("100%")
    .backgroundColor(Color.Red)
    .justifyContent(FlexAlign.Center)
  }

  // 自定义方式2：使用系统提供的多种默认效果(平移、缩放、透明度等)
  pageTransition() {
    //设置入场动效
    PageTransitionEnter({ duration: 200 })
      .slide(SlideEffect.Left)
    //设置退场动效
    PageTransitionExit({ delay: 100 })
      .slide(SlideEffect.Left) //Left
  }
}