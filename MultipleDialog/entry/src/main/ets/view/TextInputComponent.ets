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

// 文本输入组件，用于显示带图标的输入框
@Component
export default struct TextInputComponent {
  @Link text: string;           // 双向绑定的输入文本
  inputImage?: Resource;        // 可选的输入框图标
  hintText?: ResourceStr;       // 可选的提示文本

  // 构建文本输入组件UI
  build() {
    // 水平容器，包含图标和输入框
    Row() {
      // 左侧图标
      Image(this.inputImage !== undefined ? this.inputImage : '')
        .width(26)                      // 图标宽度26
        .height(26)                     // 图标高度26
        .margin({ left: 12 })           // 左边距12
      // 文本输入框
      TextInput({ placeholder: this.hintText, text: this.text })
        .fontSize(17)                   // 字体大小17
        .padding({ left: 12 })          // 左内边距12
        .backgroundColor(Color.White)   // 背景色白色
        .fontWeight(FontWeight.Normal)  // 字体粗细正常
        .fontStyle(FontStyle.Normal)    // 字体样式正常
        .fontColor(Color.Black)         // 字体颜色黑色
        .opacity(0.9)                   // 透明度0.9
        .margin({ right: 32 })          // 右边距32
        .layoutWeight(1)                // 布局权重1，占据剩余空间
        .height(48)                     // 输入框高度48
        .enableKeyboardOnFocus(false)   // 获取焦点时不显示键盘
        .onChange((value: string) => {
          // 输入内容改变时的回调
          if (this.text !== value) {
            this.text = value;                          // 更新输入文本
            AppStorage.setOrCreate('inputIsEdit', true); // 设置输入编辑标记
          }
          if (!value) {
            // 如果输入为空，清除编辑标记
            AppStorage.setOrCreate('inputIsEdit', false);
          }
        })
    }
    .margin({ top: 12 })             // 上边距12
    .borderRadius(24)                // 圆角半径24
    .backgroundColor(Color.White)    // 背景色白色
    .width('100%')                   // 宽度100%
    .height(64)                      // 高度64
  }
}