@Entry
@Component
struct ProductDetail {
  @State _id: number = 0
  @State name: string = "默认商品名"
  @State price: string = "99"
  @State image: Resource = $r("app.media.startIcon_green")

  aboutToAppear() {
    let params = this.getUIContext().getRouter().getParams() as Record<string, Object>
    if (params) {
      this._id = params["id"] as number
      this.name = params["name"] as string
      this.image = params["image"] as Resource
      this.price = params["price"] as string
    }
  }

  build() {
    Column({ space: 20 }) {
      // 共享转场的图片会自动放大
      Image(this.image)
        .width("90%").aspectRatio(1)
        .borderRadius(16)
        .sharedTransition(`prod_${this.id}`, { duration: 400 })

      Text(this.name).fontSize(28).fontWeight(FontWeight.Bold)
      Text(this.price).fontSize(22).fontColor(Color.Red)

      Button("返回").onClick(() => {
        this.getUIContext().getRouter().back()
      })
        .width(200).height(60).fontSize(20)
    }
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .height("100%")
    .width("100%")
    .backgroundColor(Color.Gray)
  }

  pageTransition() {
    PageTransitionEnter({ duration: 300 }).slide(SlideEffect.Right)
    PageTransitionExit({ duration: 300 }).slide(SlideEffect.Right)
  }
}
