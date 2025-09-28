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

// 爱好项目数据类（复用定义）
class HobbyItem {
  label?: string;      // 爱好标签
  isChecked?: boolean; // 是否选中
}

// 从全局存储中获取UI上下文
const uiContext: UIContext | undefined = AppStorage.get('uiContext');
// 获取主机上下文
const context = uiContext?.getHostContext();

// 通用工具类，提供常用的工具方法
export class CommonUtils {
  // 获取格式化的出生日期字符串
  getBirthDateValue(year: number, month: number, day: number): string {
    // 从资源管理器获取年月日的本地化字符串
    let resourceYear = context?.resourceManager.getStringSync($r('app.string.year'));   // 获取“年”字
    let resourceMonth = context?.resourceManager.getStringSync($r('app.string.month')); // 获取“月”字
    let resourceDay = context?.resourceManager.getStringSync($r('app.string.day'));     // 获取“日”字
    // 拼接出生日期字符串，格式为：xxxx年xx月xx日
    let birthdate: string = `${year}${resourceYear}${month}` + `${resourceMonth}${day}${resourceDay}`;
    return birthdate;
  }

  // 判断对象或字符串是否为空
  isEmpty(obj: object | string): boolean {
    // 检查对象是否为undefined、null或空字符串
    return obj === undefined || obj === null || obj === '';
  }

  // 判断爱好项目数组是否为空
  isEmptyArr(array: Array<HobbyItem>): boolean {
    // 检查数组长度是否为0
    return array.length === 0;
  }
}

// 导出CommonUtils的单例对象
export default new CommonUtils();