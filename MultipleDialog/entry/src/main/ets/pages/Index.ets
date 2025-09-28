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

// 导入个人信息页面组件
import { PersonalInformation } from './PersonalInformation';

// 应用入口页面组件
@Entry
@Component
struct Index {
  // 提供导航栈给子组件使用，管理页面间的跳转
  @Provide('NavPathStack') pathStack: NavPathStack = new NavPathStack();

  // 页面映射构建器，根据页面名称构建对应的页面组件
  @Builder
  PagesMap(name: string) {
    // 如果页面名称是个人信息页面，则构建PersonalInformation组件
    if (name === 'PersonalInformation') {
      PersonalInformation()
    }
  }

  // 构建主页面UI
  build() {
    // 使用Navigation组件管理页面导航
    Navigation(this.pathStack) {
      // 主页面内容容器
      Column() {
        // 页面标题：多弹窗交互
        Text($r('app.string.multi_popup_interaction'))
          .fontSize(30)           // 设置字体大小为30
          .opacity(0.9)           // 设置透明度为0.9
          .fontWeight(FontWeight.Bold)  // 设置字体粗细为加粗
          .width('100%')          // 设置宽度为100%
          .height(56)             // 设置高度为56
          .margin({ top: 56 })    // 设置上边距为56

        // 按钮容器
        Column({ space: 12 }) {
          // 个人信息按钮
          Button($r('app.string.personalInformation'))
            .onClick(() => {
              // 点击按钮时，跳转到个人信息页面
              this.pathStack.pushPath({ name: 'PersonalInformation' });
            })
            .width('100%')        // 按钮宽度100%
        }
        .height(248)              // 按钮容器高度
        .width('100%')            // 按钮容器宽度100%
        .justifyContent(FlexAlign.End)  // 内容对齐到底部
      }
      .width('100%')              // 主容器宽度100%
      .height('100%')             // 主容器高度100%
      .justifyContent(FlexAlign.SpaceBetween)  // 内容垂直间距分布
      .padding({                  // 设置内边距
        left: 16,
        right: 16,
        bottom: 16
      })
    }
    .backgroundColor('#F1F3F5')   // 设置背景色为浅灰色
    .navDestination(this.PagesMap)  // 设置导航目标映射
    .mode(NavigationMode.Stack)   // 设置导航模式为栈模式
    .hideToolBar(true)            // 隐藏工具栏
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])  // 扩展安全区域
  }
}