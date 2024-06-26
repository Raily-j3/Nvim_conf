local map = vim.keymap.set

map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- window
map("n", "<leader>d", "<C-W>c", { desc = "Delete window", remap = true })
map("n", "<leader>w", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })
map("n", "<leader>j", "<C-W>j", { desc = "" })
map("n", "<leader>k", "<C-W>k", { desc = "" })
map("n", "<leader>h", "<C-W>h", { desc = "" })
map("n", "<leader>l", "<C-W>l", { desc = "" })
map("n", "{", "[{", { desc = "" })
map("n", "}", "]}", { desc = "" })

-- line move
map("n", "<C-A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<C-A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<C-A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<C-A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<C-A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<C-A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
map("v", "<", "<gv")
map("v", ">", ">gv")

-- cursor move
map({ "n", "v" }, "H", "_", { desc = "" })
map({ "n", "v" }, "L", "g_", { desc = "" })
map({ "n", "v" }, "J", "5j", { desc = "" })
map({ "n", "v" }, "K", "5k", { desc = "" })
map({ "n", "t" }, "<C-j>", "5<C-e>", { desc = "" })
map({ "n", "t" }, "<C-k>", "5<C-y>", { desc = "" })

-- other
map("t", "<C-h>", "")
map("t", "<C-l>", "clear<cr>")
map({ "n", "x" }, "<leader>p", '"0p')
map({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<cr>")
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })
