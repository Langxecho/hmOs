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

// 导入能力相关类型和常量
import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
// 导入日志工具
import { hilog } from '@kit.PerformanceAnalysisKit';
// 导入窗口管理相关类
import { window } from '@kit.ArkUI';

// 应用主能力类，继承UIAbility
export default class EntryAbility extends UIAbility {
  // 能力创建时的生命周期方法
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    // 记录能力创建日志
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  // 能力销毁时的生命周期方法
  onDestroy(): void {
    // 记录能力销毁日志
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  // 窗口舞台创建时的生命周期方法
  onWindowStageCreate(windowStage: window.WindowStage): void {
    // 主窗口已创建，为该能力设置主页面
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    // 加载页面内容，指向Index页面
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        // 加载页面失败，记录错误日志
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      // 获取UI上下文并存储到全局存储中
      let uiContext:  UIContext | undefined = windowStage.getMainWindowSync().getUIContext();
      AppStorage.setOrCreate('uiContext', uiContext);
      // 记录加载成功日志
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });
  }

  // 窗口舞台销毁时的生命周期方法
  onWindowStageDestroy(): void {
    // 主窗口已销毁，释放UI相关资源
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  // 能力切换到前台时的生命周期方法
  onForeground(): void {
    // 能力已切换到前台
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  // 能力切换到后台时的生命周期方法
  onBackground(): void {
    // 能力已切换到后台
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
