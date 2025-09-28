/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// 通用文本组件，用于显示带图标、标题和内容的行项
@Component
export default struct TextCommonComponent {
  @Link content: ResourceStr;   // 双向绑定的内容文本
  textImage?: Resource;         // 可选的左侧图标
  title?: ResourceStr;          // 可选的标题文本
  onItemClick = (): void => {}; // 点击事件回调函数

  // 构建通用文本组件UI
  build() {
    // 水平容器，包含图标、标题、内容和右箭头
    Row() {
      // 左侧图标
      Image(this.textImage !== undefined ? this.textImage : '')
        .width(26)                      // 图标宽度26
        .height(26)                     // 图标高度26
        .margin({ left: 12 })           // 左边距12
      // 标题文本
      Text(this.title)
        .fontSize(17)                   // 字体大小17
        .margin({ left: 16 })           // 左边距16
        .height('100%')                 // 高度100%
        .opacity(0.9)                   // 透明度0.9
      // 内容文本（右对齐）
      Text(this.content)
        .fontSize(17)                   // 字体大小17
        .opacity(0.9)                   // 透明度0.9
        .textAlign(TextAlign.End)       // 文本右对齐
        .textOverflow({ overflow: TextOverflow.Ellipsis })  // 文本溢出显示省略号
        .maxLines(1)                    // 最大显示1行
        .margin({                       // 设置左右边距
          left: 16,
          right: 7
        })
        .height('100%')                 // 高度100%
        .layoutWeight(1)                // 布局权重1，占据剩余空间
        .width('100%')                  // 宽度100%
      // 右侧箭头图标
      Image($r('app.media.chevron_right'))
        .width(13)                      // 箭头宽度13
        .height(13)                     // 箭头高度13
        .margin({ right: 14 })          // 右边距14
    }
    .margin({ top: 12 })             // 上边距12
    .borderRadius(24)                // 圆角半径24
    .backgroundColor(Color.White)    // 背景色白色
    .width('100%')                   // 宽度100%
    .height(64)                      // 高度64
    .onClick(this.onItemClick)       // 点击事件处理
  }
}