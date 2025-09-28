/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { display, window } from '@kit.ArkUI';
import { UIAbility, Want } from '@kit.AbilityKit';
import { GlobalContext } from '../common/utils/GlobalContext';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN = 0x0000;
const TAG = 'EntryAbility';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want) {
    GlobalContext.getContext().setObject('abilityWant', want);
  }

  async onWindowStageCreate(windowStage: window.WindowStage) {
    try {
      GlobalContext.getContext().setObject('display', display.getDefaultDisplaySync());
    } catch (err) {
      hilog.error(DOMAIN, TAG, `getDefaultDisplay failed. code=${err.code}, message=${err.message}`);
    }
    windowStage.loadContent('pages/TabIndex', (err: BusinessError, data) => {
      if (err.code) {
        return;
      }
      try {
        AppStorage.setOrCreate('uiContext', windowStage.getMainWindowSync().getUIContext());
      } catch (error) {
        hilog.error(DOMAIN, TAG, `getMainWindow failed. code=${error.code}, message=${error.message}`);
      }
    });
  }
};
