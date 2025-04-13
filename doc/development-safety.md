# 🛡️ 开发安全守则（Development Safety Guide）

本文件是为 tap4-ai-webui 项目开发者编写的最小安全守则。适用于初次开发或多人协作时的稳定编程节奏。

---

## ✅ 1. 控制节奏 —— 每次只改一块

- 不要同时修改多个组件或文件
- 不要功能和样式混着改
- 示例：本次只改 `<WebNavCard>` 样式 → 就只动它

---

## ✅ 2. 每次改完就立即验证

| 检查项         | 命令 / 操作             | 说明                             |
|----------------|--------------------------|----------------------------------|
| 页面可用       | 浏览器查看               | 页面能否正常打开、跳转是否成功 |
| 控制台干净     | Chrome Console            | 无红色报错、无异常堆栈          |
| 类型无误       | `pnpm tsc`               | TypeScript 类型检查是否通过     |
| Lint 合规范     | `pnpm lint`              | 有无 ESLint 报错或 warning       |
| UI 是否抖动     | 手动点击交互区域         | 检查样式断裂、DOM错乱、重绘问题 |

---

## ✅ 3. 文件命名语义清晰

- `page.tsx`、`WebNavCard.tsx`、`categoryService.ts` → 可一眼识别
- 禁止出现 `MyComponent2.tsx`、`test.ts`、`test123.tsx`

---

## ✅ 4. 改完就 commit，一步一存档

```bash
git add .
git commit -m "fix: 修复导航卡片 hover 卡顿问题"
```
- 每次改动即提交，可作为“回滚锚点”
- 遇问题可随时用 git reset --hard 回退


git branch backup/xxx
涓存椂淇濆瓨鍒嗘敮鐗堟湰
git stash
鏆傚瓨鏈彁浜ゆ洿鏀�
git diff
鏌ョ湅姣忔鏀瑰姩鍐呭
open -a "Cursor"
蹇€熷畾浣嶆枃浠跺苟姣斿
ESLint / TypeScript
浣滀负璇硶闃茬伀澧�
