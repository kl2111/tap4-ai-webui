import path from 'path';
import createNextIntlPlugin from 'next-intl/plugin';

const withNextIntl = createNextIntlPlugin();

/** @type {import('next').NextConfig} */
const nextConfig = {
  env: {
    NEXT_BASE_API: process.env.NEXT_BASE_API,
  },
  logging: {
    fetches: {
      fullUrl: process.env.NODE_ENV === 'development',
    },
  },
  compiler: {
    removeConsole: process.env.NODE_ENV === 'production',
  },
  images: {
    unoptimized: true,
    remotePatterns: [
      {
        protocol: 'https',
        hostname: 'img.artiversehub.ai',
        port: '',
        pathname: '/**',
      },
    ],
  },
  productionBrowserSourceMaps: false,

  // ✅ 关键补充：让 Vercel 构建时识别 `@/` 路径别名
  webpack(config) {
    config.resolve.alias['@'] = path.resolve(__dirname);
    return config;
  },
};

export default withNextIntl(nextConfig);
