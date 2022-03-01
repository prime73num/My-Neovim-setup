---
title: Neovim Crash
date: 2022-02-27 22:11:32
tags: [Neovim]
categories: [Skills]
---
[1]: https://github.com/nvim-telescope/telescope.nvim
[2]: https://github.com/voldikss/vim-floaterm
[3]: https://github.com/preservim/nerdtree
[4]: https://github.com/hrsh7th/nvim-cmp
[5]: https://github.com/topics/nvim-cmp
[6]: https://github.com/neovim/nvim-lspconfig

# File navigate 文件导航

涉及的插件
<!-- more -->
* [telescope][1] 用于文件搜索
* [Floaterm][2] 在neovim中打开terminal
* [NERDtree][3] 用于展示目录树

<!-- Table -->
| 键映射 | 描述 |
| ---- | ---- |
| leader / | 打开自定义的picker |
| leader bb | 打开buffer |
| leader bo | 打开oldfiles |
| leader t | 在CWD下打开文件树 |
| F | 打开terminal |
| cd | change dictionary到文件下 |
| H | 显示hidden和ignore的文件 |
| U | Upload文件到repo里 |
| D | Download文件到当前CWD下 |
<!-- Table -->

# Autocompletion 自动补全

涉及的插件
* [Nvim-cmp][4] 主要的插件，配置不同文件的不同源。
* lsp,luasni,dictionary,latex [more ...][5] 这些都是补全所用的源source.

<!-- Table -->
| 键映射 | 描述 |
| ---- | ---- |
| Tab | 下一个 |
| S-Tab | 上一个 |
| c-k | 找下一个snippet并expand,或者到下一个place holder. |
| c-g | 移动到上一个place holder |
<!-- Table -->

# Language-Server-Protocol LSP

涉及的插件
* [nvim-lspconfig][6] 用来配置各种server. 统一配置键映射。gd gr gi rename, code action, diagmatics.

<!-- Table -->
| 键映射 | 描述 |
| ---- | ---- |
| gd | go definition |
| gr | go reference |
| gi | go implementation |
| H | hover documentation |
| leader sd | show diagmaticx |
| leader dl | diagmatics list |
| [d | next diagmaticx |
| ]d | prev diagmaticx |
| leader rn | Rename |
| leader ca | code action |
<!-- Table -->

# 其他
