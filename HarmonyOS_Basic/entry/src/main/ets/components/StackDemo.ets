@Component
export struct StackDemo {
  @State hasNewMsg: boolean = true
  @Prop avatarUrl: string = 'https://file.icve.com.cn/file_doc/686/798/ABAC7BB405868F3B6F7C07F29DE7166C.png'
  @Prop username: string = '张三'
  build() {
      Stack({alignContent: Alignment.TopEnd }){
        Image(this.avatarUrl)
          .width(60)
          .height(60)
          .borderRadius(30)
          .border({
            width:  2,
            color: Color.Red
          })
        if (this.hasNewMsg) {
          Circle({width: 18,height: 18}).fill(Color.Red).position({x: 60,y: 0})
          Text('8').fontSize(10).fontColor(Color.White).position({x:65,y:4})
        }
        Text(this.username).fontSize(14).fontColor(Color.Black).position({x: 20,y:65}).width(60)
          .textAlign(TextAlign.Center)
      }
    .width(80).height(90)
  }
}