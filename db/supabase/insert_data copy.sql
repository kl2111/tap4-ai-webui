-- ==========================================
-- Seed Data Insertion Script (Updated)
-- Target Schema Version: v0.1.1
-- Generation Time: 2025-04-10
--
-- !! IMPORTANT !!
-- This script assumes sequential auto-generated IDs (1, 2, 3...)
-- for navigation_category, tag, and web_navigation tables.
-- This assumption is only valid on empty tables with fresh sequences.
-- ==========================================

-- Start Transaction (Optional but Recommended)
-- BEGIN;

-- 1. Insert into public.submit (Same as before)
INSERT INTO public.submit (name, url, email, is_feature, status) VALUES
('Awesome New AI Tool', 'https://example-ai-tool.com', 'submitter@email.com', 0, 0);

-- 2. Insert into public.navigation_category (Same as before)
INSERT INTO public.navigation_category (name, title_en, title_zh_cn, title_zh_tw, desc_en, desc_zh_cn, desc_zh_tw, logo_url, sort, del_flag, create_by) VALUES
('mood-emotion-support', 'Mood & Emotion Support', '情绪支持与波动调节', '情緒支持與波動調節', 'Support for mood swings, sadness and emotional instability.', '支持情绪波动、情绪低落或不稳。', '支持情緒波動、情緒低落或不穩。', NULL, 1, 0, 0),
('sleep-rest', 'Sleep & Rest', '睡眠与休息', '睡眠與休息', 'Improve sleep hygiene and restfulness.', '改善睡眠质量、放松与恢复。', '改善睡眠質量、放鬆與恢復。', NULL, 2, 0, 0),
('self-discovery-identity', 'Self Discovery & Identity', '自我探索与身份认同', '自我探索與身份認同', 'Explore identity, values, and meaning.', '探索自我、价值观与人生意义。', '探索自我、價值觀與人生意義。', NULL, 3, 0, 0),
('relationship-growth', 'Relationship Growth', '关系成长与连结', '關係成長與連結', 'Enhance connection, intimacy, and communication.', '改善亲密关系、沟通与连接感。', '改善親密關係、溝通與連接感。', NULL, 4, 0, 0),
('focus-cognitive-boost', 'Focus & Cognitive Boost', '专注力与认知提升', '專注力與認知提升', 'Improve focus, clarity and mental performance.', '提升注意力、记忆力与大脑灵活性。', '提升注意力、記憶力與大腦靈活性。', NULL, 5, 0, 0),
('healthy-habits', 'Building Healthy Habits', '健康习惯养成', '健康習慣養成', 'Develop sustainable wellness and behavioral change.', '养成可持续的健康行为与生活方式。', '養成可持續的健康行為與生活方式。', NULL, 6, 0, 0),
('grief-loss-support', 'Grief & Loss Support', '哀伤与失落支持', '哀傷與失落支持', 'Navigate grief, loss and transitions with care.', '支持失去亲人、变化适应与内心疗愈。', '支持失去親人、變化適應與內心療癒。', NULL, 7, 0, 0),
('motivation-energy', 'Motivation & Energy', '动能与内在动力', '動能與內在動力', 'Cultivate motivation, drive and personal power.', '重燃动力、恢复内驱力与活力。', '重燃動力、恢復內驅力與活力。', NULL, 8, 0, 0),
('life-transitions', 'Life Transitions', '人生阶段过渡', '人生階段過渡', 'Navigate life stages and transformation gracefully.', '支持人生转型、自我转化与适应。', '支持人生轉型、自我轉化與適應。', NULL, 9, 0, 0),
('parenting-caregiving', 'Parenting & Caregiving', '养育与照护支持', '養育與照護支持', 'Support for parenting, caregiving and family stress.', '应对育儿、照护压力与家庭情境。', '應對育兒、照護壓力與家庭情境。', NULL, 10, 0, 0),
('body-food-balance', 'Body & Food Balance', '身体与饮食平衡', '身體與飲食平衡', 'Promote healthy body image and eating habits.', '建立身体接纳、饮食觉察与身心平衡。', '建立身體接納、飲食覺察與身心平衡。', NULL, 11, 0, 0),
('positive-mental-fitness', 'Positive Mental Fitness', '正向心理能量', '正向心理能量', 'Cultivate emotional agility and mental strength.', '增强心理弹性、自我觉察与成长韧性。', '增強心理彈性、自我覺察與成長韌性。', NULL, 12, 0, 0),
('identity-belief-growth', 'Identity & Belief Growth', '身份与信念成长', '身份與信念成長', 'Work on self-concept, belief systems, and transformation.', '关注信念系统、身份认同与转变。', '關注信念系統、身份認同與轉變。', NULL, 13, 0, 0),
('explore-more', 'Explore More', '探索更多', '探索更多', 'Browse additional themes, AI tools and pathways.', '浏览更多主题、工具与成长方向。', '瀏覽更多主題、工具與成長方向。', NULL, 14, 0, 0);

-- 3. Insert into public.tag (Same as before)
INSERT INTO public.tag (name, name_en, name_zh_cn, name_zh_tw, desc_en, desc_zh_cn, desc_zh_tw, logo_url, sort) VALUES
('ai-tool', 'AI Tool', 'AI 工具', 'AI 工具', 'Tools powered by Artificial Intelligence.', '由人工智能驱动的工具。', '由人工智能驅動的工具。', '/icons/ai.svg', 1),
('productivity', 'Productivity', '生产力', '生產力', 'Tools to enhance productivity and efficiency.', '提升生产力和效率的工具。', '提升生產力和效率的工具。', '/icons/productivity.svg', 2),
('wellness', 'Wellness', '身心健康', '身心健康', 'Resources for mental and physical well-being.', '关于身心健康的资源。', '關於身心健康的資源。', '/icons/wellness.svg', 3),
('free', 'Free', '免费', '免費', 'Available at no cost.', '无需付费即可使用。', '無需付費即可使用。', NULL, 10);

-- 4. Insert into public.web_navigation (Updated with new data)
-- Note: category_id is mapped from category_name (image, design-art, chatbot, video, business, voice -> 14; productivity -> 5)
-- Note: logo_url, founded_year are set to NULL as they were not in source data. website_data also mostly NULL in source.
INSERT INTO public.web_navigation (name, url, image_url, thumbnail_url, website_data, collection_time, star_rating, category_id, logo_url, founded_year, lang_default) VALUES
('123rf-com', 'https://www.123rf.com/', 'https://img.tap4.ai/tools/2024/6/12/123rf-com-1718212803.png', 'https://img.tap4.ai/tools/2024/6/12/123rf-com-thumbnail-1718212807.png', NULL, '2024-06-08 02:30:09', 0, 14, NULL, NULL, 'en'), -- category: image -> 14
('adobe-com', 'https://adobe.com/', 'https://img.tap4.ai/tools/2024/6/13/adobe-com-1718248204.png', 'https://img.tap4.ai/tools/2024/6/13/adobe-com-thumbnail-1718248205.png', NULL, '2024-06-08 11:10:08', 0, 14, NULL, NULL, 'en'), -- category: design-art -> 14
('imglarger-com', 'https://shareasale.com/r.cfm?b=1434994&u=4306172&m=92386&urllink=&afftrack=&via=tap4-ai&rel=sponsored&utm_source=tap4-ai&utm_medium=referral', 'https://img.tap4.ai/tools/2024/6/14/imglarger-com-1718386242.png', 'https://img.tap4.ai/tools/2024/6/14/imglarger-com-thumbnail-1718386244.png', NULL, '2024-06-09 03:40:07', 0, 14, NULL, NULL, 'en'), -- category: image -> 14
('aigirl-best', 'https://aigirl.best', 'https://img.tap4.ai/tools/2024/6/12/aigirl-best-1718203804.png', 'https://img.tap4.ai/tools/2024/6/12/aigirl-best-thumbnail-1718203808.png', NULL, '2024-06-09 13:00:09', 0, 14, NULL, NULL, 'en'), -- category: chatbot -> 14
('beta-character-ai', 'https://beta.character.ai/', 'https://img.tap4.ai/tools/2024/6/12/beta-character-ai-1718211603.png', 'https://img.tap4.ai/tools/2024/6/12/beta-character-ai-thumbnail-1718211607.png', NULL, '2024-06-09 22:30:13', 0, 14, NULL, NULL, 'en'), -- category: chatbot -> 14
('capcut-com', 'https://capcut.com/', 'https://img.tap4.ai/tools/2024/6/14/capcut-com-1718396471.png', 'https://img.tap4.ai/tools/2024/6/14/capcut-com-thumbnail-1718396473.png', NULL, '2024-06-10 04:21:22', 0, 14, NULL, NULL, 'en'), -- category: video -> 14
('artiversehub-ai', 'https://artiversehub.ai', 'https://img.tap4.ai/tools/2024/6/12/artiversehub-ai-1718202605.png', 'https://img.tap4.ai/tools/2024/6/12/artiversehub-ai-thumbnail-1718202608.png', NULL, '2024-06-10 12:54:07', 0, 14, NULL, NULL, 'en'), -- category: image -> 14
('deepl-com', 'https://deepl.com/', 'https://img.tap4.ai/tools/2024/6/13/deepl-com-1718248810.png', 'https://img.tap4.ai/tools/2024/6/13/deepl-com-thumbnail-1718248811.png', NULL, '2024-06-11 11:20:48', 0, 14, NULL, NULL, 'en'), -- category: business -> 14
('force-com', 'https://force.com/', 'https://img.tap4.ai/tools/2024/6/14/force-com-1718395626.png', 'https://img.tap4.ai/tools/2024/6/14/force-com-thumbnail-1718395628.png', NULL, '2024-06-11 15:07:11', 0, 14, NULL, NULL, 'en'), -- category: business -> 14
('gamma-app', 'https://gamma.app/', 'https://img.tap4.ai/tools/2024/6/17/gamma-app-1718635825.png', 'https://img.tap4.ai/tools/2024/6/17/gamma-app-thumbnail-1718635828.png', NULL, '2024-06-10 20:50:43', 0, 5, NULL, NULL, 'en'), -- category: productivity -> 5
('animegirl-studio', 'https://animegirl.studio', 'https://img.tap4.ai/tools/2024/6/12/animegirl-studio-1718202003.png', 'https://img.tap4.ai/tools/2024/6/12/animegirl-studio-thumbnail-1718202007.png', NULL, '2024-06-11 01:00:07', 0, 14, NULL, NULL, 'en'), -- category: chatbot -> 14
('sunoai-ai', 'https://sunoai.ai/', 'https://img.tap4.ai/tools/2024/6/16/sunoai-ai-1718570705.png', 'https://img.tap4.ai/tools/2024/6/16/sunoai-ai-thumbnail-1718570707.png', NULL, '2024-06-11 07:45:11', 0, 14, NULL, NULL, 'en'), -- category: voice -> 14
('gemini-google-com', 'https://gemini.google.com/', 'https://img.tap4.ai/tools/2024/6/11/gemini-google-com-1718092802.png', 'https://img.tap4.ai/tools/2024/6/11/gemini-google-com-thumbnail-1718092804.png', NULL, '2024-06-11 10:00:07', 0, 14, NULL, NULL, 'en'), -- category: image -> 14
('igsummit-com', 'https://igsummit-com', 'https://img.tap4.ai/tools/2024/6/14/igsummit-com-1718395626.png', 'https://img.tap4.ai/tools/2024/6/14/igsummit-com-thumbnail-1718395628.png', NULL, '2024-06-11 15:07:11', 0, 14, NULL, NULL, 'en'); -- category: business? -> 14 (Guessing based on Manychat)


-- 5. Insert into public.web_navigation_tag (No tags provided for new data, so this section is empty)
-- If tags were provided, INSERT statements linking web_navigation IDs (1-13) to tag IDs would go here.


-- 6. Insert into public.web_navigation_translation (Updated with new data)
-- Assuming Web Navigation IDs 1-13 correspond to the INSERT order above.
INSERT INTO public.web_navigation_translation (navigation_id, lang, title, content, detail) VALUES
-- 123rf-com (ID 1)
(1, 'en', 'Stock Photos, Vectors and Royalty Free Images from 123RF', 'Search and download from millions of HD stock photos, royalty free images, cliparts, vectors and illustrations', E'### What is 123RF?\n\n123RF is a platform that provides access to a vast array of stock photos, vectors, and royalty-free images for various needs.\n\n### How can I use 123RF for free?\n\nEvery user can utilize 123RF''s free images and vectors up to a certain limit. Subscribing to the platform grants additional benefits and extended access beyond the free usage limits.\n\n### Can I generate images using 123RF?\n\nYes, with 123RF''s AI Image Generator, users can create images, sharing credits with other AI tools for a seamless creative experience.\n\n### How many AI tools are available on 123RF?\n\n123RF offers a wide range of AI tools, including AI Image Upscaler, AI Generative Fill, AI Background Blur, AI Background Remix, AI Image Extender, AI Writer, and AI Background Remover, for various applications in work, study, and everyday life.\n\n### How can I maximize my use of 123RF''s AI services?\n\nBy leveraging the daily free uses of AI Image Generator, AI Image Upscaler, and other AI tools, users can explore a vast range of AI-powered tools to support various tasks.\n\n### Will my information be used for training data?\n\nWe highly value user privacy, and your data will not be used for any training purposes. If needed, you can delete your account at any time, and all your data will be removed as well.\n\n### When would I need a 123RF subscription?\n\nIf the free usage limits do not meet your needs and you heavily rely on 123RF''s AI tools, we invite you to subscribe to our affordable products.'),
(1, 'zh-cn', '[标题 CN] 123rf-com', '[内容 CN] Stock Photos, Vectors and Royalty Free Images from 123RF', '[详情 CN]'),
(1, 'zh-tw', '[標題 TW] 123rf-com', '[內容 TW] Stock Photos, Vectors and Royalty Free Images from 123RF', '[詳情 TW]'),
-- adobe-com (ID 2)
(2, 'en', 'Adobe: Creative, marketing and document management solutions', 'Adobe is changing the world through digital experiences. We help our customers create, deliver and optimize content and applications.', E'### What is Adobe Creative Cloud?\n\nAdobe Creative Cloud is an AI-driven platform that provides access to a vast array of creative tools and generative AI technologies for various needs, including Photoshop, Adobe Express, and document management solutions.\n\n### How can I use Adobe Creative Cloud for free?\n\nEvery user can utilize Adobe Creative Cloud for free with a trial period. Subscribing to the platform grants additional benefits and extended access beyond the free trial limits.\n\n### Can I generate images using Adobe Creative Cloud?\n\nYes, with Adobe Firefly generative AI capabilities, users can create gorgeous photos, rich graphics, and incredible art using Photoshop and Adobe Express.\n\n### How many apps are available on Adobe Creative Cloud?\n\nAdobe Creative Cloud offers over 20 apps and generative AI tools in the All Apps plan, including Photoshop, Adobe Express, and more.\n\n### How can I maximize my use of Adobe Creative Cloud AI services?\n\nBy leveraging the free trial period and exploring the various AI-powered tools, users can unlock their creative potential and achieve amazing results.\n\n### Will my information be used for training data?\n\nAdobe highly values user privacy, and your data will not be used for any training purposes. If needed, you can delete your account at any time, and all your data will be removed as well.\n\n### When would I need an Adobe Creative Cloud subscription?\n\nIf the free trial period does not meet your needs and you heavily rely on Adobe Creative Cloud AI-powered tools, we invite you to subscribe to our affordable plans.'),
(2, 'zh-cn', '[标题 CN] adobe-com', '[内容 CN] Adobe: Creative, marketing and document management solutions', '[详情 CN]'),
(2, 'zh-tw', '[標題 TW] adobe-com', '[內容 TW] Adobe: Creative, marketing and document management solutions', '[詳情 TW]'),
-- imglarger-com (ID 3)
(3, 'en', 'AI Image Enlarger | Enlarge Image Without Losing Quality!', 'AI Image Enlarger is a FREE online image enlarger that could upscale and enhance small images automatically. Make jpg/png pictures big without losing quality.', E'\n### What is AI Image Enlarger?\nAI Image Enlarger is an AI-powered platform that offers a wide range of AI technologies for enhancing images, including enlarging, upscaling, and improving image quality.\n\n### How can I use AI Image Enlarger?\nEvery user can access AI Image Enlarger for free up to 10 credits per month. Subscribing to the platform provides additional benefits and extended access beyond the free usage limits.\n\n### Can I enlarge images using AI Image Enlarger?\nYes, users can enlarge images up to 2k, 4k, and 8k without losing quality using AI Image Enlarger image enlargement feature.\n\n### How many features are available on AI Image Enlarger?\nAI Image Enlarger offers nearly 10 AI-powered tools for image enhancement, such as AI Image Upscaler, AI Anime Upscaler, AI Image Enhancer, AI Image Sharpener, AI Face Retouch, AI Background Remover, AI Cartoonizer, AI Photo Colorizer, and Object Remover.\n\n### How can I maximize my use of AI Image Enlarger services?\nBy making use of the daily free tools provided by AI Image Enlarger, users can explore a wide range of AI-powered features to assist with various tasks.\n\n### Will my information be used for training data?\nUser privacy is highly respected, and your data will not be utilized for training purposes. You have the option to delete your account at any time, which will also remove all your data.\n\n### When would I need a subscription to AI Image Enlarger?\nIf the 10 free credits per month are insufficient for your needs and you heavily rely on AI Image Enlarger services, we recommend subscribing to our cost-effective products.'),
(3, 'zh-cn', '[标题 CN] imglarger-com', '[内容 CN] AI Image Enlarger | Enlarge Image Without Losing Quality!', '[详情 CN]'),
(3, 'zh-tw', '[標題 TW] imglarger-com', '[內容 TW] AI Image Enlarger | Enlarge Image Without Losing Quality!', '[詳情 TW]'),
-- aigirl-best (ID 4)
(4, 'en', 'Best AI Girlfriend Online Free 2024 | Best AI Girlfriend', 'The best AI girlfriend and AI girl generator online. Get inspired by free AI generated girls, Best AI Girlfriend is a free AI Girl Generator that allows anyone to create their own AI Girlfriend.', E'### What is Best AI Girlfriend?\n\nBest AI Girlfriend is building an AI Girl Generator that helps you generate your unique AI Girl or AI Girlfriend. It combines artificial intelligence technology to provide personalized girlfriend pattern generation and style for you.\n\n### How to Create a AI Girlfriend?\n\nTo create a AI Girlfriend, you can follow these steps:\n\n1. Enter the AI Characters page in Best AI Girlfriend Website.\n2. Select the ai girl character that you like.\n3. Click chat to create your AI Girlfriend role and chat with her.\n\n### Features of Best AI Girlfriend\n\nBest AI Girlfriend offers various features, including:\n\n* AI Girlfriend: There are more than 100 AI Girlfriend characters with different styles.\n* AI Girl Generator: Input the description that you like or dream of, then click "Generate" to get your own girl design here.\n\n### Pricing Plans\n\nBest AI Girlfriend offers various pricing plans, including:\n\n* Yearly Plan: $8.33/month (billed yearly), with unlimited AI girlfriend chat, generated images, and models.\n* Monthly Plan: $12.99/month, with unlimited AI girlfriend chat, generated images, and models.\n* One-time Basic Plan: $9.9 for 4000 tokens, with chat about 1000 times, generate about 266 images, and unlimited models.\n\n### Frequently Asked Questions\n\n#### What style of ai girl design does Best AI Girlfriend support?\n\nBest AI Girlfriend supports various girl friend styles, including realistic teacher girl, realistic design girl, realistic hentai girl, anime student girl, anime nurse girl, and more.\n\n#### How can I create a personalized ai girl design using the generator in Best AI Girlfriend?\n\nTo create a personalized girl design using the Best AI Girlfriend Generator, you can input specific descriptions or preferences related to the girl style, theme, or elements you desire. The AI will then generate a customized girl design based on your input.\n\n#### What are the usage rights for the AI Girlfriend designs generated by the Best AI Girlfriend?\n\nUsers are typically free to use the AI Girlfriend designs generated by the AI Girlfriend Generator on Best AI Girlfriend for personal enjoyment, sharing on social media, or even for commercial purposes, as long as they adhere to the platform Terms of Use.'),
(4, 'zh-cn', '[标题 CN] aigirl-best', '[内容 CN] Best AI Girlfriend Online Free 2024 | Best AI Girlfriend', '[详情 CN]'),
(4, 'zh-tw', '[標題 TW] aigirl-best', '[內容 TW] Best AI Girlfriend Online Free 2024 | Best AI Girlfriend', '[詳情 TW]'),
-- beta-character-ai (ID 5)
(5, 'en', 'character.ai | Personalized AI for every moment of your day', 'Meet AIs that feel alive. Chat with anyone, anywhere, anytime. Experience the power of super-intelligent chat bots that hear you, understand you, and remember you.', E'### What is Character.ai?\n\nCharacter.ai is a platform that provides access to a vast array of AI-driven characters for various needs, including language learning, creative writing, trip planning, and more.\n\n### How can I use Character.ai?\n\nEvery user can utilize Character.ai''s AI characters for free, with some limitations. Subscribing to the platform grants additional benefits and extended access beyond the free usage limits.\n\n### Features of Character.ai\n\nCharacter.ai offers a wide range of AI characters, including:\n\n* Language Liaison for language learning and cultural exchange\n* Trip Planner for planning trips and adventures\n* Creative Helper for creative writing and storytelling\n* Brainstormer for generating ideas and exploring possibilities\n* Text Adventure Game for immersive gaming experiences\n* Librarian Linda for book recommendations and literary discussions\n* Decision Helper for making informed decisions\n* And many more!\n\n### Pricing of Character.ai\n\nCharacter.ai offers a free plan with limited access to its AI characters. For extended access and additional benefits, users can subscribe to the platform''s affordable products.\n\n### Privacy and Security of Character.ai\n\nCharacter.ai highly values user privacy, and user data will not be used for any training purposes. If needed, users can delete their account at any time, and all their data will be removed as well.'),
(5, 'zh-cn', '[标题 CN] beta-character-ai', '[内容 CN] character.ai | Personalized AI for every moment of your day', '[详情 CN]'),
(5, 'zh-tw', '[標題 TW] beta-character-ai', '[內容 TW] character.ai | Personalized AI for every moment of your day', '[詳情 TW]'),
-- capcut-com (ID 6)
(6, 'en', 'CapCut | All-in-one video editor & graphic design tool driven by AI', 'CapCut is an all-in-one creative platform powered by AI that enables video editing and image design on browsers, Windows, Mac, Android, and iOS.', E'### What is CapCut?\n\nCapCut is an all-in-one video editor and graphic design tool driven by AI. It''s a complete package that includes graphic design, team collaboration, and much more.\n\n### How can I use CapCut for free?\n\nEvery user can utilize CapCut for free, with no credit card required. You can sign up for free and start creating stunning videos and images.\n\n### Features of CapCut\n\n#### AI Magic Tools\n\n* Text to video\n* Product URL to ads\n* Bulk image resizer\n* Video upscaler\n* Portrait generator\n* Auto video generator\n* Text to image generator\n\n#### Online Creative Suite\n\n* Video editor for desktop\n* Video editor for mobile\n* Online video editor\n* Text to speech\n* Voice changer\n* Video to text\n* Screen recorder\n* Video effects & filters\n* Keyframe animation\n* Speech-to-text converter\n\n#### Learn More\n\n* Creativity\n* Education\n* Lifestyle\n* Partners\n* Business Tips\n* Social Media Tips\n* Tips & Tutorials\n* Business Solutions'),
(6, 'zh-cn', '[标题 CN] capcut-com', '[内容 CN] CapCut | All-in-one video editor & graphic design tool driven by AI', '[详情 CN]'),
(6, 'zh-tw', '[標題 TW] capcut-com', '[內容 TW] CapCut | All-in-one video editor & graphic design tool driven by AI', '[詳情 TW]'),
-- artiversehub-ai (ID 7)
(7, 'en', 'ArtiverseHub - AI Art Generator', 'Get creative with ArtiverseHub online ai art generator. Support multi-platform including DALLE(ChatGPT), Leonardo.ai, Stability.ai, and some more.', E'### What is ArtiverseHub?\n\nArtiverseHub is an AI-driven platform that provides access to a vast array of AI technologies for various artistic needs, including MidJourney, DALL-E 3, Leonardo, and more.\n\n### How can I use ArtiverseHub for free?\n\nEvery user can utilize ArtiverseHub AI art generator for free, with access to a wide range of AI models and styles. Subscribing to the platform grants additional benefits and extended access beyond the free usage limits.\n\n### Can I generate images using ArtiverseHub?\n\nYes, with ArtiverseHub''s multi-AI art generator, users can create images in various styles, including anime, animal, character, art, car, and more, using different AI models like MidJourney, DALL-E 3, Leonardo, and Stable Diffusion.\n\n### How many AI models are available on ArtiverseHub?\n\nArtiverseHub offers a vast array of AI models for a wide variety of artistic applications, including anime, animal, character, art, car, and more. You can freely use these AI models without the need for a subscription.\n\n### How can I maximize my use of ArtiverseHub''s AI services?\n\nBy leveraging the free uses of ArtiverseHub''s AI art generator, users can explore a vast range of AI-powered tools to support various artistic tasks.\n\n### Will my information be used for your training data?\n\nWe highly value user privacy, and your data will not be used for any training purposes. If needed, you can delete your account at any time, and all your data will be removed as well.\n\n### When would I need an ArtiverseHub subscription?\n\nIf the free uses of ArtiverseHub''s AI art generator do not meet your needs and you heavily rely on the platform, we invite you to subscribe to our affordable products.'),
(7, 'zh-cn', '[标题 CN] artiversehub-ai', '[内容 CN] ArtiverseHub - AI Art Generator', '[详情 CN]'),
(7, 'zh-tw', '[標題 TW] artiversehub-ai', '[內容 TW] ArtiverseHub - AI Art Generator', '[詳情 TW]'),
-- deepl-com (ID 8)
(8, 'en', 'DeepL Translate: The world most accurate translator', 'Translate texts & full document files instantly. Accurate translations for individuals and Teams. Millions translate with DeepL every day.', E'### What is DeepL?\n\nDeepL is a highly accurate translator that outperforms Google, Microsoft, and Facebook in machine learning translation. It provides quick and accurate translations, surpassing its competitors in many cases.\n\n### How does DeepL work?\n\nDeepL translation tool is as quick as its competitors, but more accurate and nuanced. It recognizes languages quickly and automatically, converting words into the desired language while adding linguistic nuances and expressions.\n\n### Features of DeepL\nDeepL offers various features, including:\n\n#### Translation modes\nDeepL provides translation modes for text, files, and speech.\n\n#### Document translation\nDeepL can translate PDF, Word (.docx), and PowerPoint (.pptx) files.\n\n#### Write\nDeepL Write is an AI-powered editing tool that fixes grammar and punctuation mistakes, rephrases sentences, and finds the perfect tone of voice.\n\n#### Pro features\nDeepL Pro offers additional features, including unlimited text translation, document translation, and editing capabilities.\n\n#### Pricing\nDeepL offers a free version with limited features and a Pro version with additional features and support.\n\n#### Integrations\nDeepL integrates with various platforms, including Google Workspace, Microsoft 365, and Microsoft Word.'),
(8, 'zh-cn', '[标题 CN] deepl-com', '[内容 CN] DeepL Translate: The world most accurate translator', '[详情 CN]'),
(8, 'zh-tw', '[標題 TW] deepl-com', '[內容 TW] DeepL Translate: The world most accurate translator', '[詳情 TW]'),
-- force-com (ID 9)
(9, 'en', 'Salesforce Asia: The Customer Company - Salesforce - Asia', 'Personalise every experience along the customer journey with the Customer 360. Unify marketing, sales, service, commerce, and IT on the world #1 CRM.', E'### What is Salesforce Asia?\n\n#### How can I use Salesforce Asia for free?\nEvery user can utilize Salesforce Asia for free up to a certain limit. Subscribing to the platform grants additional benefits and extended access beyond the free usage limits.\n\n#### Features of Salesforce Asia\n##### Small Business\nSell smarter and provide support faster in a single app.\n\n##### Sales Cloud\nClose more deals and speed up growth with the #1 CRM.\n\n##### Service Cloud\nMake customers happy faster and build loyalty with Service Cloud.\n\n##### Marketing Cloud\nBuild customer relationships for life with data-first digital marketing.\n\n#### How can I maximize my use of Salesforce Asia''s services?\nBy leveraging the daily free uses of Salesforce Asia''s services, users can explore a vast range of tools to support various tasks.\n\n#### Will my information be used for training data?\nWe highly value user privacy, and your data will not be used for any training purposes. If needed, you can delete your account at any time, and all your data will be removed as well.\n\n#### When would I need a Salesforce Asia subscription?\nIf the free usage limits do not meet your needs and you heavily rely on Salesforce Asia, we invite you to subscribe to our affordable products.'),
(9, 'zh-cn', '[标题 CN] force-com', '[内容 CN] Salesforce Asia: The Customer Company - Salesforce - Asia', '[详情 CN]'),
(9, 'zh-tw', '[標題 TW] force-com', '[內容 TW] Salesforce Asia: The Customer Company - Salesforce - Asia', '[詳情 TW]'),
-- gamma-app (ID 10)
(10, 'en', 'Gamma', 'Made with Gamma. A new medium for presenting ideas, powered by AI.', E'### What is Gamma?\n\nGamma is a new medium for presenting ideas, powered by AI. It allows users to create beautiful presentations, documents, and websites without requiring design or coding skills.\n\n### How can I use Gamma?\nGamma enables users to create unlimited presentations, websites, and more in seconds. It provides advanced AI-powered tools to quickly create and refine content. With Gamma, users can access best-in-class AI for text, images, and search, and apply eye-catching, expert-level designs and layouts.\n\n### Features of Gamma\n\n* Create polished slides effortlessly\n* Access advanced AI for text, images, and search\n* Apply expert-level designs and layouts\n* Quickly rewrite or autocomplete content\n* Build and share dynamic content effortlessly\n* Engage with interactive galleries, videos, and embeds\n* Visualize data with stunning charts, diagrams, and tables\n* Jumpstart projects with versatile pre-made templates\n* Restyle existing content with a click\n* Import documents and presentations easily\n* Paste text from any source in seconds\n* Export unlimited PDF and PPT files instantly\n* Share and publish content effortlessly\n* Engage users on any device\n* Track engagement with built-in, advanced analytics\n* Password protect sensitive files\n* Connect and collaborate in real-time\n\n### Pricing of Gamma\n\nGamma offers a free trial, and users can sign up for free to explore its features. The pricing details are not explicitly mentioned, but users can try Gamma for free and explore its features before subscribing to its products.'),
(10, 'zh-cn', '[标题 CN] gamma-app', '[内容 CN] Gamma', '[详情 CN]'),
(10, 'zh-tw', '[標題 TW] gamma-app', '[內容 TW] Gamma', '[詳情 TW]'),
-- animegirl-studio (ID 11)
(11, 'en', 'Anime Girl Studio - Chat With Your AI Anime Girlfriend & Create Your Anime Girl', 'Your ai anime girl friend awaits! Create your AI Girlfriend, chat with her, and bring her to life in one click. The AI Anime Girl Generator with 100% AI-powered.', E'### What is Anime Girl Studio?\n\nAnime Girl Studio is a platform that offers an AI-driven chat companion and anime girl generator, allowing users to engage with their ideal anime girl fantasies.\n\n### How to Create Your AI Anime Girl Art?\n\nCreating an anime girl image is as easy as:\n\n1. Opening Anime Girl Generate in Anime Girl Studio.\n2. Inputting the description of your anime girl (be as wild or as specific as you like).\n3. Hitting "GENERATE" to generate your anime girl.\n\n### Features of Anime Girl Studio\n\n* Anime Girlfriend: Engage in conversations with your AI anime girlfriend.\n* AI Anime Girl Generator: Input the description that you like or dream, then click "generate" to get your own anime girl creation.\n\n### Pricing\n\n* ### Yearly: $8.33/month (billed yearly, save 67%) - Unlimited text messages, unlimited generated images, unlimited models, choose image for non-public, remove image blur, NSFW free.\n* ### Monthly: $12.99/month (save 48%) - Unlimited text messages, unlimited generated images, unlimited models, choose image for non-public, remove image blur, NSFW free.\n* ### One-time: $9.9 (4000 tokens) - Text messages about 500 times, generate about 266 images, unlimited models, choose image for non-public, remove image blur, NSFW free.\n\n### Frequently Asked Questions\n\n#### What style of anime girl art in Anime Girl Studio?\n\nThere are several styles supported in Anime Girl Studio, including anime disney girl, anime poster girl, anime angel girl, anime armed girl, anime monster girl, anime shining girl, anime babe girl, anime tattoo girl, anime coloring girl, anime school girl, anime furring girl, anime cat girl, and more.\n\n#### Can I ask for pictures?\n\nYes, your AI chatbot girlfriend can send you uncensored selfies and other flirtatious pictures.\n\n#### Troubleshooting\n\nIf your images aren''t appearing, try a different browser, clear your cache. If issues persist, contact us at contact@animegirl.studio.\n\n#### AI Model Insights\n\nOur AI learns from a vast database of anime styles to create unique and creative images based on your prompts.\n\n#### What''s the Usage Rights?\n\nYou''re free to use the images generated for personal enjoyment, sharing, or even commercial purposes, as long as you adhere to our Terms of Use.\n\n#### Supporting Anime Girl Studio\n\nLove what we''re doing? Consider upgrading to a paid plan, providing feedback, or purchasing merchandise featuring your favorite anime girl creations. Your support helps us improve and grow.'),
(11, 'zh-cn', '[标题 CN] animegirl-studio', '[内容 CN] Anime Girl Studio - Chat With Your AI Anime Girlfriend & Create Your Anime Girl', '[详情 CN]'),
(11, 'zh-tw', '[標題 TW] animegirl-studio', '[內容 TW] Anime Girl Studio - Chat With Your AI Anime Girlfriend & Create Your Anime Girl', '[詳情 TW]'),
-- sunoai-ai (ID 12)
(12, 'en', 'Free Suno AI Music Generator by SunoAI.ai', 'Explore SunoAI.ai for the revolutionary Suno AI Music Generator V3.5. Create unique Suno AI MP3 Music instantly, free to use.', E'\n### What is Suno AI?\nSuno AI is an advanced AI platform specializing in music generation and text-to-music conversion. We provide Suno AI free music generation services to help users quickly create high-quality music tracks.\n\n### How to use Suno AI\n#### What are the main features of Suno AI?\nSuno AI offers music generation features. Our AI technology can assist you in generating unique music tracks from text descriptions using the Suno AI music generator.\n\n#### How to generate music using Suno AI?\nGenerating music with Suno AI is very simple. Just enter a text description on our website, and our AI system will automatically generate the corresponding music for you using Suno AI text to music technology.\n\n### Features of Suno AI\n#### Is Suno AI music generation service free?\nSuno AI provides a limited number of free music generation services. You can visit our website anytime to start creating your music tracks with Suno AI free services.\n\n#### What types of music can Suno AI generate?\nSuno AI can generate various types of music, including pop, classical, electronic, and jazz. You can choose different music styles according to your needs with the help of the Suno AI music generator.\n\n#### How fast is the music generation speed of Suno AI?\nThe music generation speed of Suno AI is very fast. Typically, you can get the generated music tracks within a few minutes using Suno AI music technology.\n\n#### What is the quality of the music generated by Suno AI?\nSuno AI uses the most advanced AI technology to ensure high-quality music generation. Our system is extensively trained to produce professional-level music tracks with Suno AI music generator.\n\n#### What languages does Suno AI support for text input?\nSuno AI supports text input in multiple languages. No matter what language you use, our system can understand and generate the corresponding music using Suno AI text to music capabilities.\n\n#### How to download the music generated by Suno AI?\nAfter generating the music, you can directly download it from our website.\n\n### Pricing\nPlease check our pricing page for more information.'),
(12, 'zh-cn', '[标题 CN] sunoai-ai', '[内容 CN] Free Suno AI Music Generator by SunoAI.ai', '[详情 CN]'),
(12, 'zh-tw', '[標題 TW] sunoai-ai', '[內容 TW] Free Suno AI Music Generator by SunoAI.ai', '[詳情 TW]'),
-- gemini-google-com (ID 13)
(13, 'en', 'Gemini - chat to supercharge your ideas', 'Bard is now Gemini. Get help with writing, planning, learning, and more from Google AI.', E'### What is Gemini?\n\nGemini is an AI-driven platform that provides access to a vast array of AI technologies for various needs, including Google AI for writing, planning, learning, and more.\n\n### How can I use Google AI for free on Gemini?\n\nEvery user can utilize Google AI for free up to a certain limit on Gemini. Subscribing to the platform grants additional benefits and extended access beyond the free usage limits.\n\n### Can I generate content using Gemini?\n\nYes, with Google AI''s language generation capability, users can create content, including writing and planning, for a seamless creative experience.\n\n### How many AI tools are available on Gemini?\n\nGemini offers a wide range of AI-powered tools for various applications in work, study, and everyday life. You can freely use these tools without the need for a separate subscription.\n\n### How can I maximize my use of Gemini''s AI services?\n\nBy leveraging the daily free uses of Google AI''s writing, planning, and learning capabilities, users can explore a vast range of AI-powered tools to support various tasks.\n\n### Will my information be used for your training data?\n\nWe highly value user privacy, and your data will not be used for any training purposes. If needed, you can delete your account at any time, and all your data will be removed as well.\n\n### When would I need a Gemini subscription?\n\nIf the free Google AI conversations per day do not meet your needs and you heavily rely on Google AI, we invite you to subscribe to our affordable products.'),
(13, 'zh-cn', '[标题 CN] gemini-google-com', '[内容 CN] Gemini - chat to supercharge your ideas', '[详情 CN]'),
(13, 'zh-tw', '[標題 TW] gemini-google-com', '[內容 TW] Gemini - chat to supercharge your ideas', '[詳情 TW]'),
-- igsummit-com (ID 14)
(14, 'en', 'Instagram Summit 2023 | Learn Hyper-Growth and AI Strategies', 'Join Manychat''s biggest Instagram event on October 3-4, 2023. Get hyper-growth and AI strategies from experts with 1 million+ followers. Get your ticket today!', E'### What is Instagram Summit 2023?\n\n#### How can I use Instagram Summit 2023?\n\nInstagram Summit 2023 is a 2-day virtual event where you can learn hyper-growth and AI strategies from experts who have grown their Instagram accounts to 1M followers and beyond. You can gain proven and actionable tactics, learn the most-wanted Instagram strategies, frameworks, and methods to sell more, engage instantly, and scale faster than ever before.\n\n#### Features of Instagram Summit 2023\n\n* 20+ unmissable sessions over 2 days\n* 7k+ attendees from over 170 countries\n* 15+ internationally renowned experts\n* Automate, Sell, Profit: Learn how to monetize your Instagram account using the shortcuts industry powe'), -- Detail text seems truncated in source
(14, 'zh-cn', '[标题 CN] igsummit-com', '[内容 CN] Instagram Summit 2023 | Learn Hyper-Growth and AI Strategies', '[详情 CN]'),
(14, 'zh-tw', '[標題 TW] igsummit-com', '[內容 TW] Instagram Summit 2023 | Learn Hyper-Growth and AI Strategies', '[詳情 TW]');


-- Commit Transaction (If using BEGIN)
-- COMMIT;

-- End of Seed Data Insertion Script