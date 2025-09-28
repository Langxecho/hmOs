# 实现自定义下拉刷新动画功能

### 简介

本篇Codelab主要介绍组件动画animation属性设置。当组件的某些通用属性变化时，可以通过属性动画实现渐变效果，提升用户体验。

<img src='screenshots/device/1.webp' width=320>

### 相关概念

- 属性动画：组件的某些通用属性变化时，可以通过属性动画实现渐变效果，提升用户体验。支持的属性包括width、height、backgroundColor、opacity、scale、rotate、translate等。案例中自定义头部组件的属性动画设置主要涉及duration(动画时长)、tempo(动画速率)、delay(动画延时)、curve(动画曲线)、palyMode(动画模式)和iterations（动画播放次数）。

### 使用说明

1. 首次进入应用默认刷新加载一次数据。
2. 手指拉拽应用中部可刷新区域，刷新头部跟随手指拖拽显示/隐藏，动画未启动。
3. 松开手指停止拖拽，如果头部刷新组件未超出可刷新距离，自动回弹隐藏，或者头部刷新组件超出可刷新距离，动画启动，回弹至头部刷新组件完全显示距离，6s后刷新头部组件回弹隐藏。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机。暂不支持预览器，请使用真机或模拟器验证。
2. HarmonyOS系统：HarmonyOS 5.0.5 Release及以上。
3. DevEco Studio版本：DevEco Studio 5.0.5 Release及以上。
4. HarmonyOS SDK版本：HarmonyOS 5.0.5 Release SDK及以上。
