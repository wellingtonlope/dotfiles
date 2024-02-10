return {
  "David-Kunz/gen.nvim",
  config = function()
    require("gen").setup({
      model = "llama2",      -- The default model to use.
      display_mode = "float", -- The display mode. Can be "float" or "split".
      show_prompt = false,    -- Shows the Prompt submitted to Ollama.
      show_model = false,     -- Displays which model you are using at the beginning of your chat session.
      no_auto_close = false,  -- Never closes the window automatically.
      init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
      -- Function to initialize Ollama
      command = "curl --silent --no-buffer -X POST http://localhost:11434/api/generate -d $body",
      -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
      -- This can also be a lua function returning a command string, with options as the input parameter.
      -- The executed command must return a JSON object with { response, context }
      -- (context property is optional).
      list_models = '<omitted lua function>', -- Retrieves a list of model names
      debug = false                           -- Prints errors and the command which is run.
    })

    vim.keymap.set("n", "<leader>oc", ":Gen Chat<CR>", { buffer = buffer, desc = "Chat" })
    vim.keymap.set("n", "<leader>og", ":Gen Generate<CR>", { buffer = buffer, desc = "Generate" })
    vim.keymap.set("v", "<leader>oa", ":Gen Ask<CR>", { buffer = buffer, desc = "Ask" })
    vim.keymap.set("v", "<leader>og", ":Gen Enhance_Grammar_Spelling<CR>", { buffer = buffer, desc = "Enhance Grammar" })
    vim.keymap.set("v", "<leader>oi", ":Gen Enhance_Code<CR>", { buffer = buffer, desc = "Improve Code" })
    vim.keymap.set("v", "<leader>or", ":Gen Review_Code<CR>", { buffer = buffer, desc = "Review Code" })

    local gen                           = require("gen")
    gen.prompts["Translate_to_English"] = {
      prompt =
      "Translate the following text to English, improving grammar and spelling, just output the final text without additional quotes around it:\n$text",
      replace = true,
    }
    vim.keymap.set("v", "<leader>oe", ":Gen Translate_to_English<CR>", { buffer = buffer, desc = "To English" })

    gen.prompts["Translate_to_Spanish"] = {
      prompt =
      "Translate the following text to Spanish, improving grammar and spelling, just output the final text without additional quotes around it:\n$text",
      replace = true,
    }
    vim.keymap.set("v", "<leader>os", ":Gen Translate_to_Spanish<CR>", { buffer = buffer, desc = "To Spanish" })

    gen.prompts["Translate_to_Portuguese"] = {
      prompt =
      "Translate the following text to Brazilian Portuguese, improving grammar and spelling, just output the final text without additional quotes around it:\n$text",
      replace = true,
    }
    vim.keymap.set("v", "<leader>op", ":Gen Translate_to_Portuguese<CR>", { buffer = buffer, desc = "To Portuguese" })

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
