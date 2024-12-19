return {
	"David-Kunz/gen.nvim",
	config = function()
		require("gen").setup({
			model = "llama3.2", -- The default model to use.
			host = "localhost", -- The host running the Ollama service.
			port = "11434", -- The port on which the Ollama service is listening.
			display_mode = "float", -- The display mode. Can be "float" or "split".
			show_prompt = false, -- Shows the Prompt submitted to Ollama.
			show_model = false, -- Displays which model you are using at the beginning of your chat session.
			no_auto_close = false, -- Never closes the window automatically.
			init = function(options)
				pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
			end,
			-- Function to initialize Ollama
			command = function(options)
				return "curl --silent --no-buffer -X POST http://"
					.. options.host
					.. ":"
					.. options.port
					.. "/api/chat -d $body"
			end,
			-- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
			-- This can also be a command string.
			-- The executed command must return a JSON object with { response, context }
			-- (context property is optional).
			-- list_models = '<omitted lua function>', -- Retrieves a list of model names
			debug = false, -- Prints errors and the command which is run.    })
		})

		vim.keymap.set("n", "<leader>oc", ":Gen Chat<CR>", { buffer = buffer, desc = "Chat" })
		vim.keymap.set("n", "<leader>og", ":Gen Generate<CR>", { buffer = buffer, desc = "Generate" })
		vim.keymap.set("v", "<leader>oa", ":Gen Ask<CR>", { buffer = buffer, desc = "Ask" })
		vim.keymap.set("v", "<leader>oi", ":Gen Enhance_Code<CR>", { buffer = buffer, desc = "Improve Code" })
		vim.keymap.set("v", "<leader>or", ":Gen Review_Code<CR>", { buffer = buffer, desc = "Review Code" })

		local gen = require("gen")
		gen.prompts["Improve_Grammar_Spelling_English"] = {
			prompt = 'Check the following sentence for grammar and clarity in english: "$text". Rewrite it for better readability while maintaining its original meaning. The result should be just the new sentence without additional details and explanation.',
			replace = true,
		}
		vim.keymap.set(
			"v",
			"<leader>oge",
			":Gen Improve_Grammar_Spelling_English<CR>",
			{ buffer = buffer, desc = "English" }
		)
		gen.prompts["Improve_Grammar_Spelling_Spanish"] = {
			prompt = 'Check the following sentence for grammar and clarity in spanish: "$text". Rewrite it for better readability while maintaining its original meaning. The result should be just the new sentence without additional details and explanation.',
			replace = true,
		}
		vim.keymap.set(
			"v",
			"<leader>ogs",
			":Gen Improve_Grammar_Spelling_Spanish<CR>",
			{ buffer = buffer, desc = "Spanish" }
		)
		gen.prompts["Improve_Grammar_Spelling_Portuguese"] = {
			prompt = 'Check the following sentence for grammar and clarity in portuguese: "$text". Rewrite it for better readability while maintaining its original meaning. The result should be just the new sentence without additional details and explanation.',
			replace = true,
		}
		vim.keymap.set(
			"v",
			"<leader>ogp",
			":Gen Improve_Grammar_Spelling_Portuguese<CR>",
			{ buffer = buffer, desc = "Spanish" }
		)

		gen.prompts["Translate_Portuguese_to_English"] = {
			prompt = 'Translate the following sentence "$text" from Brazilian Portuguese to American English. The result should be just the translation without additional details and explanation. Use appropriate cultural references and idioms when possible.',
			replace = true,
		}
		vim.keymap.set(
			"v",
			"<leader>otpe",
			":Gen Translate_Portuguese_to_English<CR>",
			{ buffer = buffer, desc = "English" }
		)

		gen.prompts["Translate_Portuguese_to_Spanish"] = {
			prompt = 'Translate the following sentence "$text" from Brazilian Portuguese to Spanish. The result should be just the translation without additional details and explanation. Use appropriate cultural references and idioms when possible.',
			replace = true,
		}
		vim.keymap.set(
			"v",
			"<leader>otps",
			":Gen Translate_Portuguese_to_Spanish<CR>",
			{ buffer = buffer, desc = "Spanish" }
		)

		gen.prompts["Translate_English_to_Portuguese"] = {
			prompt = 'Translate the following sentence "$text" from English to Brazilian Portuguese. The result should be just the translation without additional details and explanation. Use appropriate cultural references and idioms when possible.',
			replace = true,
		}
		vim.keymap.set(
			"v",
			"<leader>otep",
			":Gen Translate_English_to_Portuguese<CR>",
			{ buffer = buffer, desc = "Portuguese" }
		)

		gen.prompts["Translate_Spanish_to_Portuguese"] = {
			prompt = 'Translate the following sentence "$text" from Spanish to Brazilian Portuguese. The result should be just the translation without additional details and explanation. Use appropriate cultural references and idioms when possible.',
			replace = true,
		}
		vim.keymap.set(
			"v",
			"<leader>otsp",
			":Gen Translate_Spanish_to_Portuguese<CR>",
			{ buffer = buffer, desc = "Portuguese" }
		)

		gen.prompts["do_something"] = {
			prompt = "$input, just output the final text:\n$text",
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
		{
			mode = { "v" },
			"<leader>ot",
			desc = "Translate",
		},
		{
			mode = { "v" },
			"<leader>og",
			desc = "Improve Grammar",
		},
		{
			mode = { "v" },
			"<leader>ote",
			desc = "English",
		},
		{
			mode = { "v" },
			"<leader>ots",
			desc = "Spanish",
		},
		{
			mode = { "v" },
			"<leader>otp",
			desc = "Portuguese",
		},
	},
}
