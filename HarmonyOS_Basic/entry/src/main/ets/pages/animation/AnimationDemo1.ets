@Entry
@Component
struct AnimationDemo1 {
  @State isMoved: boolean = false;

  build() {
    Column({space: 16}){
      Text('显示动画演示')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)

      Button('搜索位置').onClick(() => {
        this.isMoved = !this.isMoved
      })

      Circle({
        width: this.isMoved ? 100 : 60,
        height: this.isMoved ? 100 : 60
      })
        .fill(this.isMoved ? '#ff4081' : '#ffa883c4')
        .translate({x: this.isMoved ? 200 : 0, y: 0})
        .animation({
          duration: 1000,
          curve: Curve.Smooth
        })
    }
    .padding(16)
  }
}