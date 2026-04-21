-- 待办网页应用 - Supabase 建表 SQL
-- 执行方式：Supabase Dashboard → SQL Editor → 粘贴执行

-- 1. 创建 todos 表
CREATE TABLE IF NOT EXISTS todos (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  category TEXT NOT NULL DEFAULT 'inbox'
    CHECK (category IN ('inbox', 'payment', 'waiting', 'product', 'followup', 'project')),
  title TEXT NOT NULL,
  due_date DATE NOT NULL DEFAULT CURRENT_DATE,
  note TEXT,
  amount TEXT,
  supplier TEXT,
  waiting_for TEXT,
  waiting_since DATE,
  next_step TEXT,
  status TEXT NOT NULL DEFAULT 'pending'
    CHECK (status IN ('pending', 'completed')),
  completed_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  sort_order INTEGER NOT NULL DEFAULT 0
);

-- 2. 创建索引
CREATE INDEX idx_todos_status ON todos (status);
CREATE INDEX idx_todos_category ON todos (category);
CREATE INDEX idx_todos_due_date ON todos (due_date);

-- 3. 开启 RLS
ALTER TABLE todos ENABLE ROW LEVEL SECURITY;

-- 4. 允许 anon 角色全权限（个人使用，前端有密码门）
CREATE POLICY "Allow anon select" ON todos FOR SELECT TO anon USING (true);
CREATE POLICY "Allow anon insert" ON todos FOR INSERT TO anon WITH CHECK (true);
CREATE POLICY "Allow anon update" ON todos FOR UPDATE TO anon USING (true) WITH CHECK (true);
CREATE POLICY "Allow anon delete" ON todos FOR DELETE TO anon USING (true);
