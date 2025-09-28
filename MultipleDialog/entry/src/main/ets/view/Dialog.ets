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

// 导入业务错误类型
import { BusinessError } from '@kit.BasicServicesKit';
// 导入UI相关类型
import { ComponentContent, promptAction, UIContext } from '@kit.ArkUI';
// 导入日志工具
import { hilog } from '@kit.PerformanceAnalysisKit';

// 弹窗操作类，封装了自定义弹窗的各种操作
class PromptActionClass {
  private ctx: UIContext | undefined = undefined;                              // UI上下文对象
  private contentNode: ComponentContent<Object> | undefined = undefined;       // 弹窗内容节点
  private options: promptAction.BaseDialogOptions | undefined = undefined;     // 弹窗选项配置

  // 设置UI上下文
  setContext(context: UIContext) {
    this.ctx = context;
  }

  // 设置弹窗内容节点
  setContentNode(node: ComponentContent<Object>) {
    this.contentNode = node;
  }

  // 设置弹窗选项配置
  setOptions(options: promptAction.BaseDialogOptions) {
    this.options = options;
  }

  // 打开自定义弹窗
  openDialog() {
    if (this.contentNode !== null) {
      // 调用系统弹窗API打开自定义弹窗
      this.ctx?.getPromptAction().openCustomDialog(this.contentNode, this.options)
        .then(() => {
          // 打开成功，记录日志
          hilog.info(0xFF00, 'PersonalInformation', '%{public}s', 'OpenCustomDialog complete');
        })
        .catch((error: BusinessError) => {
          // 打开失败，记录错误日志
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
      // 调用系统弹窗API关闭自定义弹窗
      this.ctx?.getPromptAction().closeCustomDialog(this.contentNode)
        .then(() => {
          // 关闭成功，记录日志
          hilog.info(0xFF00, 'PersonalInformation', '%{public}s', 'CloseCustomDialog complete');
        })
        .catch((error: BusinessError) => {
          // 关闭失败，记录错误日志
          let message = (error as BusinessError).message;
          let code = (error as BusinessError).code;
          hilog.error(0xFF00, 'PersonalInformation', '%{public}s',
            `CloseCustomDialog args error code is ${code}, message is ${message}`);
        })
    }
  }

  // 更新自定义弹窗
  updateDialog(options: Object) {
    if (this.contentNode !== null) {
      // 调用系统弹窗API更新自定义弹窗
      this.ctx?.getPromptAction().updateCustomDialog(this.contentNode, options)
        .then(() => {
          // 更新成功，记录日志
          hilog.info(0xFF00, 'PersonalInformation', '%{public}s', 'UpdateCustomDialog complete');
        })
        .catch((error: BusinessError) => {
          // 更新失败，记录错误日志
          let message = (error as BusinessError).message;
          let code = (error as BusinessError).code;
          hilog.error(0xFF00, 'PersonalInformation', '%{public}s',
            `UpdateCustomDialog args error code is ${code}, message is ${message}`);
        })
    }
  }
}

// 导出PromptActionClass的单例对象
export default new PromptActionClass();