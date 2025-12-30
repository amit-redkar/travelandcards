#!/bin/bash

# Travel And Cards Blog - Complete Setup Script
# Run this script in an empty folder to generate all files

echo "🚀 Creating Travel And Cards blog structure..."

# Create directories
mkdir -p _layouts _includes _posts admin assets/css assets/uploads

# Create .gitkeep for uploads
touch assets/uploads/.gitkeep

# ============================================
# _config.yml
# ============================================
cat > _config.yml << 'EOF'
title: Travel And Cards
description: Credit card reviews, miles hacks, travel itineraries & visa guides
url: "https://yourdomain.com"
baseurl: ""
permalink: /:slug/

youtube_channel: "https://www.youtube.com/@travelandcards"
author: Travel And Cards

markdown: kramdown
highlighter: rouge

collections:
  posts:
    output: true
    permalink: /:slug/

defaults:
  - scope:
      path: ""
      type: "posts"
    values:
      layout: "post"

exclude:
  - README.md
  - node_modules
  - vendor
  - setup.sh

plugins:
  - jekyll-sitemap
  - jekyll-feed
EOF

# ============================================
# _layouts/default.html
# ============================================
cat > _layouts/default.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
{% include head.html %}
<body>
  {% include header.html %}
  
  <main class="main-container">
    {{ content }}
  </main>

  {% include footer.html %}
</body>
</html>
EOF

# ============================================
# _layouts/post.html
# ============================================
cat > _layouts/post.html << 'EOF'
---
layout: default
---
<article class="article-page">
  <div class="article-header">
    <div class="article-meta">
      <a href="/categories/#{{ page.category | slugify }}" class="category-badge">{{ page.category }}</a>
      <span class="publish-date">{{ page.date | date: "%b %d, %Y" }}</span>
    </div>
    <h1 class="article-title">{{ page.title }}</h1>
  </div>

  <div class="video-container">
    <iframe 
      src="https://www.youtube.com/embed/{{ page.youtube_id }}" 
      title="{{ page.title }}"
      frameborder="0" 
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
      allowfullscreen>
    </iframe>
  </div>

  <div class="article-content">
    {{ content }}
  </div>

  <div class="article-footer">
    <a href="{{ site.youtube_channel }}" target="_blank" class="subscribe-btn">
      <svg class="yt-icon" viewBox="0 0 24 24" fill="currentColor">
        <path d="M23.5 6.2c-.3-1-1-1.8-2-2.1C19.6 3.5 12 3.5 12 3.5s-7.6 0-9.5.6c-1 .3-1.7 1.1-2 2.1C0 8.1 0 12 0 12s0 3.9.5 5.8c.3 1 1.8 2 2.1 1.9.6 9.5.6 9.5.6s7.6 0 9.5-.6c1-.3 1.7-1.1 2-2.1.5-1.9.5-5.8.5-5.8s0-3.9-.5-5.8zM9.5 15.5v-7l6.4 3.5-6.4 3.5z"/>
      </svg>
      Subscribe on YouTube
    </a>
  </div>
</article>

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Article",
  "headline": "{{ page.title | escape }}",
  "description": "{{ page.seo_description | escape }}",
  "image": "{{ site.url }}{{ page.thumbnail }}",
  "datePublished": "{{ page.date | date_to_xmlschema }}",
  "author": {
    "@type": "Organization",
    "name": "{{ site.author }}"
  },
  "publisher": {
    "@type": "Organization",
    "name": "{{ site.title }}",
    "logo": {
      "@type": "ImageObject",
      "url": "{{ site.url }}/assets/logo.png"
    }
  },
  "video": {
    "@type": "VideoObject",
    "name": "{{ page.title | escape }}",
    "description": "{{ page.seo_description | escape }}",
    "thumbnailUrl": "https://img.youtube.com/vi/{{ page.youtube_id }}/maxresdefault.jpg",
    "uploadDate": "{{ page.date | date_to_xmlschema }}",
    "embedUrl": "https://www.youtube.com/embed/{{ page.youtube_id }}"
  }
}
</script>
EOF

# ============================================
# _includes/head.html
# ============================================
cat > _includes/head.html << 'EOF'
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{% if page.title %}{{ page.title }} | {% endif %}{{ site.title }}</title>
  
  <meta name="description" content="{% if page.seo_description %}{{ page.seo_description }}{% else %}{{ site.description }}{% endif %}">
  <meta name="keywords" content="{% if page.seo_keywords %}{{ page.seo_keywords }}{% else %}credit cards, miles, travel, visa{% endif %}">
  <meta name="author" content="{{ site.author }}">
  <link rel="canonical" href="{{ site.url }}{{ page.url }}">
  
  <link rel="icon" type="image/png" href="/assets/favicon.png">
  <link rel="stylesheet" href="/assets/css/style.css">
  <link rel="alternate" type="application/rss+xml" title="{{ site.title }}" href="{{ site.url }}/feed.xml">
  
  <link rel="preconnect" href="https://www.youtube.com">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
</head>
EOF

# ============================================
# _includes/header.html
# ============================================
cat > _includes/header.html << 'EOF'
<header class="header">
  <div class="header-container">
    <a href="/" class="logo">
      <svg class="logo-icon" viewBox="0 0 24 24" fill="#FF0000">
        <path d="M23.5 6.2c-.3-1-1-1.8-2-2.1C19.6 3.5 12 3.5 12 3.5s-7.6 0-9.5.6c-1 .3-1.7 1.1-2 2.1C0 8.1 0 12 0 12s0 3.9.5 5.8c.3 1 1.8 2 2.1 1.9.6 9.5.6 9.5.6s7.6 0 9.5-.6c1-.3 1.7-1.1 2-2.1.5-1.9.5-5.8.5-5.8s0-3.9-.5-5.8zM9.5 15.5v-7l6.4 3.5-6.4 3.5z"/>
      </svg>
      <span class="logo-text">Travel And Cards</span>
    </a>
    
    <nav class="nav">
      <a href="/" class="nav-link">Home</a>
      <a href="/categories/" class="nav-link">Categories</a>
      <a href="{{ site.youtube_channel }}" target="_blank" class="nav-link nav-subscribe">Subscribe</a>
    </nav>

    <button class="mobile-menu-btn" aria-label="Menu" onclick="document.querySelector('.nav').classList.toggle('nav-open')">
      <svg viewBox="0 0 24 24" fill="currentColor">
        <path d="M3 18h18v-2H3v2zm0-5h18v-2H3v2zm0-7v2h18V6H3z"/>
      </svg>
    </button>
  </div>
</header>
EOF

# ============================================
# _includes/footer.html
# ============================================
cat > _includes/footer.html << 'EOF'
<footer class="footer">
  <div class="footer-container">
    <div class="footer-brand">
      <span class="footer-logo">Travel And Cards</span>
      <p class="footer-tagline">Credit card reviews, miles hacks & travel guides</p>
    </div>
    
    <div class="footer-links">
      <a href="{{ site.youtube_channel }}" target="_blank">YouTube</a>
      <a href="/feed.xml">RSS Feed</a>
    </div>
    
    <p class="footer-copyright">© {{ 'now' | date: "%Y" }} Travel And Cards. All rights reserved.</p>
  </div>
</footer>
EOF

# ============================================
# _includes/article-card.html
# ============================================
cat > _includes/article-card.html << 'EOF'
<a href="{{ include.post.url }}" class="article-card">
  <div class="card-thumbnail">
    <img src="{{ include.post.thumbnail }}" alt="{{ include.post.title }}" loading="lazy">
    <div class="play-overlay">
      <svg viewBox="0 0 24 24" fill="white">
        <path d="M8 5v14l11-7z"/>
      </svg>
    </div>
  </div>
  <div class="card-content">
    <h3 class="card-title">{{ include.post.title }}</h3>
    <div class="card-meta">
      <span class="card-category">{{ include.post.category }}</span>
      <span class="card-date">{{ include.post.date | date: "%b %d, %Y" }}</span>
    </div>
  </div>
</a>
EOF

# ============================================
# index.html
# ============================================
cat > index.html << 'EOF'
---
layout: default
title: Home
---
<div class="home-page">
  <section class="hero">
    <h1>Travel And Cards</h1>
    <p>Credit card reviews, miles hacks, travel itineraries & visa guides</p>
  </section>

  <section class="latest-videos">
    <h2 class="section-title">Latest Videos</h2>
    <div class="articles-grid">
      {% for post in site.posts limit:12 %}
        {% include article-card.html post=post %}
      {% endfor %}
    </div>
  </section>
</div>
EOF

# ============================================
# categories.html
# ============================================
cat > categories.html << 'EOF'
---
layout: default
title: Categories
permalink: /categories/
---
<div class="categories-page">
  <h1 class="page-title">Categories</h1>
  
  {% assign categories = site.posts | map: "category" | uniq %}
  
  {% for category in categories %}
    <section class="category-section" id="{{ category | slugify }}">
      <h2 class="category-title">{{ category }}</h2>
      <div class="articles-grid">
        {% assign cat_posts = site.posts | where: "category", category %}
        {% for post in cat_posts limit:4 %}
          {% include article-card.html post=post %}
        {% endfor %}
      </div>
    </section>
  {% endfor %}
</div>
EOF

# ============================================
# feed.xml
# ============================================
cat > feed.xml << 'EOF'
---
layout: null
---
<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
  <channel>
    <title>{{ site.title | xml_escape }}</title>
    <description>{{ site.description | xml_escape }}</description>
    <link>{{ site.url }}</link>
    <atom:link href="{{ site.url }}/feed.xml" rel="self" type="application/rss+xml"/>
    <lastBuildDate>{{ site.time | date_to_rfc822 }}</lastBuildDate>
    {% for post in site.posts limit:20 %}
    <item>
      <title>{{ post.title | xml_escape }}</title>
      <description>{{ post.seo_description | xml_escape }}</description>
      <pubDate>{{ post.date | date_to_rfc822 }}</pubDate>
      <link>{{ site.url }}{{ post.url }}</link>
      <guid isPermaLink="true">{{ site.url }}{{ post.url }}</guid>
      <category>{{ post.category | xml_escape }}</category>
    </item>
    {% endfor %}
  </channel>
</rss>
EOF

# ============================================
# sitemap.xml
# ============================================
cat > sitemap.xml << 'EOF'
---
layout: null
---
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>{{ site.url }}/</loc>
    <lastmod>{{ site.time | date_to_xmlschema }}</lastmod>
    <priority>1.0</priority>
  </url>
  <url>
    <loc>{{ site.url }}/categories/</loc>
    <lastmod>{{ site.time | date_to_xmlschema }}</lastmod>
    <priority>0.8</priority>
  </url>
  {% for post in site.posts %}
  <url>
    <loc>{{ site.url }}{{ post.url }}</loc>
    <lastmod>{{ post.date | date_to_xmlschema }}</lastmod>
    <priority>0.7</priority>
  </url>
  {% endfor %}
</urlset>
EOF

# ============================================
# robots.txt
# ============================================
cat > robots.txt << 'EOF'
User-agent: *
Allow: /

Sitemap: https://yourdomain.com/sitemap.xml
EOF

# ============================================
# Sample Post
# ============================================
cat > _posts/2024-12-30-hdfc-infinia-credit-card-review.md << 'EOF'
---
title: "HDFC Infinia Credit Card - Complete Review 2024"
slug: hdfc-infinia-credit-card-review
youtube_id: "dQw4w9WgXcQ"
thumbnail: "/assets/uploads/sample-thumbnail.jpg"
category: "Credit Card Reviews"
date: 2024-12-30
seo_keywords: "HDFC Infinia review, HDFC Infinia credit card, best premium credit card India, Infinia benefits"
seo_description: "Complete HDFC Infinia Credit Card review for 2024. Learn about rewards, lounge access, travel benefits, and whether this premium card is worth it."
---

The HDFC Infinia is considered one of the best premium credit cards in India. In this video, I break down everything you need to know.

## Key Benefits

The card offers 5X reward points on all spends, which translates to roughly 3.3% return. You also get unlimited airport lounge access worldwide with Priority Pass.

## Who Should Get This Card?

If you spend over ₹8-10 lakhs annually and travel frequently, the Infinia makes sense. The annual fee is ₹12,500 but easily recoverable through benefits.

## Final Verdict

For premium travelers and high spenders, this is the gold standard in Indian credit cards. Watch the full video above for my detailed breakdown including the application process.
EOF

# ============================================
# admin/index.html
# ============================================
cat > admin/index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Admin | Travel And Cards</title>
</head>
<body>
  <script src="https://unpkg.com/decap-cms@^3.0.0/dist/decap-cms.js"></script>
</body>
</html>
EOF

# ============================================
# admin/config.yml
# ============================================
cat > admin/config.yml << 'EOF'
backend:
  name: github
  repo: YOUR_GITHUB_USERNAME/YOUR_REPO_NAME
  branch: main
  base_url: https://YOUR_WORKER_NAME.YOUR_SUBDOMAIN.workers.dev
  auth_endpoint: /auth

media_folder: "assets/uploads"
public_folder: "/assets/uploads"

collections:
  - name: "posts"
    label: "Articles"
    folder: "_posts"
    create: true
    slug: "{{year}}-{{month}}-{{day}}-{{slug}}"
    fields:
      - { label: "Title", name: "title", widget: "string" }
      - { label: "Slug", name: "slug", widget: "string", pattern: ['^[a-z0-9]+(?:-[a-z0-9]+)*$', "Lowercase letters, numbers, and hyphens only"] }
      - { label: "YouTube Video ID", name: "youtube_id", widget: "string", hint: "Just the ID, e.g., dQw4w9WgXcQ" }
      - { label: "Thumbnail", name: "thumbnail", widget: "image" }
      - { label: "Description", name: "body", widget: "markdown" }
      - label: "Category"
        name: "category"
        widget: "select"
        options:
          - "Credit Card Reviews"
          - "Miles & Points"
          - "Travel Itineraries"
          - "Visa Guides"
          - "Smart Hacks"
      - { label: "Publish Date", name: "date", widget: "datetime" }
      - { label: "SEO Keywords", name: "seo_keywords", widget: "string", hint: "Comma-separated keywords" }
      - { label: "SEO Description", name: "seo_description", widget: "text", hint: "150-160 characters recommended" }
EOF

echo "✅ Admin files created!"
echo ""
echo "⚠️  IMPORTANT: Update these placeholders in admin/config.yml:"
echo "   - YOUR_GITHUB_USERNAME/YOUR_REPO_NAME"
echo "   - YOUR_WORKER_NAME.YOUR_SUBDOMAIN.workers.dev"

# ============================================
# assets/css/style.css
# ============================================
cat > assets/css/style.css << 'EOF'
:root {
  --yt-red: #FF0000;
  --yt-black: #0F0F0F;
  --yt-white: #FFFFFF;
  --yt-light-gray: #F2F2F2;
  --yt-border: #E5E5E5;
  --yt-text: #0F0F0F;
  --yt-text-secondary: #606060;
  --yt-hover: #E5E5E5;
  --font-family: 'Roboto', -apple-system, BlinkMacSystemFont, sans-serif;
  --max-width: 1284px;
  --header-height: 56px;
}

*, *::before, *::after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

html { scroll-behavior: smooth; }

body {
  font-family: var(--font-family);
  background: var(--yt-white);
  color: var(--yt-text);
  line-height: 1.5;
  -webkit-font-smoothing: antialiased;
}

a { text-decoration: none; color: inherit; }
img { max-width: 100%; height: auto; display: block; }

.header {
  position: sticky;
  top: 0;
  background: var(--yt-white);
  border-bottom: 1px solid var(--yt-border);
  height: var(--header-height);
  z-index: 100;
}

.header-container {
  max-width: var(--max-width);
  margin: 0 auto;
  padding: 0 24px;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.logo { display: flex; align-items: center; gap: 8px; }
.logo-icon { width: 32px; height: 32px; }
.logo-text { font-size: 18px; font-weight: 700; color: var(--yt-black); letter-spacing: -0.5px; }

.nav { display: flex; align-items: center; gap: 8px; }
.nav-link {
  padding: 8px 16px;
  font-size: 14px;
  font-weight: 500;
  color: var(--yt-text);
  border-radius: 18px;
  transition: background 0.2s;
}
.nav-link:hover { background: var(--yt-hover); }
.nav-subscribe { background: var(--yt-black); color: var(--yt-white); }
.nav-subscribe:hover { background: #272727; }

.mobile-menu-btn {
  display: none;
  background: none;
  border: none;
  cursor: pointer;
  padding: 8px;
}
.mobile-menu-btn svg { width: 24px; height: 24px; }

.main-container {
  max-width: var(--max-width);
  margin: 0 auto;
  padding: 24px;
  min-height: calc(100vh - var(--header-height) - 200px);
}

.hero { text-align: center; padding: 48px 24px; margin-bottom: 32px; }
.hero h1 { font-size: 32px; font-weight: 700; margin-bottom: 8px; }
.hero p { color: var(--yt-text-secondary); font-size: 16px; }

.section-title { font-size: 20px; font-weight: 600; margin-bottom: 20px; }

.articles-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 16px;
}

.article-card { display: block; cursor: pointer; }

.card-thumbnail {
  position: relative;
  border-radius: 12px;
  overflow: hidden;
  aspect-ratio: 16/9;
  background: var(--yt-light-gray);
}
.card-thumbnail img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.2s;
}
.article-card:hover .card-thumbnail img { transform: scale(1.05); }

.play-overlay {
  position: absolute;
  inset: 0;
  background: rgba(0, 0, 0, 0.4);
  display: flex;
  align-items: center;
  justify-content: center;
  opacity: 0;
  transition: opacity 0.2s;
}
.article-card:hover .play-overlay { opacity: 1; }
.play-overlay svg { width: 48px; height: 48px; }

.card-content { padding: 12px 4px; }
.card-title {
  font-size: 14px;
  font-weight: 500;
  line-height: 1.4;
  margin-bottom: 8px;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}
.article-card:hover .card-title { color: var(--yt-text); }

.card-meta {
  display: flex;
  align-items: center;
  gap: 8px;
  font-size: 12px;
  color: var(--yt-text-secondary);
}
.card-category { background: var(--yt-light-gray); padding: 4px 8px; border-radius: 4px; }

.article-page { max-width: 900px; margin: 0 auto; }
.article-header { margin-bottom: 20px; }
.article-meta { display: flex; align-items: center; gap: 12px; margin-bottom: 12px; }

.category-badge {
  background: var(--yt-light-gray);
  padding: 6px 12px;
  border-radius: 16px;
  font-size: 12px;
  font-weight: 500;
  transition: background 0.2s;
}
.category-badge:hover { background: var(--yt-hover); }
.publish-date { font-size: 14px; color: var(--yt-text-secondary); }
.article-title { font-size: 24px; font-weight: 700; line-height: 1.3; }

.video-container {
  position: relative;
  width: 100%;
  aspect-ratio: 16/9;
  margin-bottom: 24px;
  border-radius: 12px;
  overflow: hidden;
  background: var(--yt-black);
}
.video-container iframe { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }

.article-content { font-size: 16px; line-height: 1.8; color: var(--yt-text); }
.article-content h2 { font-size: 20px; font-weight: 600; margin: 32px 0 16px; }
.article-content h3 { font-size: 18px; font-weight: 600; margin: 24px 0 12px; }
.article-content p { margin-bottom: 16px; }
.article-content ul, .article-content ol { margin: 16px 0; padding-left: 24px; }
.article-content li { margin-bottom: 8px; }
.article-content a { color: var(--yt-red); }
.article-content a:hover { text-decoration: underline; }

.article-footer {
  margin-top: 40px;
  padding-top: 24px;
  border-top: 1px solid var(--yt-border);
  text-align: center;
}
.subscribe-btn {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  background: var(--yt-red);
  color: var(--yt-white);
  padding: 12px 24px;
  border-radius: 24px;
  font-size: 14px;
  font-weight: 500;
  transition: background 0.2s;
}
.subscribe-btn:hover { background: #cc0000; }
.subscribe-btn .yt-icon { width: 20px; height: 20px; }

.categories-page { padding: 24px 0; }
.page-title { font-size: 28px; font-weight: 700; margin-bottom: 32px; }
.category-section { margin-bottom: 48px; }
.category-title {
  font-size: 20px;
  font-weight: 600;
  margin-bottom: 16px;
  padding-bottom: 8px;
  border-bottom: 1px solid var(--yt-border);
}

.footer { background: var(--yt-light-gray); padding: 40px 24px; margin-top: 48px; }
.footer-container { max-width: var(--max-width); margin: 0 auto; text-align: center; }
.footer-logo { font-size: 18px; font-weight: 700; }
.footer-tagline { color: var(--yt-text-secondary); font-size: 14px; margin: 8px 0 24px; }
.footer-links { display: flex; justify-content: center; gap: 24px; margin-bottom: 24px; }
.footer-links a { color: var(--yt-text-secondary); font-size: 14px; transition: color 0.2s; }
.footer-links a:hover { color: var(--yt-text); }
.footer-copyright { color: var(--yt-text-secondary); font-size: 12px; }

@media (max-width: 768px) {
  .header-container { padding: 0 16px; }
  .nav { 
    display: none;
    position: absolute;
    top: var(--header-height);
    left: 0;
    right: 0;
    background: var(--yt-white);
    flex-direction: column;
    padding: 16px;
    border-bottom: 1px solid var(--yt-border);
  }
  .nav.nav-open { display: flex; }
  .mobile-menu-btn { display: block; }
  .main-container { padding: 16px; }
  .hero { padding: 32px 16px; }
  .hero h1 { font-size: 24px; }
  .articles-grid { grid-template-columns: 1fr; gap: 24px; }
  .article-title { font-size: 20px; }
  .article-content { font-size: 15px; }
}

@media (max-width: 480px) {
  .card-thumbnail { border-radius: 8px; }
  .article-meta { flex-wrap: wrap; }
}
EOF

# ============================================
# README.md
# ============================================
cat > README.md << 'EOF'
# Travel And Cards Blog

A YouTube-inspired blog for credit card reviews, miles hacks, travel itineraries & visa guides.

## Setup Instructions

1. Update `_config.yml` with your domain
2. Update `admin/config.yml` with your GitHub repo and Cloudflare Worker URL
3. Update `robots.txt` with your domain
4. Deploy Cloudflare Worker for OAuth
5. Enable GitHub Pages

## Admin Panel

Access at: `yourdomain.com/admin/`

## Structure

- `_posts/` - Your articles (Markdown)
- `assets/uploads/` - Images uploaded via admin
- `admin/` - Decap CMS admin panel
EOF

echo ""
echo "=========================================="
echo "✅ All files created successfully!"
echo "=========================================="
echo ""
echo "📁 Folder structure:"
find . -type f -name "*.html" -o -name "*.yml" -o -name "*.css" -o -name "*.xml" -o -name "*.md" -o -name "*.txt" | head -20
echo ""
echo "📋 Next steps:"
echo "1. Update _config.yml with your actual domain"
echo "2. Update admin/config.yml with your GitHub username/repo"
echo "3. Update robots.txt with your domain"
echo "4. Push to GitHub"
echo "5. Deploy Cloudflare Worker"
echo "6. Enable GitHub Pages"
echo ""
