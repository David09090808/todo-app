# 待办网页应用

> Gundamit 团队待办管理的网页版，手机电脑都能用。

## 架构

- **前端**：单 HTML 文件（内嵌 CSS + JS），部署到 GitHub Pages
- **后端**：Supabase PostgreSQL + REST API
- **认证**：简单密码，localStorage 记住

## 环境要求

- 现代浏览器（Chrome/Safari/Firefox）
- Supabase 项目（已有 gundamit 项目）

## 快速开始

1. 在 Supabase 执行 `setup.sql` 建表
2. 浏览器打开 `index.html`
3. 输入密码即可使用

## 项目结构

```
├── index.html    ← 单文件应用
├── setup.sql     ← 建表 SQL
├── README.md
└── PROGRESS.md
```

## 功能

- 时间视图 / 分类视图 一键切换
- 收集箱快速添加待办
- 标记完成 / 已完成折叠区
- 手机响应式布局
