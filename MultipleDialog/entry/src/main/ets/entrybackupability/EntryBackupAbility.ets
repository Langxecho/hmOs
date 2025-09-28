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
// 导入备份扩展能力和包版本相关类
import { BackupExtensionAbility, BundleVersion } from '@kit.CoreFileKit';

// 应用备份能力类，继承自BackupExtensionAbility
export default class EntryBackupAbility extends BackupExtensionAbility {
  // 在备份操作时调用的异步方法
  async onBackup() {
    // 记录备份操作成功日志
    hilog.info(0x0000, 'testTag', 'onBackup ok');
  }

  // 在恢复操作时调用的异步方法
  async onRestore(bundleVersion: BundleVersion) {
    // 记录恢复操作成功日志，包含包版本信息
    hilog.info(0x0000, 'testTag', 'onRestore ok %{public}s', JSON.stringify(bundleVersion));
  }
}