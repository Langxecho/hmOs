@Entry
@Component
struct AnimationDemo1 {
  @State isMoved: boolean = false;
  @State isHeartBeating: boolean = false;
  @State heartScale: number = 1;

  aboutToAppear() {
    // 启动心脏跳动动画
    this.startHeartBeat();
  }

  startHeartBeat() {
    setInterval(() => {
      this.heartScale = this.heartScale === 1 ? 1.2 : 1;
    }, 600); // 每600毫秒跳动一次
  }

  build() {
    Column({space: 20}){
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

      // 心脏跳动动画
      Text('❤️')
        .fontSize(60)
        .scale({ x: this.heartScale, y: this.heartScale })
        .animation({
          duration: 300,
          curve: Curve.EaseInOut,
          iterations: 1
        })

      Text('心脏跳动动画')
        .fontSize(16)
        .fontColor('#666666')
    }
    .padding(16)
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}