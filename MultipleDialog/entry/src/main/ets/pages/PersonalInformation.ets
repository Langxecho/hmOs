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
        .backgroundColor('#F2F2F2')    // 背景色浅灰色
        .width(1)                       // 宽度1
        .opacity(1)                     // 透明度1
        .height(25)                     // 高度25
        .margin({ left: 8, right: 8 })  // 左右边距8
      // 确认按钮
      Button($r('app.string.confirm'))
        .dialogButtonStyle()            // 应用统一按钮样式
        .onClick(() => {
          PromptActionClass.closeDialog();  // 关闭弹窗
          let text = setHobbiesValue(params.hobbyItems);  // 获取选中的爱好文本
          AppStorage.setOrCreate('Hobbies', text);        // 保存爱好到全局存储
          AppStorage.setOrCreate('isEdit', true);         // 设置编辑标记为true
        })
    }
    .padding({                          // 按钮行内边距
      left: 16,
      right: 16
    })
  }
  .width('93.3%')                       // 弹窗宽度93.3%
  .padding({                            // 弹窗内边距
    top: 14,
    bottom: 16
  })
  .borderRadius(32)                     // 圆角半径32
  .backgroundColor(Color.White)         // 背景色白色
}

// 个人信息页面组件
@Component
export struct PersonalInformation {
  // 昵称，关联全局存储
  @StorageLink('nikeName') nikeName: string = '';
  // 个性签名，关联全局存储
  @StorageLink('signature') signature: string = '';
  // 出生日期，关联全局存储
  @StorageLink('birthDate') birthDate: string = '';
  // 性别，关联全局存储，默认为男性
  @StorageLink('sex') sex: ResourceStr = $r('app.string.male');
  // 爱好，关联全局存储
  @StorageLink('Hobbies') hobbies: string = '';
  // 选择的时间，关联全局存储
  @StorageLink('selectTime') selectTime: Date = new Date('2000-12-25T08:30:00');
  // 爱好项目列表，组件内部状态
  @State hobbyItems: HobbyItem[] = [];
  // 性别选择索引，关联全局存储
  @StorageLink('select') select: number = 0;
  // 是否已编辑标记，关联全局存储
  @StorageLink('isEdit') isEdit: boolean = false;
  // 自定义弹窗显示状态，组件内部状态
  @State customPopup: boolean = false
  // 是否已保存标记，组件内部状态
  @State isSaved: boolean = false;
  // 消费导航栈，用于页面跳转
  @Consume('NavPathStack') pathStack: NavPathStack;
  // 性别数组资源
  private sexArray: Resource = $r('app.strarray.sex_array');
  // 当前日期字符串
  private currentDate: string = '';
  // UI上下文
  private ctx: UIContext = this.getUIContext();
  // 弹窗内容节点，用于爱好选择弹窗
  private contentNode: ComponentContent<Object> =
    new ComponentContent(this.ctx, wrapBuilder(buildHobbyItems),
      new Params(this.hobbyItems));

  // 保存弹窗构建器，定义弹窗的内容
  @Builder
  PopupBuilder() {
    Row({ space: 2 }) {
      // 保存按钮文本
      Text($r('app.string.save'))
        .fontSize(16)                   // 字体大小16
        .opacity(0.9)                   // 透明度0.9
    }
    .onClick(() => {
      this.isSaved = true;              // 设置已保存标记
      this.customPopup = false;         // 关闭弹窗
      AppStorage.setOrCreate('isEdit', false);  // 重置编辑状态
      // 显示保存成功提示
      this.ctx.getPromptAction().showToast({
        message: $r('app.string.save_successfully'),
        duration: 2000
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
    .width(200)                         // 弹窗宽度200
    .height(50)                         // 弹窗高度50
    .padding(16)                        // 内边距16
  }

  // 组件即将出现时的生命周期函数
  aboutToAppear() {
    // 设置弹窗操作类的上下文
    PromptActionClass.setContext(this.ctx);

    // 设置弹窗对齐方式为居中
    PromptActionClass.setOptions({ alignment: DialogAlignment.Center });
    // 获取当前日期
    let date = new Date();
    let year = date.getFullYear();   // 获取年份
    let month = date.getMonth() + 1;  // 获取月份（需要+1）
    let day = date.getDate();         // 获取日期
    // 构建当前日期字符串
    this.currentDate = year + '-' + month + '-' + day;
    // 设置默认选择时间
    this.selectTime = new Date(`${this.currentDate}T08:30:00`);
    // 如果没有出生日期，则设置为当前日期
    if (!this.birthDate) {
      this.birthDate = CommonUtils.getBirthDateValue(year, month, day);
    }
    // 获取上下文对象
    let context = this.getUIContext().getHostContext() as Context;
    // 检查上下文和资源管理器是否为空
    if ((CommonUtils.isEmpty(context)) || (CommonUtils.isEmpty(context.resourceManager))) {
      hilog.info(0xFF00, 'PersonalInformation', '%{public}s', 'context or resourceManager is null');
      return;
    }
  }

  // 导航标题构建器，构建页面右上角的按钮
  @Builder
  NavDestinationTitle() {
    Column() {
      // 点阵图标按钮容器
      Row() {
        // 点阵图标图片
        Image($r('app.media.dot_grid'))
          .width(24)                    // 图标宽度24
          .height(24)                   // 图标高度24
      }
      .width(40)                        // 按钮容器宽度40
      .height(40)                       // 按钮容器高度40
      .borderRadius(36)                 // 圆角半径36，接近圆形
      .backgroundColor('#E9E9E9')       // 背景色浅灰色
      .justifyContent(FlexAlign.Center) // 内容居中对齐
      .onClick(() => {
        // 点击切换弹窗显示状态
        this.customPopup = !this.customPopup
      })
      .bindPopup(this.customPopup, {    // 绑定弹窗
        builder: this.PopupBuilder,     // 弹窗内容构建器
        placement: Placement.Bottom,    // 弹窗显示在按钮下方
        onStateChange: (e) => {
          // 弹窗状态改变时的回调
          if (!e.isVisible) {
            this.customPopup = false;   // 弹窗不可见时，关闭弹窗
          }
        }
      })
    }
    .alignItems(HorizontalAlign.End)    // 内容右对齐
    .padding({ top: 8, right: 16 })     // 设置上内边距8，右内边距16
    .width('calc(100% - 56vp)')         // 宽度为100%减去56vp
  }

  // 构建个人信息页面UI
  build() {
    // 导航目标页面组件
    NavDestination() {
      // 主要内容列
      Column() {
        // 页面头部：头像和标题
        Column({ space: 12 }) {
          // 用户头像
          Image($r('app.media.ic_avatar'))
            .width(56)                      // 头像宽度56
            .height(56)                     // 头像高度56
            .alignSelf(ItemAlign.Center)    // 头像居中对齐
          // 页面标题
          Text($r('app.string.personalInformation'))
            .fontSize(17)                   // 标题字体大小17
            .opacity(0.9)                   // 标题透明度0.9
        }
        .width('100%')                      // 头部容器宽度100%
        .alignItems(HorizontalAlign.Center) // 头部内容水平居中

        // 昵称输入区域
        Column() {
          // 昵称输入组件
          TextInputComponent({
            inputImage: $r('app.media.person'), // 人物图标
            text: this.nikeName,                // 当前昵称文本
            hintText: $r('app.string.nickname') // 提示文本
          })
        }
        .margin({ top: 12 })                    // 上边距12

        // 出生日期选择区域
        Column() {
          // 出生日期显示组件
          TextCommonComponent({
            textImage: $r('app.media.calendar'),    // 日历图标
            title: $r('app.string.date_of_birth'),  // 标题：出生日期
            content: this.birthDate,                // 当前出生日期
            onItemClick: () => {
              // 点击时显示日期选择对话框
              this.getUIContext().showDatePickerDialog({
                start: new Date('1925-1-1'),       // 最早日期
                end: new Date('2055-1-1'),          // 最晚日期
                selected: this.selectTime,          // 当前选中日期
                lunarSwitch: true,                  // 显示农历切换
                showTime: false,                    // 不显示时间
                onDateAccept: (value: Date) => {
                  // 日期选择确认回调
                  this.selectTime = value;          // 更新选中时间
                  // 解析日期字符串，提取年月日
                  let birthDateArray = JSON.stringify(value).slice(1, 11).split('-');
                  let year = Number(birthDateArray[0]);
                  let month = Number(birthDateArray[1]);
                  let day = Number(birthDateArray[2]);
                  // 格式化出生日期并更新
                  this.birthDate = CommonUtils.getBirthDateValue(year, month, day);
                  // 设置编辑标记
                  AppStorage.setOrCreate('isEdit', true);
                }
              })
            }
          })
        }

        // 性别选择区域
        Column() {
          // 性别显示组件
          TextCommonComponent({
            textImage: $r('app.media.person_2'),   // 人物图标
            title: $r('app.string.sex'),           // 标题：性别
            content: this.sex,                     // 当前性别
            onItemClick: () => {
              // 点击时显示文本选择对话框
              this.getUIContext().showTextPickerDialog({
                range: this.sexArray,              // 性别选项数组
                selected: this.select,             // 当前选中索引
                canLoop: false,                    // 不允许循环滚动
                onAccept: (value: TextPickerResult) => {
                  // 选择确认回调
                  this.select = value.index as number;   // 更新选中索引
                  this.sex = value.value as string;      // 更新性别值
                  AppStorage.setOrCreate('isEdit', true); // 设置编辑标记
                },
                onChange: (value: TextPickerResult) => {
                  // 选择变化回调
                  this.select = value.index as number;   // 更新选中索引
                }
              })
            }
          })
        }

        // 个性签名输入区域
        Column() {
          // 个性签名输入组件
          TextInputComponent({
            inputImage: $r('app.media.doc_plaintext_and_pencil'), // 文档和笔图标
            text: this.signature,                                 // 当前签名文本
            hintText: $r('app.string.personal_signature')        // 提示文本
          })
        }

        // 爱好选择区域
        Column() {
          // 爱好显示组件
          TextCommonComponent({
            textImage: $r('app.media.heart'),                   // 爱心图标
            title: $r('app.string.Hobbies_multiple_choices'),   // 标题：爱好（多选）
            content: this.hobbies,                              // 当前爱好内容
            onItemClick: () => {
              // 点击时显示爱好选择弹窗
              this.hobbyItems = [];                            // 清空爱好项目列表
              // 获取上下文对象
              let context = this.getUIContext().getHostContext() as Context;
              // 检查上下文和资源管理器是否有效
              if ((CommonUtils.isEmpty(context)) || (CommonUtils.isEmpty(context.resourceManager))) {
                return;
              }
              let manager = context.resourceManager;
              // 获取爱好数据数组
              manager.getStringArrayValue($r('app.strarray.hobbies_data').id, (error, hobbyArray) => {
                if (!CommonUtils.isEmpty(error)) {
                  // 错误处理，记录日志
                  hilog.info(0xFF00, 'PersonalInformation', '%{public}s', 'error = ' + JSON.stringify(error));
                } else {
                  // 成功获取数据，构建爱好项目列表
                  hobbyArray.forEach((hobbyItem: string) => {
                    let tmpHobbyItem = new HobbyItem();
                    tmpHobbyItem.label = hobbyItem;             // 设置爱好标签
                    tmpHobbyItem.isChecked = false;             // 默认未选中
                    this.hobbyItems.push(tmpHobbyItem);         // 添加到列表
                  });
                  // 创建弹窗内容节点
                  this.contentNode =
                    new ComponentContent(this.ctx, wrapBuilder(buildHobbyItems), new Params(this.hobbyItems));
                  // 设置弹窗内容并打开弹窗
                  PromptActionClass.setContentNode(this.contentNode);
                  PromptActionClass.openDialog();
                  // 设置编辑标记
                  AppStorage.setOrCreate('isEdit', true);
                }
              });
            }
          })
        }
      }
      .padding(16)                          // 设置主内容区域的内边距16
    }
    .onBackPressed(() => {
      // 返回按钮处理逻辑
      let inputIsEdit: boolean | undefined = AppStorage.get('inputIsEdit');  // 获取输入编辑状态
      // 如果没有保存且有编辑内容，则显示确认对话框
      if (!this.isSaved && (this.isEdit || inputIsEdit)) {
        this.getUIContext().showAlertDialog({
          message: $r('app.string.tips'),       // 提示信息
          autoCancel: true,                     // 允许自动取消
          alignment: DialogAlignment.Center,    // 居中对齐
          offset: { dx: 0, dy: -20 },           // 偏移量
          gridCount: 4,                         // 网格数量
          buttons: [
            {
              value: $r('app.string.cancel'),   // 取消按钮
              action: () => {
                // 取消按钮回调，记录日志
                hilog.info(0xFF00, 'PersonalInformation', '%{public}s', 'Callback when the first button is clicked');
              }
            },
            {
              value: $r('app.string.confirm'),  // 确认按钮
              action: () => {
                // 确认放弃编辑，清空所有数据
                this.nikeName = '';             // 清空昵称
                this.sex = $r('app.string.male'); // 重置性别为男性
                this.birthDate = '';            // 清空出生日期
                this.signature = '';            // 清空个性签名
                this.hobbies = '';              // 清空爱好
                AppStorage.setOrCreate('isEdit', false);      // 重置编辑标记
                AppStorage.setOrCreate('inputIsEdit', false); // 重置输入编辑标记
                this.pathStack.pop();           // 返回上一页
              }
            }
          ]
        })
        return true;  // 阻止默认返回行为
      }
      return false;   // 允许默认返回行为
    })
    .title(this.NavDestinationTitle())      // 设置导航标题
    .backgroundColor('#F1F3F5')             // 设置背景色为浅灰色
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])  // 扩展安全区域
  }
}