return {
  "David-Kunz/gen.nvim",
  config = function()
    vim.keymap.set("n", "<leader>oc", ":Gen Chat<CR>", { buffer = buffer, desc = "Chat" })
    vim.keymap.set("n", "<leader>og", ":Gen Generate<CR>", { buffer = buffer, desc = "Generate" })
    vim.keymap.set("v", "<leader>oa", ":Gen Ask<CR>", { buffer = buffer, desc = "Ask" })
    vim.keymap.set("v", "<leader>og", ":Gen Enhance_Grammar_Spelling<CR>", { buffer = buffer, desc = "Enhance Grammar" })
    vim.keymap.set("v", "<leader>oe", ":Gen Enhance_Code<CR>", { buffer = buffer, desc = "Enhance Code" })
    vim.keymap.set("v", "<leader>or", ":Gen Review_Code<CR>", { buffer = buffer, desc = "Review Code" })

    local gen                           = require("gen")
    gen.prompts["Translate_to_English"] = {
      prompt =
      "Translate the following text to english, just output the final text without additional quotes around it:\n$text",
      replace = true,
    }
    vim.keymap.set("v", "<leader>ot", ":Gen Translate_to_English<CR>", { buffer = buffer, desc = "To English" })

    gen.prompts["do_something"] = {
      prompt =
      "$input, just output the final text:\n$text",
      replace = true,
    }
    vim.keymap.set("v", "<leader>od", ":Gen do_something<CR>", { buffer = buffer, desc = "Do something" })
  end,
  keys = {
    {
      mode = { "v", "n" },
      "<leader>o",
      desc = "Ollama",
    },
  }
}
