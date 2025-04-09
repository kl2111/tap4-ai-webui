# TAP4 AI 前端界面

📖 本文档另有 [English version](./README.md)

一个由 Next.js 14 和 Supabase 驱动的现代化 Web 界面，专为智能导航和工具发现而构建。项目支持多语言内容、动态数据加载，并可无缝部署至 Vercel。

## 🌐 项目简介

**TAP4 AI Web UI** 是一个 AI 工具导航入口，提供按类别浏览、关键词搜索、社区共建等功能模块。注重性能、可扩展性和开发体验。

## 🧩 功能模块

- 🌍 多语言支持（基于 `next-intl`）
- 🔍 智能搜索 + 分类筛选
- 🧭 工具导航展示（按收录时间排序）
- 📥 提交工具功能（社区贡献）
- ♻️ 静态预渲染 + 增量更新支持
- ☁️ 一键部署至 Vercel 云平台

## 🏗️ 项目结构

```
tap4-ai-webui/
├── app/                        # Next.js 14 的 App Router 架构
│   └── [locale]/              # 动态国际化路由（如 /zh /en）
│       └── ...                # 首页、探索页、提交页等
├── components/                # 可复用 UI 组件
├── db/
│   └── supabase/              # Supabase 客户端配置
├── lib/                       # 公共方法与常量
├── public/                    # 静态资源（图标、Logo）
├── styles/                    # 样式定义（Tailwind）
├── test-scripts/             # 开发调试脚本（如 Supabase 联调）
├── .env.local                # 本地环境变量配置
├── vercel.json               # Vercel 部署配置（含定时任务）
```

## 🔧 技术架构

| 层级         | 技术栈                     |
|--------------|----------------------------|
| 前端框架     | Next.js 14（App Router）   |
| 样式系统     | Tailwind CSS               |
| 数据服务     | Supabase (PostgreSQL + REST API) |
| 鉴权机制     | Supabase Auth（可选）       |
| 数据调用     | Supabase JS SDK v2.x       |
| 编程语言     | TypeScript                 |
| 开发工具     | ESLint, PNPM, Cursor       |
| 部署平台     | Vercel                     |

## 🔄 数据流说明

1. 客户端通过 `.env.local` 中配置初始化 Supabase 客户端
2. 页面组件使用 Supabase 查询 `navigation_category` 和 `web_navigation` 表
3. 服务端渲染（Server Component）完成数据加载
4. 渲染动态页面并进行增量静态化

## 📦 本地开发指南

### 1. 安装依赖
```bash
pnpm install
```

### 2. 设置本地环境变量 `.env.local`
```bash
NEXT_PUBLIC_SITE_URL=https://yourdomain.com
NEXT_PUBLIC_SUPABASE_URL=https://xyzcompany.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=你的 Supabase 匿名密钥
```

### 3. 启动开发服务器
```bash
pnpm dev
```

### 4. 构建并运行生产版本
```bash
pnpm build && pnpm start
```

## ☁️ 云端部署（Vercel）
- 请在 Vercel 后台设置 `.env` 中的环境变量
- `vercel.json` 可配置定时任务（例如每日抓取更新）

## 🔐 授权协议

[MIT 开源协议](LICENSE)

---

如有问题、建议或功能请求，欢迎通过 GitHub issue 与作者联系。

