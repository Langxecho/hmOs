import {ColumnDemo} from '../components/ColumnDemo'
import {FlexDemo} from '../components/FlexDemo'
import {RowDemo} from '../components/RowDemo'
import { router } from '@kit.ArkUI'

@Entry
@Component
struct LoginPage {
    build() {
      Column() {
        // 导航栏
        Row({ space: 16 }) {
          Text('学习中心')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor('#2C3E50')
            .layoutWeight(1)

          Button('组件展示')
            .type(ButtonType.Capsule)
            .fontSize(14)
            .fontColor('#FFFFFF')
            .backgroundColor('#4A90E2')
            .height(36)
            .padding({ left: 16, right: 16 })
            .onClick(() => {
              router.pushUrl({
                url: 'pages/animation/AnimationDemo1'
              })
            })
          Button('动画1')
            .type(ButtonType.Capsule)
            .fontSize(14)
            .fontColor('#FFFFFF')
            .backgroundColor('#4A90E2')
            .height(36)
            .padding({ left: 16, right: 16 })
            .onClick(() => {
              router.pushUrl({
                url: 'pages/animation/AnimationDemo2'
              })
            })
          Button('页面转场1')
            .type(ButtonType.Capsule)
            .fontSize(14)
            .fontColor('#FFFFFF')
            .backgroundColor('#4A90E2')
            .height(36)
            .padding({ left: 16, right: 16 })
            .onClick(() => {
              router.pushUrl({
                url: 'pages/animation/Page2'
              })
            })
          Button('页面转场2')
            .type(ButtonType.Capsule)
            .fontSize(14)
            .fontColor('#FFFFFF')
            .backgroundColor('#4A90E2')
            .height(36)
            .padding({ left: 16, right: 16 })
            .onClick(() => {
              router.pushUrl({
                url: 'pages/animation/ProductList'
              })
            })
        }
        .width('100%')
        .height(60)
        .padding({ left: 16, right: 16, top: 10 })
        .backgroundColor('#FFFFFF')
        .shadow({
          radius: 4,
          color: '#E0E0E0',
          offsetX: 0,
          offsetY: 2
        })

        // 主要内容区域
        Scroll() {
          Column({ space: 20 }) {
            // 页面标题
            Text('欢迎回来！')
              .fontSize(24)
              .fontWeight(FontWeight.Bold)
              .fontColor('#2C3E50')
              .margin({ top: 20, bottom: 10 })
              .textAlign(TextAlign.Center)
              .width('100%')

          // 签到提醒卡片
          ColumnDemo()
            .margin({ left: 16, right: 16 })

          // 技能标签区域
          Column({ space: 12 }) {
            Text('我的技能')
              .fontSize(18)
              .fontWeight(FontWeight.Medium)
              .fontColor('#34495E')
              .alignSelf(ItemAlign.Start)
              .margin({ left: 16 })

            FlexDemo()
              .margin({ left: 16, right: 16 })
          }

          // 课程信息区域
          Column({ space: 12 }) {
            Text('推荐课程')
              .fontSize(18)
              .fontWeight(FontWeight.Medium)
              .fontColor('#34495E')
              .alignSelf(ItemAlign.Start)
              .margin({ left: 16 })

            RowDemo()
              .margin({ left: 16, right: 16 })
            RowDemo()
              .margin({ left: 16, right: 16 })
            RowDemo()
              .margin({ left: 16, right: 16 })
            RowDemo()
              .margin({ left: 16, right: 16 })
            RowDemo()
              .margin({ left: 16, right: 16 })

          }

            // 底部间距
            Text('')
              .height(40)
          }
          .width('100%')
          .padding({ bottom: 20 })
        }
        .layoutWeight(1)
        .width('100%')
        .backgroundColor('#F8F9FA')
        .scrollable(ScrollDirection.Vertical)
        .scrollBar(BarState.Off)
      }
      .width('100%')
      .height('100%')
    }
}