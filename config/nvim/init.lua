require("insis").setup({
  -- json
  json = {
    enable = true,
    -- 以下为默认值，可以省略
    lsp = "jsonls",
    ---@type "jsonls" | "prettier"
    formatter = "jsonls",
    format_on_save = false,
    indent = 2,
    tabWidth = 2,
  },
  -- markdown
  markdown = {
    enable = true,
    -- 以下为默认值，可以省略
    mkdnflow = {
      next_link = "gn",
      prev_link = "gp",
      next_heading = "gj",
      prev_heading = "gk",
      -- 进入链接
      follow_link = "gd",
      -- 从链接返回
      go_back = "<C-o>",
      toggle_item = "tt",
    },
    formatter = "prettier",
    -- 保存时格式化默认为false
    format_on_save = false,
    -- 文字长度到达边缘默认自动折行
    wrap = true,
    ---:MarkdownPreview 命令打开文章预览默认是 dark 皮肤
    ---@type "dark" | "light"
    theme = "dark",
  },
  -- 前端
  frontend = {
    enable = true,
    ---@type "eslint" | false
    linter = "eslint", -- :EslintFixAll command added
    ---@type false | "prettier" | "ts_ls"
    formatter = "ts_ls",
    format_on_save = false,
    indent = 2,
    cspell = false,
    tailwindcss = true,
    prisma = false,
    -- vue will take over typescript lsp
    vue = false,
  },
  -- bash
  bash = {
    enable = true,
    lsp = "bashls",
    --  brew install shfmt
    formatter = "shfmt",
    format_on_save = false,
    indent = 2,
  },
})
--
