@Component
@Preview
export struct MyButton {
  @Prop text: string = '按钮'
  @Prop bgColor: string = '#50AEB6'

  build() {
    Button(this.text)
      .type(ButtonType.Normal)
      .backgroundColor(this.bgColor)
  }
}