@Entry
@Component
struct LoginPage {
  @State username: string = ''
  @State password: string = ''

  // 类似Vue的methods
  handleLogin() {
    console.log('登录逻辑', this.username, this.password)
  }

  build() {
    Column({ space: 20 }) {
      Text('用户登录')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)

      TextInput({ placeholder: '请输入用户名' })
        .onChange((value) => {
          this.username = value
        })

      TextInput({ placeholder: '请输入密码' })
        .type(InputType.Password)
        .onChange((value) => {
          this.password = value
        })

      Button('登录')
        .width('100%')
        .onClick(() => this.handleLogin())
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }
}