@Entry
@Component
struct AnimationDemo2 {
  @State isExpanded: boolean = false;
  @State cardTranslateY: number = 0;

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      // 背景区域
      Column()
        .width('100%')
        .height('100%')
        .backgroundColor('#f5f5f5')

      // 滑动卡片
      Column() {
        // 卡片标题
        Row() {
          Text('今日待办')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor('#333333')
          
          Text(this.isExpanded ? '▼' : '▲')
            .fontSize(16)
            .fontColor('#666666')
        }
        .width('100%')
        .padding({ left: 16, right: 16, top: 16, bottom: 16 })
        .justifyContent(FlexAlign.SpaceBetween)

        // 任务列表（展开时显示）
        if (this.isExpanded) {
          Column({ space: 12 }) {
            this.TaskItem('完成项目报告', false)
            this.TaskItem('参加团队会议', true)
            this.TaskItem('回复客户邮件', false)
          }
          .width('100%')
          .padding({ left: 16, right: 16, bottom: 16 })
        }
      }
      .width('90%')
      .backgroundColor(Color.White)
      .borderRadius(12)
      .shadow({
        radius: 8,
        color: '#1f000000',
        offsetX: 0,
        offsetY: 2
      })
      .margin({ bottom: 20 })
      .translate({ x: 0, y: this.cardTranslateY })
      .animation({
        duration: 800,
        curve: Curve.EaseInOut
      })
      .onClick(() => {
        this.toggleCard()
      })
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  TaskItem(taskText: string, isCompleted: boolean) {
    Row() {
      Circle({ width: 20, height: 20 })
        .fill(isCompleted ? '#4CAF50' : '#E0E0E0')
        .margin({ right: 12 })
      
      Text(taskText)
        .fontSize(16)
        .fontColor(isCompleted ? '#999999' : '#333333')
        .decoration({
          type: isCompleted ? TextDecorationType.LineThrough : TextDecorationType.None
        })
        .layoutWeight(1)
    }
    .width('100%')
    .padding({ top: 8, bottom: 8 })
  }

  toggleCard() {
    this.isExpanded = !this.isExpanded
    // 展开时向上移动，收起时回到底部
    this.cardTranslateY = this.isExpanded ? -200 : 0
  }
}