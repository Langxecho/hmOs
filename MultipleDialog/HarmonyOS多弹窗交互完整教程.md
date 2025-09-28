# HarmonyOS多弹窗交互应用完整开发教程

本教程将详细介绍如何从零开始创建一个展示多种弹窗交互效果的HarmonyOS应用，包括自定义弹窗、日期选择器、文本选择器、气泡弹窗等。

## 项目概述

MultipleDialog是一个个人信息编辑应用，用户可以通过各种类型的弹窗来编辑个人信息，包括：
- 昵称输入（TextInput）
- 生日选择（DatePicker弹窗）
- 性别选择（TextPicker弹窗）
- 个人签名输入（TextInput）
- 兴趣爱好选择（自定义弹窗）
- 数据保存提示（气泡弹窗）
- 离开确认（AlertDialog）

## 第一步：创建项目

### 1.1 在DevEco Studio中创建新项目

1. 打开DevEco Studio
2. 点击"Create Project"
3. 选择"Application"
4. 选择"Empty Ability"
5. 配置项目信息：
   - Project name: MultipleDialog
   - Bundle name: com.huawei.multipledialog
   - Save location: 选择合适的保存位置
   - Language: ArkTS
   - API version: 选择适当的API版本（建议API 12及以上）
6. 点击"Finish"

### 1.2 项目结构说明

创建完成后，项目结构如下：
```
MultipleDialog/
├── AppScope/
│   └── app.json5                    # 应用级配置
├── entry/
│   ├── build-profile.json5          # 构建配置
│   ├── oh-package.json5             # 包依赖配置
│   └── src/main/
│       ├── ets/                     # ArkTS源码目录
│       │   ├── entryability/        # 应用入口
│       │   ├── pages/               # 页面文件
│       │   ├── view/                # 自定义组件
│       │   └── utils/               # 工具类
│       └── resources/               # 资源文件
│           ├── base/                # 基础资源
│           ├── en_US/               # 英文资源
│           └── zh_CN/               # 中文资源
└── oh-package.json5                 # 项目根配置
```

## 第二步：配置项目文件

### 2.1 应用配置文件

**AppScope/app.json5** - 应用级配置
```json
{
  "app": {
    "bundleName": "com.huawei.multipledialog",
    "vendor": "example",
    "versionCode": 1000000,
    "versionName": "1.0.0",
    "icon": "$media:app_icon",
    "label": "$string:app_name"
  }
}
```

**entry/src/main/module.json5** - 模块配置
```json
{
  "module": {
    "name": "entry",
    "type": "entry",
    "description": "$string:module_desc",
    "mainElement": "EntryAbility",
    "deviceTypes": [
      "phone"
    ],
    "deliveryWithInstall": true,
    "installationFree": false,
    "pages": "$profile:main_pages",
    "abilities": [
      {
        "name": "EntryAbility",
        "srcEntry": "./ets/entryability/EntryAbility.ets",
        "description": "$string:EntryAbility_desc",
        "icon": "$media:layered_image",
        "label": "$string:EntryAbility_label",
        "startWindowIcon": "$media:startIcon",
        "startWindowBackground": "$color:start_window_background",
        "exported": true,
        "skills": [
          {
            "entities": [
              "entity.system.home"
            ],
            "actions": [
              "action.system.home"
            ]
          }
        ]
      }
    ],
    "extensionAbilities": [
      {
        "name": "EntryBackupAbility",
        "srcEntry": "./ets/entrybackupability/EntryBackupAbility.ets",
        "type": "backup",
        "exported": false,
        "metadata": [
          {
            "name": "ohos.extension.backup",
            "resource": "$profile:backup_config"
          }
        ],
      }
    ]
  }
}
```

**entry/build-profile.json5** - 构建配置
```json
{
  "apiType": "stageMode",
  "buildOption": {
  },
  "buildOptionSet": [
    {
      "name": "release",
      "arkOptions": {
        "obfuscation": {
          "ruleOptions": {
            "enable": false,
            "files": [
              "./obfuscation-rules.txt"
            ]
          }
        }
      }
    },
  ],
  "targets": [
    {
      "name": "default"
    }
  ]
}
```

### 2.2 页面路由配置

**entry/src/main/resources/base/profile/main_pages.json**
```json
{
  "src": [
    "pages/Index"
  ]
}
```

## 第三步：资源文件配置

### 3.1 字符串资源

**entry/src/main/resources/base/element/string.json**
```json
{
  "string": [
    {
      "name": "module_desc",
      "value": "module description"
    },
    {
      "name": "EntryAbility_desc",
      "value": "description"
    },
    {
      "name": "EntryAbility_label",
      "value": "MultipleDialog"
    },
    {
      "name": "multi_popup_interaction",
      "value": "Add pop-ups to your app"
    },
    {
      "name": "personalInformation",
      "value": "PersonalInformation"
    },
    {
      "name": "hobbies_and_interests",
      "value": "Hobbies and interests"
    },
    {
      "name": "cancel",
      "value": "Cancel"
    },
    {
      "name": "confirm",
      "value": "Confirm"
    },
    {
      "name": "male",
      "value": "Male"
    },
    {
      "name": "female",
      "value": "Female"
    },
    {
      "name": "save",
      "value": "Save"
    },
    {
      "name": "save_successfully",
      "value": "Save successfully"
    },
    {
      "name": "nickname",
      "value": "Nickname"
    },
    {
      "name": "date_of_birth",
      "value": "Date of birth"
    },
    {
      "name": "sex",
      "value": "Sex"
    },
    {
      "name": "personal_signature",
      "value": "Personal signature"
    },
    {
      "name": "Hobbies_multiple_choices",
      "value": "Hobbies (multiple choices)"
    },
    {
      "name": "tips",
      "value": "Data on the current page is not saved. Determine whether to leave"
    },
    {
      "name": "year",
      "value": "/"
    },
    {
      "name": "month",
      "value": "/"
    },
    {
      "name": "day",
      "value": ""
    }
  ]
}
```

### 3.2 字符串数组资源

**entry/src/main/resources/base/element/stringarray.json**
```json
{
  "strarray": [
    {
      "name": "sex_array",
      "value": [
        {
          "value": "male"
        },
        {
          "value": "female"
        }
      ]
    },
    {
      "name": "hobbies_data",
      "value": [
        {
          "value": "Soccer"
        },
        {
          "value": "Badminton"
        },
        {
          "value": "Travelling"
        },
        {
          "value": "Playing games"
        },
        {
          "value": "Reading books"
        }
      ]
    }
  ]
}
```

### 3.3 颜色资源

**entry/src/main/resources/base/element/color.json**
```json
{
  "color": [
    {
      "name": "start_window_background",
      "value": "#FFFFFF"
    }
  ]
}
```

## 第四步：工具类开发

### 4.1 创建通用工具类

**entry/src/main/ets/utils/CommonUtils.ets**
```typescript
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

// 通用工具类，提供常用的数据处理和格式化方法
export default class CommonUtils {

  // 检查对象是否为空（null、undefined）
  static isEmpty(obj: Object | string | number): boolean {
    return obj === undefined || obj === null;
  }

  // 检查数组是否为空或长度为0
  static isEmptyArr(arr: Array<Object>): boolean {
    return arr === undefined || arr === null || arr.length === 0;
  }

  // 获取格式化的生日字符串，格式：YYYY年MM月DD日
  static getBirthDateValue(year: number, month: number, day: number): string {
    let birthDate: string = `${year}年${month.toString().padStart(2, '0')}月${day.toString().padStart(2, '0')}日`;
    return birthDate;
  }
}
```

**代码解析：**
- `isEmpty`: 检查对象是否为空，用于数据验证
- `isEmptyArr`: 检查数组是否为空，用于列表数据验证
- `getBirthDateValue`: 格式化生日显示，将年月日格式化为中文显示格式

## 第五步：自定义组件开发

### 5.1 创建文本输入组件

**entry/src/main/ets/view/TextInputComponent.ets**
```typescript
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

// 自定义文本输入组件，用于个人信息的输入字段
@Component
export default struct TextInputComponent {
  @Link text: string;               // 双向绑定的文本值
  inputImage?: Resource;            // 可选的输入框图标
  hintText?: ResourceStr;           // 可选的提示文本

  build() {
    Row() {
      // 左侧图标
      Image(this.inputImage !== undefined ? this.inputImage : '')
        .width(26)                  // 图标宽度26
        .height(26)                 // 图标高度26
        .margin({ left: 12 })       // 左边距12

      // 文本输入框
      TextInput({ placeholder: this.hintText, text: this.text })
        .fontSize(17)               // 字体大小17
        .padding({ left: 12 })      // 左内边距12
        .backgroundColor(Color.White) // 背景色白色
        .fontWeight(FontWeight.Normal) // 字体粗细正常
        .fontStyle(FontStyle.Normal)   // 字体样式正常
        .fontColor(Color.Black)        // 字体颜色黑色
        .opacity(0.9)                  // 透明度0.9
        .margin({ right: 32 })         // 右边距32
        .layoutWeight(1)               // 布局权重1，占据剩余空间
        .height(48)                    // 高度48
        .enableKeyboardOnFocus(false)  // 禁用聚焦时自动弹出键盘
        .onChange((value: string) => {
          // 文本改变时的回调处理
          if (this.text !== value) {
            this.text = value;                              // 更新绑定的文本值
            AppStorage.setOrCreate('inputIsEdit', true);    // 标记为已编辑状态
          }
          if (!value) {
            AppStorage.setOrCreate('inputIsEdit', false);   // 文本为空时取消编辑状态
          }
        })
    }
    .margin({ top: 12 })            // 顶部边距12
    .borderRadius(24)               // 圆角半径24
    .backgroundColor(Color.White)   // 背景色白色
    .width('100%')                  // 宽度100%
    .height(64)                     // 高度64
  }
}
```

**代码解析：**
- `@Link`: 实现父子组件间的双向数据绑定
- `enableKeyboardOnFocus(false)`: 禁用自动弹出键盘，提供更好的用户体验
- `AppStorage`: 全局状态管理，用于跟踪编辑状态

### 5.2 创建文本显示组件

**entry/src/main/ets/view/TextCommonComponent.ets**
```typescript
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

// 自定义文本显示组件，用于显示可点击的信息项
@Component
export default struct TextCommonComponent {
  @Link content: ResourceStr;       // 双向绑定的内容值
  textImage?: Resource;             // 可选的左侧图标
  title?: ResourceStr;              // 可选的标题文本
  onItemClick = (): void => {};     // 点击事件回调函数

  build() {
    Row() {
      // 左侧图标
      Image(this.textImage !== undefined ? this.textImage : '')
        .width(26)                  // 图标宽度26
        .height(26)                 // 图标高度26
        .margin({ left: 12 })       // 左边距12

      // 标题文本
      Text(this.title)
        .fontSize(17)               // 字体大小17
        .margin({ left: 16 })       // 左边距16
        .height('100%')             // 高度100%
        .opacity(0.9)               // 透明度0.9

      // 内容文本
      Text(this.content)
        .fontSize(17)               // 字体大小17
        .opacity(0.9)               // 透明度0.9
        .textAlign(TextAlign.End)   // 文本右对齐
        .textOverflow({ overflow: TextOverflow.Ellipsis }) // 超长文本省略号处理
        .maxLines(1)                // 最大行数1
        .margin({                   // 边距设置
          left: 16,
          right: 7
        })
        .height('100%')             // 高度100%
        .layoutWeight(1)            // 布局权重1，占据剩余空间
        .width('100%')              // 宽度100%

      // 右侧箭头图标
      Image($r('app.media.chevron_right'))
        .width(13)                  // 箭头宽度13
        .height(13)                 // 箭头高度13
        .margin({ right: 14 })      // 右边距14
    }
    .margin({ top: 12 })            // 顶部边距12
    .borderRadius(24)               // 圆角半径24
    .backgroundColor(Color.White)   // 背景色白色
    .width('100%')                  // 宽度100%
    .height(64)                     // 高度64
    .onClick(this.onItemClick)      // 绑定点击事件
  }
}
```

**代码解析：**
- `textOverflow`: 处理文本溢出，超长文本显示省略号
- `layoutWeight(1)`: 让内容文本占据剩余空间
- `onItemClick`: 点击回调函数，由父组件传入

### 5.3 创建弹窗管理类

**entry/src/main/ets/view/Dialog.ets**
```typescript
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

// 导入必要的模块
import { BusinessError } from '@kit.BasicServicesKit';        // 错误处理
import { ComponentContent, promptAction, UIContext } from '@kit.ArkUI'; // UI组件和弹窗API
import { hilog } from '@kit.PerformanceAnalysisKit';          // 日志系统

// 弹窗操作管理类，用于统一管理自定义弹窗的生命周期
class PromptActionClass {
  private ctx: UIContext | undefined = undefined;                        // UI上下文
  private contentNode: ComponentContent<Object> | undefined = undefined; // 弹窗内容组件
  private options: promptAction.BaseDialogOptions | undefined = undefined; // 弹窗配置选项

  // 设置UI上下文，必须在弹窗操作前设置
  setContext(context: UIContext) {
    this.ctx = context;
  }

  // 设置弹窗内容组件节点
  setContentNode(node: ComponentContent<Object>) {
    this.contentNode = node;
  }

  // 设置弹窗配置选项（如对齐方式、遮罩等）
  setOptions(options: promptAction.BaseDialogOptions) {
    this.options = options;
  }

  // 打开自定义弹窗
  openDialog() {
    if (this.contentNode !== null) {
      this.ctx?.getPromptAction().openCustomDialog(this.contentNode, this.options)
        .then(() => {
          // 弹窗打开成功的回调
          hilog.info(0xFF00, 'PersonalInformation', '%{public}s', 'OpenCustomDialog complete');
        })
        .catch((error: BusinessError) => {
          // 弹窗打开失败的错误处理
          let message = (error as BusinessError).message;
          let code = (error as BusinessError).code;
          hilog.error(0xFF00, 'PersonalInformation', '%{public}s',
            `OpenCustomDialog args error code is ${code}, message is ${message}`);
        })
    }
  }

  // 关闭自定义弹窗
  closeDialog() {
    if (this.contentNode !== null) {
      this.ctx?.getPromptAction().closeCustomDialog(this.contentNode)
        .then(() => {
          // 弹窗关闭成功的回调
          hilog.info(0xFF00, 'PersonalInformation', '%{public}s', 'CloseCustomDialog complete');
        })
        .catch((error: BusinessError) => {
          // 弹窗关闭失败的错误处理
          let message = (error as BusinessError).message;
          let code = (error as BusinessError).code;
          hilog.error(0xFF00, 'PersonalInformation', '%{public}s',
            `CloseCustomDialog args error code is ${code}, message is ${message}`);
        })
    }
  }

  // 更新自定义弹窗内容
  updateDialog(options: Object) {
    if (this.contentNode !== null) {
      this.ctx?.getPromptAction().updateCustomDialog(this.contentNode, options)
        .then(() => {
          // 弹窗更新成功的回调
          hilog.info(0xFF00, 'PersonalInformation', '%{public}s', 'UpdateCustomDialog complete');
        })
        .catch((error: BusinessError) => {
          // 弹窗更新失败的错误处理
          let message = (error as BusinessError).message;
          let code = (error as BusinessError).code;
          hilog.error(0xFF00, 'PersonalInformation', '%{public}s',
            `UpdateCustomDialog args error code is ${code}, message is ${message}`);
        })
    }
  }
}

// 导出弹窗管理类的单例实例
export default new PromptActionClass();
```

**代码解析：**
- 单例模式：确保全局只有一个弹窗管理实例
- Promise处理：使用then/catch处理异步弹窗操作
- 错误处理：完整的错误日志记录
- UI上下文管理：统一管理弹窗的UI上下文

## 第六步：主页面开发

### 6.1 创建应用入口页面

**entry/src/main/ets/pages/Index.ets**
```typescript
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
          .fontSize(30)                               // 设置字体大小为30
          .opacity(0.9)                               // 设置透明度为0.9
          .fontWeight(FontWeight.Bold)                // 设置字体粗细为加粗
          .width('100%')                              // 设置宽度为100%
          .height(56)                                 // 设置高度为56
          .margin({ top: 56 })                        // 设置上边距为56

        // 按钮容器
        Column({ space: 12 }) {
          // 个人信息按钮
          Button($r('app.string.personalInformation'))
            .onClick(() => {
              // 点击按钮时，跳转到个人信息页面
              this.pathStack.pushPath({ name: 'PersonalInformation' });
            })
            .width('100%')                            // 按钮宽度100%
        }
        .height(248)                                  // 按钮容器高度
        .width('100%')                                // 按钮容器宽度100%
        .justifyContent(FlexAlign.End)                // 内容对齐到底部
      }
      .width('100%')                                  // 主容器宽度100%
      .height('100%')                                 // 主容器高度100%
      .justifyContent(FlexAlign.SpaceBetween)         // 内容垂直间距分布
      .padding({                                      // 设置内边距
        left: 16,
        right: 16,
        bottom: 16
      })
    }
    .backgroundColor('#F1F3F5')                       // 设置背景色为浅灰色
    .navDestination(this.PagesMap)                    // 设置导航目标映射
    .mode(NavigationMode.Stack)                       // 设置导航模式为栈模式
    .hideToolBar(true)                                // 隐藏工具栏
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM]) // 扩展安全区域
  }
}
```

**代码解析：**
- `@Provide/@Consume`: 实现跨组件的数据共享
- `NavPathStack`: 导航栈管理页面跳转
- `@Builder`: 构建器函数，用于动态构建页面组件
- `expandSafeArea`: 扩展到系统安全区域

## 第七步：个人信息页面开发

### 7.1 创建个人信息页面

**entry/src/main/ets/pages/PersonalInformation.ets**
```typescript
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

// 导入日志工具
import { hilog } from '@kit.PerformanceAnalysisKit';
// 导入UI组件内容类
import { ComponentContent } from '@kit.ArkUI';
// 导入自定义文本输入组件
import TextInputComponent from '../view/TextInputComponent';
// 导入自定义文本显示组件
import TextCommonComponent from '../view/TextCommonComponent';
// 导入通用工具类
import CommonUtils from '../utils/CommonUtils';
// 导入弹窗操作类
import PromptActionClass from '../view/Dialog';

// 爱好项目数据类
class HobbyItem {
  label?: string;      // 爱好标签
  isChecked?: boolean; // 是否选中
}

// 参数传递类，用于向Builder传递数据
class Params {
  hobbyItems: HobbyItem[] = [];  // 爱好项目列表

  constructor(hobbyItems: HobbyItem[]) {
    this.hobbyItems = hobbyItems;
  }
}

// 扩展Button组件样式，定义弹窗按钮的统一样式
@Extend(Button)
function dialogButtonStyle() {
  .fontSize(16)                 // 字体大小16
  .fontColor('#0A59F7')         // 字体颜色蓝色
  .layoutWeight(1)              // 布局权重1，平分空间
  .backgroundColor(Color.White) // 背景色白色
  .width('100%')                // 宽度100%
  .height(40)                   // 高度40
}

// 设置爱好值的工具函数，将选中的爱好项目转换为逗号分隔的字符串
function setHobbiesValue(hobbyItems: HobbyItem[]) {
  // 检查爱好项目数组是否为空
  if (CommonUtils.isEmptyArr(hobbyItems)) {
    hilog.info(0xFF00, 'PersonalInformation', '%{public}s', 'hobbyItems length is 0');
    return;
  }
  let hobbiesText: string = '';
  // 过滤出选中的项目，提取标签，并用逗号连接
  hobbiesText = hobbyItems.filter((isCheckItem: HobbyItem) => isCheckItem?.isChecked)
    .map<string>((checkedItem: HobbyItem) => {
      return checkedItem.label!;
    })
    .join(',');
  return hobbiesText;
}

// 构建爱好选择弹窗内容的Builder函数
@Builder
function buildHobbyItems(params: Params) {
  Column() {
    // 爱好和兴趣标题
    Text($r('app.string.hobbies_and_interests'))
      .fontSize(20)                    // 字体大小20
      .opacity(0.9)                    // 透明度0.9
      .lineHeight(28)                  // 行高28
      .fontWeight(700)                 // 字体粗细700（加粗）
      .alignSelf(ItemAlign.Start)      // 左对齐
      .margin({ left: 24 })            // 左边距24

    // 爱好选项列表
    List() {
      // 遍历爱好项目，生成列表项
      ForEach(params.hobbyItems, (itemHobby: HobbyItem) => {
        ListItem() {
          Row() {
            // 爱好标签文本
            Text(itemHobby.label)
              .fontSize(16)                 // 字体大小16
              .opacity(0.9)                 // 透明度0.9
              .layoutWeight(1)              // 布局权重1，占据剩余空间
              .textAlign(TextAlign.Start)   // 文本左对齐
              .fontWeight(500)              // 字体粗细500
              .margin({ left: 24 })         // 左边距24
            // 复选框组件
            Toggle({ type: ToggleType.Checkbox, isOn: false })
              .onChange((isCheck) => {
                // 复选框状态改变时，更新爱好项目的选中状态
                itemHobby.isChecked = isCheck;
              })
              .width(20)                    // 复选框宽度20
              .height(20)                   // 复选框高度20
              .margin({ right: 24 })        // 右边距24
          }
          .height(22)                       // 行高度22
          .margin({                         // 设置上下边距
            top: 13,
            bottom: 13
          })
        }
      }, (itemHobby: HobbyItem) => JSON.stringify(itemHobby.label))  // 使用标签作为唯一标识符
    }
    .margin({                           // 列表边距
      top: 14,
      bottom: 8
    })
    .divider({                          // 列表分割线样式
      strokeWidth: 0.5,                 // 线宽0.5
      color: '#0D182431'                // 线颜色
    })
    .listDirection(Axis.Vertical)       // 列表方向为垂直
    .edgeEffect(EdgeEffect.None)        // 禁用边缘效果
    .width('100%')                      // 宽度100%
    .height(242)                        // 高度242

    // 弹窗底部按钮行
    Row() {
      // 取消按钮
      Button($r('app.string.cancel'))
        .dialogButtonStyle()            // 应用统一按钮样式
        .onClick(() => {
          // 点击取消，关闭弹窗
          PromptActionClass.closeDialog()
        })
      // 分割线
      Blank()
        .backgroundColor('#F2F2F2')     // 分割线颜色
        .width(1)                       // 分割线宽度1
        .opacity(1)                     // 不透明
        .height(25)                     // 分割线高度25
        .margin({ left: 8, right: 8 })  // 左右边距各8
      // 确认按钮
      Button($r('app.string.confirm'))
        .dialogButtonStyle()            // 应用统一按钮样式
        .onClick(() => {
          // 点击确认，关闭弹窗并保存选择
          PromptActionClass.closeDialog();
          let text = setHobbiesValue(params.hobbyItems);  // 获取选中的爱好文本
          AppStorage.setOrCreate('Hobbies', text);        // 保存到全局存储
          AppStorage.setOrCreate('isEdit', true);         // 标记为已编辑
        })
    }
    .padding({                          // 按钮行内边距
      left: 16,
      right: 16
    })
  }
  .width('93.3%')                       // 弹窗宽度
  .padding({                            // 弹窗内边距
    top: 14,
    bottom: 16
  })
  .borderRadius(32)                     // 弹窗圆角
  .backgroundColor(Color.White)         // 弹窗背景色
}

// 个人信息页面组件
@Component
export struct PersonalInformation {
  // 使用StorageLink装饰器实现与全局存储的双向绑定
  @StorageLink('nikeName') nikeName: string = '';           // 昵称
  @StorageLink('signature') signature: string = '';         // 个人签名
  @StorageLink('birthDate') birthDate: string = '';         // 生日
  @StorageLink('sex') sex: ResourceStr = $r('app.string.male'); // 性别
  @StorageLink('Hobbies') hobbies: string = '';             // 爱好
  @StorageLink('selectTime') selectTime: Date = new Date('2000-12-25T08:30:00'); // 选择的时间
  @State hobbyItems: HobbyItem[] = [];                      // 爱好项目列表
  @StorageLink('select') select: number = 0;                // 选择的索引
  @StorageLink('isEdit') isEdit: boolean = false;           // 是否已编辑
  @State customPopup: boolean = false                       // 自定义气泡弹窗状态
  @State isSaved: boolean = false;                          // 是否已保存
  @Consume('NavPathStack') pathStack: NavPathStack;         // 消费导航栈
  private sexArray: Resource = $r('app.strarray.sex_array'); // 性别数组资源
  private currentDate: string = '';                         // 当前日期字符串
  private ctx: UIContext = this.getUIContext();             // UI上下文
  // 自定义弹窗内容节点
  private contentNode: ComponentContent<Object> =
    new ComponentContent(this.ctx, wrapBuilder(buildHobbyItems),
      new Params(this.hobbyItems));

  // 气泡弹窗构建器，定义保存按钮的气泡内容
  @Builder
  PopupBuilder() {
    Row({ space: 2 }) {
      Text($r('app.string.save'))
        .fontSize(16)                   // 字体大小16
        .opacity(0.9)                   // 透明度0.9
    }
    .onClick(() => {
      // 点击保存操作
      this.isSaved = true;                                  // 标记为已保存
      this.customPopup = false;                             // 关闭气泡弹窗
      AppStorage.setOrCreate('isEdit', false);              // 重置编辑状态
      // 显示保存成功的吐司提示
      this.ctx.getPromptAction().showToast({
        message: $r('app.string.save_successfully'),        // 显示保存成功消息
        duration: 2000                                      // 持续时间2秒
      })
      // 保存所有数据到全局存储
      AppStorage.setOrCreate('nikeName', this.nikeName);
      AppStorage.setOrCreate('signature', this.signature);
      AppStorage.setOrCreate('birthDate', this.birthDate);
      AppStorage.setOrCreate('selectTime', this.selectTime);
      AppStorage.setOrCreate('sex', this.sex);
      AppStorage.setOrCreate('select', this.select);
      AppStorage.setOrCreate('hobbies', this.hobbies);
      AppStorage.setOrCreate('isEdit', false);
    })
    .width(200)                         // 气泡宽度200
    .height(50)                         // 气泡高度50
    .padding(16)                        // 气泡内边距16
  }

  // 组件即将出现时的生命周期回调
  aboutToAppear() {
    // 初始化弹窗管理类
    PromptActionClass.setContext(this.ctx);                 // 设置UI上下文
    PromptActionClass.setOptions({ alignment: DialogAlignment.Center }); // 设置弹窗居中对齐

    // 初始化当前日期
    let date = new Date();
    let year = date.getFullYear();
    let month = date.getMonth() + 1;
    let day = date.getDate();
    this.currentDate = year + '-' + month + '-' + day;
    this.selectTime = new Date(`${this.currentDate}T08:30:00`);

    // 如果生日为空，设置默认生日
    if (!this.birthDate) {
      this.birthDate = CommonUtils.getBirthDateValue(year, month, day);
    }

    // 获取应用上下文和资源管理器
    let context = this.getUIContext().getHostContext() as Context;
    if ((CommonUtils.isEmpty(context)) || (CommonUtils.isEmpty(context.resourceManager))) {
      hilog.info(0xFF00, 'PersonalInformation', '%{public}s', 'context or resourceManager is null');
      return;
    }
  }

  // 导航目标标题构建器，包含保存按钮
  @Builder
  NavDestinationTitle() {
    Column() {
      Row() {
        // 保存按钮图标
        Image($r('app.media.dot_grid'))
          .width(24)                    // 图标宽度24
          .height(24)                   // 图标高度24
      }
      .width(40)                        // 按钮容器宽度40
      .height(40)                       // 按钮容器高度40
      .borderRadius(36)                 // 圆形按钮
      .backgroundColor('#E9E9E9')       // 按钮背景色
      .justifyContent(FlexAlign.Center) // 图标居中
      .onClick(() => {
        // 点击保存按钮，切换气泡弹窗状态
        this.customPopup = !this.customPopup
      })
      .bindPopup(this.customPopup, {    // 绑定气泡弹窗
        builder: this.PopupBuilder,     // 气泡内容构建器
        placement: Placement.Bottom,    // 气泡位置在底部
        onStateChange: (e) => {         // 气泡状态改变回调
          if (!e.isVisible) {
            this.customPopup = false;   // 气泡隐藏时重置状态
          }
        }
      })
    }
    .alignItems(HorizontalAlign.End)    // 右对齐
    .padding({ top: 8, right: 16 })     // 顶部和右侧内边距
    .width('calc(100% - 56vp)')         // 计算宽度，减去左侧返回按钮宽度
  }

  // 构建个人信息页面UI
  build() {
    NavDestination() {
      Column() {
        // 页面头部：头像和标题
        Column({ space: 12 }) {
          Image($r('app.media.ic_avatar'))
            .width(56)                          // 头像宽度56
            .height(56)                         // 头像高度56
            .alignSelf(ItemAlign.Center)        // 头像居中对齐
          Text($r('app.string.personalInformation'))
            .fontSize(17)                       // 标题字体大小17
            .opacity(0.9)                       // 标题透明度0.9
        }
        .width('100%')                          // 头部容器宽度100%
        .alignItems(HorizontalAlign.Center)     // 头部内容居中对齐

        // 昵称输入区域
        Column() {
          TextInputComponent({
            inputImage: $r('app.media.person'),       // 左侧人员图标
            text: this.nikeName,                      // 绑定昵称数据
            hintText: $r('app.string.nickname')       // 提示文本
          })
        }
        .margin({ top: 12 })                    // 顶部边距12

        // 生日选择区域
        Column() {
          TextCommonComponent({
            textImage: $r('app.media.calendar'),      // 左侧日历图标
            title: $r('app.string.date_of_birth'),   // 标题文本
            content: this.birthDate,                  // 显示内容
            onItemClick: () => {                      // 点击事件回调
              // 显示日期选择器弹窗
              this.getUIContext().showDatePickerDialog({
                start: new Date('1925-1-1'),          // 开始日期
                end: new Date('2055-1-1'),            // 结束日期
                selected: this.selectTime,            // 当前选中日期
                lunarSwitch: true,                    // 启用农历切换
                showTime: false,                      // 不显示时间
                onDateAccept: (value: Date) => {      // 日期确认回调
                  this.selectTime = value;            // 更新选中时间
                  // 解析日期并格式化显示
                  let birthDateArray = JSON.stringify(value).slice(1, 11).split('-');
                  let year = Number(birthDateArray[0]);
                  let month = Number(birthDateArray[1]);
                  let day = Number(birthDateArray[2]);
                  this.birthDate = CommonUtils.getBirthDateValue(year, month, day);
                  AppStorage.setOrCreate('isEdit', true); // 标记为已编辑
                }
              })
            }
          })
        }

        // 性别选择区域
        Column() {
          TextCommonComponent({
            textImage: $r('app.media.person_2'),      // 左侧性别图标
            title: $r('app.string.sex'),             // 标题文本
            content: this.sex,                        // 显示内容
            onItemClick: () => {                      // 点击事件回调
              // 显示文本选择器弹窗
              this.getUIContext().showTextPickerDialog({
                range: this.sexArray,                 // 选择范围
                selected: this.select,                // 当前选中项
                canLoop: false,                       // 不允许循环滚动
                onAccept: (value: TextPickerResult) => { // 选择确认回调
                  this.select = value.index as number;    // 更新选中索引
                  this.sex = value.value as string;       // 更新选中值
                  AppStorage.setOrCreate('isEdit', true);  // 标记为已编辑
                },
                onChange: (value: TextPickerResult) => { // 选择改变回调
                  this.select = value.index as number;    // 更新选中索引
                }
              })
            }
          })
        }

        // 个人签名输入区域
        Column() {
          TextInputComponent({
            inputImage: $r('app.media.doc_plaintext_and_pencil'), // 左侧编辑图标
            text: this.signature,                     // 绑定签名数据
            hintText: $r('app.string.personal_signature') // 提示文本
          })
        }

        // 爱好选择区域
        Column() {
          TextCommonComponent({
            textImage: $r('app.media.heart'),         // 左侧心形图标
            title: $r('app.string.Hobbies_multiple_choices'), // 标题文本
            content: this.hobbies,                    // 显示内容
            onItemClick: () => {                      // 点击事件回调
              this.hobbyItems = [];                   // 重置爱好列表
              let context = this.getUIContext().getHostContext() as Context;
              if ((CommonUtils.isEmpty(context)) || (CommonUtils.isEmpty(context.resourceManager))) {
                return;
              }
              let manager = context.resourceManager;
              // 异步获取爱好数据
              manager.getStringArrayValue($r('app.strarray.hobbies_data').id, (error, hobbyArray) => {
                if (!CommonUtils.isEmpty(error)) {
                  hilog.info(0xFF00, 'PersonalInformation', '%{public}s', 'error = ' + JSON.stringify(error));
                } else {
                  // 构建爱好项目列表
                  hobbyArray.forEach((hobbyItem: string) => {
                    let tmpHobbyItem = new HobbyItem();
                    tmpHobbyItem.label = hobbyItem;     // 设置爱好标签
                    tmpHobbyItem.isChecked = false;     // 初始为未选中
                    this.hobbyItems.push(tmpHobbyItem); // 添加到列表
                  });
                  // 创建新的弹窗内容节点并显示
                  this.contentNode =
                    new ComponentContent(this.ctx, wrapBuilder(buildHobbyItems), new Params(this.hobbyItems));
                  PromptActionClass.setContentNode(this.contentNode);
                  PromptActionClass.openDialog();       // 打开自定义弹窗
                  AppStorage.setOrCreate('isEdit', true); // 标记为已编辑
                }
              });
            }
          })
        }
      }
      .padding(16)                              // 页面内边距16
    }
    .onBackPressed(() => {                      // 返回按钮按下处理
      let inputIsEdit: boolean | undefined = AppStorage.get('inputIsEdit');
      // 如果有未保存的编辑，显示确认弹窗
      if (!this.isSaved && (this.isEdit || inputIsEdit)) {
        this.getUIContext().showAlertDialog({
          message: $r('app.string.tips'),       // 提示消息
          autoCancel: true,                     // 允许自动取消
          alignment: DialogAlignment.Center,    // 居中对齐
          offset: { dx: 0, dy: -20 },          // 偏移量
          gridCount: 4,                         // 网格数
          buttons: [                            // 按钮配置
            {
              value: $r('app.string.cancel'),   // 取消按钮
              action: () => {                   // 取消操作
                hilog.info(0xFF00, 'PersonalInformation', '%{public}s', 'Callback when the first button is clicked');
              }
            },
            {
              value: $r('app.string.confirm'),  // 确认按钮
              action: () => {                   // 确认操作：清空数据并返回
                this.nikeName = '';
                this.sex = $r('app.string.male');
                this.birthDate = '';
                this.signature = '';
                this.hobbies = '';
                AppStorage.setOrCreate('isEdit', false);
                AppStorage.setOrCreate('inputIsEdit', false);
                this.pathStack.pop();           // 返回上一页
              }
            }
          ]
        })
        return true;                            // 拦截返回操作
      }
      return false;                             // 允许正常返回
    })
    .title(this.NavDestinationTitle())          // 设置导航标题
    .backgroundColor('#F1F3F5')                 // 设置背景色
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM]) // 扩展安全区域
  }
}
```

**代码解析：**
- `@StorageLink`: 实现与AppStorage的双向绑定
- `ComponentContent`: 用于创建自定义弹窗内容
- `wrapBuilder`: 包装Builder函数用于组件内容
- `onBackPressed`: 处理返回按钮事件，实现未保存数据的确认提示

## 第八步：运行和测试

### 8.1 构建项目

1. 在DevEco Studio中点击"Build" > "Build Hap(s)/APP(s)"
2. 确保构建成功，无错误和警告

### 8.2 运行应用

1. 连接HarmonyOS设备或启动模拟器
2. 点击"Run"按钮或按Ctrl+R
3. 应用将自动安装并启动

### 8.3 功能测试

测试以下功能：

1. **主页面导航**：
   - 点击"PersonalInformation"按钮跳转到个人信息页面

2. **文本输入功能**：
   - 测试昵称输入框
   - 测试个人签名输入框
   - 验证输入状态的正确跟踪

3. **日期选择器**：
   - 点击"生日"项目
   - 选择不同日期
   - 验证日期格式化显示

4. **文本选择器**：
   - 点击"性别"项目
   - 在男女选项间切换
   - 验证选择结果的保存

5. **自定义弹窗**：
   - 点击"爱好"项目
   - 选择多个爱好选项
   - 测试取消和确认功能

6. **气泡弹窗**：
   - 点击右上角保存按钮
   - 验证保存成功提示

7. **返回确认**：
   - 编辑任意信息后点击返回
   - 验证未保存提示弹窗

## 第九步：高级功能说明

### 9.1 状态管理机制

本应用使用了多种状态管理方式：

1. **@State**: 组件内部状态
2. **@Link**: 父子组件双向绑定
3. **@StorageLink**: 与全局存储双向绑定
4. **@Provide/@Consume**: 跨组件数据共享

### 9.2 弹窗类型总结

应用展示了6种不同的弹窗类型：

1. **TextInput**: 文本输入（昵称、签名）
2. **DatePickerDialog**: 日期选择器（生日）
3. **TextPickerDialog**: 文本选择器（性别）
4. **CustomDialog**: 自定义弹窗（爱好选择）
5. **Popup**: 气泡弹窗（保存按钮）
6. **AlertDialog**: 警告弹窗（返回确认）

### 9.3 生命周期管理

- `aboutToAppear()`: 组件初始化
- `onBackPressed()`: 返回按钮处理
- 弹窗生命周期管理（打开、关闭、更新）

## 第十步：扩展和优化

### 10.1 可能的扩展功能

1. **数据持久化**: 使用preferences API保存数据
2. **表单验证**: 添加输入验证逻辑
3. **国际化**: 支持多语言
4. **主题切换**: 支持深色模式
5. **动画效果**: 添加页面转场动画

### 10.2 性能优化建议

1. **LazyForEach**: 大列表使用懒加载
2. **组件复用**: 提取公共组件
3. **状态优化**: 减少不必要的状态更新
4. **内存管理**: 及时清理资源

## 总结

本教程详细介绍了HarmonyOS多弹窗交互应用的完整开发过程，涵盖了：

1. **项目创建和配置**: 从零开始建立项目结构
2. **资源管理**: 字符串、数组、颜色资源的配置
3. **组件开发**: 自定义可复用组件的设计
4. **状态管理**: 多种状态管理装饰器的使用
5. **弹窗交互**: 6种不同弹窗类型的实现
6. **生命周期**: 组件和页面生命周期的处理
7. **用户体验**: 完整的交互流程设计

通过本教程，开发者可以深入理解HarmonyOS应用开发的核心概念，掌握复杂交互场景的实现方法，为开发更丰富的HarmonyOS应用打下坚实基础。