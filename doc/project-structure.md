# 📁 项目结构说明（tap4-ai-webui）

本项目基于 Next.js App Router 架构，集成 Supabase 数据层、国际化、ShadCN UI，遵循模块化、分层、语义化最佳实践。

---

## 🔹 一级目录总览

\`\`\`
tap4-ai-webui/
├── app/              # 页面与路由逻辑（App Router）
├── components/       # 全局 UI 与页面组件
├── db/               # 数据类型与初始化脚本
├── doc/              # 内部开发文档
├── lib/              # 工具函数、hooks、业务逻辑封装
├── messages/         # 多语言翻译 JSON 文件
├── middlewares/      # 中间件逻辑（国际化、权限等）
├── public/           # 静态资源目录（favicon、images）
├── scripts/          # 数据同步、初始化等 CLI 脚本
├── supabase/         # Supabase CLI 配置与迁移结构
├── tests/            # 单元测试结构（预留）
├── .vscode/          # 团队共享 VSCode 设置（可选）
├── next.config.mjs   # Next.js 配置入口
├── tailwind.config.ts # TailwindCSS 样式配置
└── tsconfig.json     # TypeScript 配置
\`\`\`

---

## 🔹 二级结构说明（精选）

### \`app/\`
用于定义所有页面和路由逻辑，支持多语言路径嵌套。

\`\`\`
app/
├── [locale]/           # 语言前缀 (en, cn, tw)
│   └── (with-footer)/  # 默认布局结构
│       ├── home/       # 首页
│       ├── category/   # 分类页
│       ├── ai/         # 单项详情页
│       └── submit/     # 用户提交页面
\`\`\`

---

### \`lib/\`
封装所有通用逻辑函数、hooks、配置、类型定义。

\`\`\`
lib/
├── api/                # Supabase API 封装（数据读取、写入）
├── config/             # 站点配置、i18n 配置等
├── constants/          # 常量集中定义（语言码、分页等）
├── hooks/              # 通用 React Hooks
├── types/              # 全局 TS 类型定义
├── utils/              # 通用工具函数
\`\`\`

---

### \`db/\`
管理数据库类型、查询逻辑、初始化数据脚本。

\`\`\`
db/
├── types/              # Supabase 类型
├── queries/            # SQL 封装调用
├── seed/               # 本地初始数据
\`\`\`

---

### \`scripts/\`
CLI 工具集合，用于：

- 多语言同步
- 数据结构生成
- 初始化流程

---

### \`tests/\`
测试目录（预留），建议引入：

- [ ] Jest / Vitest
- [ ] Playwright E2E

---

## 📌 约定原则

- 页面结构在 \`app/\`，组件抽离在 \`components/\`
- 数据封装集中在 \`lib/api/\`
- 配置集中在 \`lib/config/\`
- 静态资源归档至 \`public/\`
- 文档归档至 \`doc/\`

