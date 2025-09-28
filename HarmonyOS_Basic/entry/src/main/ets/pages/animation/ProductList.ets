@Entry
@Component
struct ProductList {
  private products: Product[] = [
    {
      id: 1,
      name: "鸿蒙手机",
      image: $r("app.media.startIcon_purple"),
      price: "￥3999"
    },
    {
      id: 2,
      name: "智慧手表",
      image: $r("app.media.startIcon_green"),
      price: "￥1999"
    },
    {
      id: 3,
      name: "平板电脑",
      image: $r("app.media.startIcon_orange"),
      price: "￥2999"
    }
  ]

  build() {
    Column() {
      Text("商品列表")
        .fontSize(30).fontWeight(FontWeight.Bold).margin({ bottom: 20 })

      List() {
        ForEach(this.products, (item: Product) => {
          ListItem() {
            Row({ space: 12 }) {
              // 列表中的图片绑定共享转场 ID
              Image(item.image)
                .width(80).height(80).borderRadius(12)
                .sharedTransition(`prod_${item.id}`, { duration: 400 })

              Column({ space: 6 }) {
                Text(item.name).fontSize(20)
                Text(item.price).fontSize(16).fontColor(Color.Gray)
              }

              Blank()
              Button("详情")
                .onClick(() => {
                  this.getUIContext().getRouter().pushUrl({
                    url: "pages/ProductDetail",
                    params: {
                      id: item.id,
                      name: item.name,
                      image: item.image,
                      price: item.price
                    }
                  })
                })
            }
            .padding(12).width("100%")
          }
        }, (item: Product) => item.id.toString())
      }
    }
    .padding(20).height("100%").width("100%").backgroundColor(Color.White)
  }

  pageTransition() {
    PageTransitionEnter({ duration: 300 }).slide(SlideEffect.Left)
    PageTransitionExit({ duration: 300 }).slide(SlideEffect.Left)
  }
}

interface Product {
  id: number
  name: string
  image: Resource
  price: string
}

