# TAP4 AI Web UI

📖 This README is also available in [中文版本](./README.zh-CN.md)

A modern, full-featured web interface built with Next.js 14 and Supabase, designed for intelligent navigation and tool discovery. This project supports multilingual content, dynamic data loading, and seamless deployment to Vercel.

## 🌐 Project Overview

**TAP4 AI Web UI** is an AI tool navigation portal that provides categorized listings, search functionality, and community-submitted resources. It is built with performance, scalability, and developer experience in mind.

## 🧩 Features

- 🌍 **Multilingual Support** using `next-intl`
- 🔍 **Intelligent Search** and filterable categories
- 🧭 **Navigation & Curation** by collection time or type
- 📥 **Tool Submission System** for open contribution
- ♻️ **Static + Incremental Regeneration** with SSR fallback
- ☁️ **Cloud-native** deployment via Vercel

## 🏗️ Project Structure

```
├── app/                        # App router structure for Next.js 14
│   └── [locale]/              # Internationalized routes
│       └── ...                # Home, explore, submit, etc.
├── components/                # UI components
├── db/
│   └── supabase/              # Supabase client setup
├── lib/                       # Utility constants and helpers
├── public/                    # Static assets
├── styles/                    # Tailwind and global styles
├── test-scripts/             # CLI testing scripts for Supabase
├── .env.local                # Local environment config
├── vercel.json               # Vercel deployment settings
```

## 🔧 Technology Stack

| Layer        | Technology                    |
|--------------|-------------------------------|
| Framework    | Next.js 14 (App Router)       |
| Styling      | Tailwind CSS                  |
| Backend API  | Supabase (PostgreSQL + REST)  |
| Auth         | Supabase Auth (optional)      |
| Data Fetch   | Supabase JS SDK v2.x          |
| Language     | TypeScript                    |
| Dev Tools    | ESLint, PNPM, Cursor Editor   |
| Deployment   | Vercel                        |

## 🔄 Data Flow

1. Supabase client (`@supabase/supabase-js`) is initialized using `.env.local`
2. Data is fetched from tables like `navigation_category` and `web_navigation`
3. Server Components or API Routes render the results
4. Dynamic pages or ISR pages display data to user

## 📦 Getting Started

### 1. Install dependencies
```bash
pnpm install
```

### 2. Set up your `.env.local`
```bash
NEXT_PUBLIC_SITE_URL=https://yourdomain.com
NEXT_PUBLIC_SUPABASE_URL=https://xyzcompany.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-supabase-key
```

### 3. Run the development server
```bash
pnpm dev
```

### 4. Build for production
```bash
pnpm build && pnpm start
```

## ☁️ Deployment (Vercel)
- Environment variables must be configured in Vercel dashboard
- The `vercel.json` defines CRON tasks for scheduled data updates

## 🔐 License

[MIT](LICENSE)

---

For questions or feature requests, please open an issue or contact the maintainer.

