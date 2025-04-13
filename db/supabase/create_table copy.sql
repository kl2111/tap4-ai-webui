-- ==========================================
-- Recommended Schema Definition
-- Features: Multi-language, Normalized Tags & Categories (M2M)
-- ==========================================

-- 1. 用户提交入口表 (基本不变)
CREATE TABLE IF NOT EXISTS public.submit (
  id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  name TEXT,
  url TEXT,
  email TEXT,
  is_feature INTEGER DEFAULT 0, -- 0: 未推荐, 1: 已推荐
  status INTEGER DEFAULT 0, -- 0: 未处理, 1: 已处理/已写入，2：已拒绝
  is_process INTEGER DEFAULT 1 -- 0：处理；1：不处理
);
COMMENT ON TABLE public.submit IS '用户提交新导航内容的入口表';
COMMENT ON COLUMN public.submit.status IS '提交状态 (例如: 0=待处理, 1=已采纳, 2=已拒绝)';


-- 2. 语言表 (新增)
CREATE TABLE IF NOT EXISTS public.languages (
  id SERIAL PRIMARY KEY, -- 使用 SERIAL 或 BIGINT IDENTITY 均可
  code TEXT NOT NULL UNIQUE, -- 语言代码 (e.g., 'en', 'zh-cn', 'zh-Hant')
  name TEXT NOT NULL, -- 语言显示名称 (e.g., 'English', '简体中文', '繁体中文')
  is_active BOOLEAN NOT NULL DEFAULT true, -- 是否启用该语言
  sort_order INTEGER NOT NULL DEFAULT 0 -- 显示排序
);
COMMENT ON TABLE public.languages IS '支持的语言列表及其属性';
COMMENT ON COLUMN public.languages.code IS '符合标准的语言代码 (如 ISO 639-1)';
COMMENT ON COLUMN public.languages.name IS '该语言的人类可读名称';
COMMENT ON COLUMN public.languages.is_active IS '标记该语言是否在系统中激活/可用';


-- 3. 分类基础信息表 (修改原始表)
CREATE TABLE IF NOT EXISTS public.navigation_category (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL UNIQUE, -- 分类的唯一英文/拼音标识符
  logo_url TEXT, -- LOGO 图片地址
  sort INTEGER DEFAULT 0,
  del_flag INTEGER NOT NULL DEFAULT 0, -- 逻辑删除标志
  create_time TIMESTAMPTZ NOT NULL DEFAULT now()
  -- 移除原始的单语言 creat_by 字段
);
COMMENT ON TABLE public.navigation_category IS '导航分类的基础信息 (语言无关)';
COMMENT ON COLUMN public.navigation_category.name IS '分类的内部唯一标识符 (通常英文或拼音)';


-- 4. 分类翻译表 (新增)
CREATE TABLE IF NOT EXISTS public.category_translation (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  category_id BIGINT NOT NULL REFERENCES public.navigation_category(id) ON DELETE CASCADE,
  language_id INTEGER NOT NULL REFERENCES public.languages(id) ON DELETE CASCADE,
  title TEXT, -- 该语言下的分类标题
  description TEXT, -- 该语言下的分类描述，每种语言一种翻译
  UNIQUE (category_id, language_id) -- 确保每个分类每种语言只有一条翻译
);
COMMENT ON TABLE public.category_translation IS '存储导航分类的多语言翻译 (标题、描述)';


-- 5. 标签基础信息表 (新增)
CREATE TABLE IF NOT EXISTS public.navigation_tag (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL UNIQUE, -- 标签的唯一英文/拼音标识符
  logo_url TEXT, -- 标签图标地址
  sort INTEGER DEFAULT 0
);
COMMENT ON TABLE public.tag IS '标签的基础信息 (语言无关)';
COMMENT ON COLUMN public.tag.name IS '标签的内部唯一标识符 (通常英文或拼音)';


-- 6. 标签翻译表 (新增)
CREATE TABLE IF NOT EXISTS public.tag_translation (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  tag_id BIGINT NOT NULL REFERENCES public.tag(id) ON DELETE CASCADE,
  language_id INTEGER NOT NULL REFERENCES public.languages(id) ON DELETE CASCADE,
  name TEXT, -- 该语言下的标签名称
  description TEXT, -- 该语言下的标签描述
  UNIQUE (tag_id, language_id) -- 确保每个标签每种语言只有一条翻译
);
COMMENT ON TABLE public.tag_translation IS '存储标签的多语言翻译 (名称、描述)';


-- 7. 主导航数据表 (修改原始表)
CREATE TABLE IF NOT EXISTS public.web_navigation (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL UNIQUE, -- 导航项的唯一英文/拼音标识符
  url TEXT,
  image_url TEXT,
  thumbnail_url TEXT,
  website_data TEXT, -- 其他元数据或抓取信息
  collection_time TIMESTAMPTZ, -- 抓取/收录时间
  star_rating INTEGER DEFAULT 0, -- 评级
  logo_url TEXT, -- 导航项自身的 Logo (可能与 website_data 重复，按需保留)
  founded_year INTEGER, -- 成立年份
  lang_default TEXT DEFAULT 'en' REFERENCES public.languages(code), -- 默认语言代码 (可选, 或通过 language_id)
  -- 移除原始的 title, content, detail 字段
  -- 移除原始的 category_name, tag_name 字段
  -- 移除原始的 category_id 字段 (因为改为多对多)
  create_time TIMESTAMPTZ NOT NULL DEFAULT now() -- 新增创建时间记录
);
COMMENT ON TABLE public.web_navigation IS '导航网站/工具的基础信息 (语言无关)';
COMMENT ON COLUMN public.web_navigation.name IS '导航项的内部唯一标识符 (通常英文或拼音)';
COMMENT ON COLUMN public.web_navigation.lang_default IS '指定此导航项的主要或默认语言代码';


-- 8. 导航翻译表 (新增)
CREATE TABLE IF NOT EXISTS public.web_navigation_translation (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  navigation_id BIGINT NOT NULL REFERENCES public.web_navigation(id) ON DELETE CASCADE,
  language_id INTEGER NOT NULL REFERENCES public.languages(id) ON DELETE CASCADE,
  title TEXT, -- 该语言下的导航标题
  content TEXT, -- 该语言下的导航简介/内容
  detail TEXT, -- 该语言下的导航详情
  UNIQUE (navigation_id, language_id) -- 确保每个导航项每种语言只有一条翻译
);
COMMENT ON TABLE public.web_navigation_translation IS '存储导航项的多语言翻译 (标题、内容、详情)';


-- 9. 导航与分类关联表 (新增 - 实现多对多)
CREATE TABLE IF NOT EXISTS public.web_navigation_category (
  navigation_id BIGINT NOT NULL REFERENCES public.web_navigation(id) ON DELETE CASCADE,
  category_id BIGINT NOT NULL REFERENCES public.navigation_category(id) ON DELETE CASCADE,
  PRIMARY KEY (navigation_id, category_id) -- 联合主键
);
COMMENT ON TABLE public.web_navigation_category IS '连接导航项和分类的多对多关系表';


-- 10. 导航与标签关联表 (新增 - 实现多对多)
CREATE TABLE IF NOT EXISTS public.web_navigation_tag (
  navigation_id BIGINT NOT NULL REFERENCES public.web_navigation(id) ON DELETE CASCADE,
  tag_id BIGINT NOT NULL REFERENCES public.tag(id) ON DELETE CASCADE,
  PRIMARY KEY (navigation_id, tag_id) -- 联合主键
);
COMMENT ON TABLE public.web_navigation_tag IS '连接导航项和标签的多对多关系表';


-- ========== (可选) 附加：翻译完整性检查 ==========
-- 注意：通过数据库触发器强制所有激活语言的翻译都存在，逻辑可能比较复杂。
-- 通常在应用层或通过后台任务来保证翻译的完整性会更灵活。
-- 以下仅为示例概念，实际实现需谨慎测试。

/*
CREATE OR REPLACE FUNCTION check_all_translations_exist()
RETURNS TRIGGER AS $$
DECLARE
  v_navigation_id BIGINT;
  v_required_lang_count INT;
  v_actual_lang_count INT;
BEGIN
  -- 触发器可能在 INSERT 或 DELETE 时触发，需要判断操作类型
  -- 确定关联的 navigation_id
  IF TG_OP = 'DELETE' THEN
     v_navigation_id := OLD.navigation_id;
  ELSE
     v_navigation_id := NEW.navigation_id;
  END IF;

  -- 获取系统激活的语言数量
  SELECT count(*) INTO v_required_lang_count FROM public.languages WHERE is_active = true;

  -- 获取当前 navigation_id 实际拥有的翻译数量
  -- 注意：这里的查询可能需要考虑事务的可见性，可能需要使用更复杂的逻辑或延迟约束
  SELECT count(DISTINCT language_id) INTO v_actual_lang_count
  FROM public.web_navigation_translation
  WHERE navigation_id = v_navigation_id;

  -- 这是一个简化的检查，实际触发器逻辑会更复杂
  -- IF TG_OP = 'INSERT' AND v_actual_lang_count < v_required_lang_count THEN
     -- 可能还没插完所有语言，不能直接报错
  -- ELSIF TG_OP = 'DELETE' AND v_actual_lang_count - 1 < v_required_lang_count THEN
     -- 删除后可能导致不完整
     -- RAISE EXCEPTION 'Cannot delete translation, all active languages must be present for navigation_id %', v_navigation_id;
  -- END IF;

  -- 由于触发器执行时机的复杂性，通常不建议在这里强制完整性
  -- 返回操作的行
  IF TG_OP = 'DELETE' THEN
     RETURN OLD;
  ELSE
     RETURN NEW;
  END IF;
END;
$$ LANGUAGE plpgsql;

-- 绑定触发器 (示例，逻辑需完善)
-- CREATE TRIGGER trg_check_translation_completeness
-- AFTER INSERT OR DELETE ON public.web_navigation_translation -- 或使用 AFTER UPDATE
-- FOR EACH ROW -- 或 FOR EACH STATEMENT
-- EXECUTE FUNCTION check_all_translations_exist();

*/
