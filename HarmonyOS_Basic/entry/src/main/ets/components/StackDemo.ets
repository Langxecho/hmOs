@Component
export struct StackDemo {
  @State hasNewMsg: boolean = true
  @Prop avatarUrl: string = 'https://class-practice.oss-cn-nanjing.aliyuncs.com/notesApp/%E6%88%98%E4%BA%89.jpg'
  @Prop username: string = '张三'
  build() {
      Stack({alignContent: Alignment.TopEnd }){
        Image(this.avatarUrl || $r('app.media.Yukari'))
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