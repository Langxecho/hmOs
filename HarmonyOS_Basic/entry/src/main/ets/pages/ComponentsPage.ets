import {GridDemo} from '../components/GridDemo'
import {StackDemo} from '../components/StackDemo'
import { router } from '@kit.ArkUI'

@Entry
@Component
struct ComponentsPage {
  build() {
    Column() {
      // 导航栏
      Row({ space: 16 }) {
        Button('← 返回')
          .type(ButtonType.Capsule)
          .fontSize(14)
          .fontColor('#4A90E2')
          .backgroundColor('#F0F8FF')
          .height(36)
          .padding({ left: 16, right: 16 })
          .onClick(() => {
            router.back()
          })
        
        Text('组件展示')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor('#2C3E50')
          .layoutWeight(1)
          .textAlign(TextAlign.Center)
        
        // 占位，保持布局平衡
        Text('')
          .width(80)
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
        Column({ space: 24 }) {
          // 页面介绍
          Text('这里展示了Grid和Stack组件的使用示例')
            .fontSize(16)
            .fontColor('#7F8C8D')
            .margin({ top: 20, bottom: 10 })
            .textAlign(TextAlign.Center)
            .width('100%')
        
        // Stack组件展示区域
        Column({ space: 16 }) {
          Text('用户头像组件')
            .fontSize(18)
            .fontWeight(FontWeight.Medium)
            .fontColor('#34495E')
            .alignSelf(ItemAlign.Start)
            .margin({ left: 16 })
          
          // 展示多个StackDemo实例
          Row({ space: 20 }) {
            StackDemo({ avatarUrl: 'https://class-practice.oss-cn-nanjing.aliyuncs.com/notesApp/%E6%88%98%E4%BA%89.jpg', username: '张三' })
            StackDemo({ avatarUrl: 'https://class-practice.oss-cn-nanjing.aliyuncs.com/notesApp/%E6%88%98%E4%BA%89.jpg', username: '李四' })
            StackDemo({ avatarUrl: 'https://class-practice.oss-cn-nanjing.aliyuncs.com/notesApp/%E6%88%98%E4%BA%89.jpg', username: '王五' })
          }
          .justifyContent(FlexAlign.SpaceEvenly)
          .width('100%')
          .padding({ left: 16, right: 16 })
        }
        .width('100%')
        .padding(16)
        .backgroundColor('#FFFFFF')
        .borderRadius(12)
        .margin({ left: 16, right: 16 })
        .shadow({
          radius: 8,
          color: '#E0E0E0',
          offsetX: 0,
          offsetY: 2
        })
        
        // Grid组件展示区域
        Column({ space: 16 }) {
          Text('作业管理')
            .fontSize(18)
            .fontWeight(FontWeight.Medium)
            .fontColor('#34495E')
            .alignSelf(ItemAlign.Start)
            .margin({ left: 16 })
          
          GridDemo()
        }
        .width('100%')
        .padding(16)
        .backgroundColor('#FFFFFF')
        .borderRadius(12)
        .margin({ left: 16, right: 16 })
        .shadow({
          radius: 8,
          color: '#E0E0E0',
          offsetX: 0,
          offsetY: 2
        })
        
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