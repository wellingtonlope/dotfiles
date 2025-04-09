return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "github/copilot.vim" },
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		opts = {
			model = "gpt-4o",
			prompts = {
				Rename = {
					prompt = "Please rename the variable correctly in given selection based on context",
					selection = function(source)
						local chat_select = require("CopilotChat.select")
						return chat_select.visual(source)
					end,
				},
				Proofread = {
					prompt = "Please proofread the given selection and correct any errors",
					selection = function(source)
						local chat_select = require("CopilotChat.select")
						return chat_select.visual(source)
					end,
				},
				TranslateToEnglish = {
					prompt = "Please translate the given selection to English",
					selection = function(source)
						local chat_select = require("CopilotChat.select")
						return chat_select.visual(source)
					end,
				},
				TranslateToSpanish = {
					prompt = "Please translate the given selection to Spanish",
					selection = function(source)
						local chat_select = require("CopilotChat.select")
						return chat_select.visual(source)
					end,
				},
				TranslateToPortuguese = {
					prompt = "Please translate the given selection to Portuguese",
					selection = function(source)
						local chat_select = require("CopilotChat.select")
						return chat_select.visual(source)
					end,
				},
			},
		},
		keys = {
			{ "<leader>zn", ":CopilotChatRename<CR>", mode = "v", desc = "Rename the variable" },
			{ "<leader>zp", ":CopilotChatProofread<CR>", mode = "v", desc = "Proofread" },
			{ "<leader>zte", ":CopilotChatTranslateToEnglish<CR>", mode = "v", desc = "Translate to English" },
			{ "<leader>zts", ":CopilotChatTranslateToSpanish<CR>", mode = "v", desc = "Translate to Spanish" },
			{ "<leader>ztp", ":CopilotChatTranslateToPortuguese<CR>", mode = "v", desc = "Translate to Portuguese" },

			{ "<leader>zc", ":CopilotChat<CR>", mode = "n", desc = "Chat with Copilot" },
			{ "<leader>ze", ":CopilotChatExplain<CR>", mode = "v", desc = "Explain Code" },
			{ "<leader>zr", ":CopilotChatReview<CR>", mode = "v", desc = "Review Code" },
			{ "<leader>zf", ":CopilotChatFix<CR>", mode = "v", desc = "Fix Code Iussues" },
			{ "<leader>zo", ":CopilotChatOptimize<CR>", mode = "v", desc = "Optimize Code" },
			{ "<leader>zd", ":CopilotChatDocs<CR>", mode = "v", desc = "Generate Docs" },
			{ "<leader>zt", ":CopilotChatTests<CR>", mode = "v", desc = "Generate Tests" },
			{ "<leader>zm", ":CopilotChatCommit<CR>", mode = "n", desc = "Generate Commit Message" },
			{ "<leader>zm", ":CopilotChatCommit<CR>", mode = "v", desc = "Generate Commit for Selection" },
		},
	},
}
