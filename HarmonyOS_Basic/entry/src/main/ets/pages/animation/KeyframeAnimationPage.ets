@Entry
@Component
struct KeyframeAnimationPage {
  @State offsetY: number = 200 // 初始位置：地平线下
  @State _opacity: number = 0.5 // 初始半透明
  @State _scale: number = 0.8 // 初始稍小

  build() {
    Navigation() {
      Column({ space: 20 }) {
        Circle({ width: 100, height: 100 })
          .fill('#FFEB3B')
          .translate({ x: 0, y: this.offsetY })
          .scale({ x: this._scale, y: this._scale })
          .opacity(this._opacity)
          .animation({ duration: 800, curve: Curve.EaseInOut })
        Button('播放动画').onClick(() => this.playAnimation())
      }
      .padding(16)
      .alignItems(HorizontalAlign.Center)
    }
    .title('关键帧动画-太阳升起')
    .titleMode(NavigationTitleMode.Mini)
    .hideBackButton(false)
    .navBarPosition(NavBarPosition.Start)
  }

  private playAnimation() {
    // 0% → 太阳刚露头
    this.offsetY = 100
    this._scale = 1
    this._opacity = 1

    // 50% → 升到中天，放大更亮
    setTimeout(() => {
      this.offsetY = 0
      this._scale = 1.2
      this._opacity = 1
    }, 800)

    // 100% → 慢慢淡出
    setTimeout(() => {
      this.offsetY = -50
      this._scale = 1
      this._opacity = 0
    }, 1600)
  }
}
