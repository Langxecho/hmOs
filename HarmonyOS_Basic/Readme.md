
---

## 4. 如何把代码跑起来（Windows 版）
1. 安装 DevEco Studio 4.1.3（官网下载一路 next）。
2. 打开 Settings → SDK → 勾选 HarmonyOS 12 API。
3. 克隆本仓库  
   `git clone https://github.com/your-id/HarmonyFirst.git`
4. 用 DevEco 打开根目录，等待 Gradle 同步（第一次 3-5 min）。
5. 右上角 Device Manager → 新建 Phone 模拟器 → 启动。
6. 点击 ▶️ Run，看到“Hello Harmony”即成功！

---

## 5. 踩坑 TOP3（持续更新）
| 现象 | 原因 | 解决 |
|---|---|---|
| 模拟器黑屏 | 没开启 CPU 虚拟化 | 进 BIOS 打开 Intel VT-x/AMD-V |
| 安装失败 “code:9568322” | 包名与已装应用冲突 | 改 `entry\src\main\module.json5` 中 `bundleName` |
| ArkTS 不识别 `@Entry` | 文件没在 `pages` 目录 | 右键 `Mark Directory as → Pages Root` |

完整踩坑表 → [docs/bug.md](./docs/bug.md)

---

## 6. 每日 50 字小结（示例）
**Day1**  
今天装环境花了 2h，黑屏是因为 VT-x 没开。Hello World 跑通那一刻，感觉比 Android 清爽，ArkTS 语法像 React + Swift 混血，继续冲！

---

## 7. 下一步计划
- [ ] 把 List 页面做成下拉刷新
- [ ] 接入 @ohos.data.preferences 做本地缓存
- [ ] 打包真机（学长荣耀 90）
- [ ] 写一份“给 Android 同学的 Harmony 对照表”

---

## 8. 参考链接
1. 官方文档：https://developer.harmonyos.com/cn/docs/documentation
2. 中文社区：https://harmonyos.51cto.com
3. 入门视频：B 站@黑马程序员 HarmonyOS 4.0 快速入门（2025 版）

---

## 9. 如何贡献
欢迎同校同学提 PR：
- 发现错别字 → 直接改
- 有更好注释 → 发分支 `patch-xxx`
- 想一起打卡 → 加微信 `your-wechat-id`

---

## 10. License
MIT © 2025 HarmonyFirst