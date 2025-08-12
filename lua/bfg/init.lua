local M = {}

-- Color palette
local colors = {
	bg = "#1a2b2b",
	fg = "#c0c0c0",
	gray = "#4a5a5a",
	green = "#6b8b6b",
	yellow = "#d4d4aa",
	red = "#d75f5f",

	-- UI colors
	bg_soft = "#213131",
	bg_hard = "#0a1b1b",
	bg_statusline = "#2a3b3b",
	bg_visual = "#2a4a4a",
	bg_search = "#3a4a3a",
	bg_float = "#2a3b3b",
}

-- Default config
local default_config = {
	terminal_colors = true,
	transparent_mode = true,
	italic = {
		comments = true,
		strings = false,
	},
	bold = false,
	palette_overrides = {},
	overrides = {},
}

M.config = default_config

-- Setup function for user configuration
function M.setup(user_config)
	M.config = vim.tbl_deep_extend("force", M.config, user_config or {})
	return M
end

-- Get the current color palette (useful for other plugins)
function M.get_palette()
	return vim.tbl_deep_extend("force", colors, M.config.palette_overrides)
end

-- Internal colorscheme loading function
local function apply_colorscheme()
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.g.colors_name = "bfg"
	vim.o.termguicolors = true

	-- Apply palette overrides
	local palette = M.get_palette()

	local bg = M.config.transparent_mode and "NONE" or palette.bg

	local groups = {
		-- Base
		Normal = { fg = palette.fg, bg = bg },
		NonText = { fg = palette.gray, bg = bg },
		SignColumn = { bg = bg },
		EndOfBuffer = { bg = bg },

		-- Syntax highlighting
		Comment = { fg = palette.green, italic = M.config.italic.comments },
		String = { fg = palette.yellow, italic = M.config.italic.strings },
		Number = { fg = palette.yellow },
		Boolean = { fg = palette.yellow },
		Character = { fg = palette.yellow },
		Constant = { fg = palette.yellow },
		Keyword = { fg = palette.green, bold = M.config.bold },
		Function = { fg = palette.fg, bold = M.config.bold },
		Type = { fg = palette.green, bold = M.config.bold },
		Identifier = { fg = palette.fg },
		Operator = { fg = palette.fg },
		Delimiter = { fg = palette.fg },
		PreProc = { fg = palette.green },
		Special = { fg = palette.yellow },
		Statement = { fg = palette.green },
		Conditional = { fg = palette.green },
		Exception = { fg = palette.green },
		Include = { fg = palette.green },
		Label = { fg = palette.green },
		Repeat = { fg = palette.green },
		StorageClass = { fg = palette.green },
		Structure = { fg = palette.green },
		Typedef = { fg = palette.green },

		-- UI elements
		LineNr = { fg = palette.gray, bg = bg },
		StatusLine = { fg = palette.fg, bg = M.config.transparent_mode and "NONE" or palette.bg_statusline },
		StatusLineNC = { fg = palette.gray, bg = M.config.transparent_mode and "NONE" or palette.bg_statusline },
		VertSplit = { fg = palette.gray },
		Visual = { bg = palette.bg_visual },
		Search = { bg = palette.bg_search },
		CursorLine = { bg = palette.bg_soft },

		-- Popups and floats
		NormalFloat = { fg = palette.fg, bg = palette.bg_float },
		FloatBorder = { fg = palette.gray, bg = palette.bg_float },
		Pmenu = { fg = palette.fg, bg = palette.bg_float },
		PmenuSel = { fg = palette.fg, bg = palette.gray },
		PmenuSbar = { bg = palette.bg_float },
		PmenuThumb = { bg = palette.gray },

		-- Diagnostics
		DiagnosticError = { fg = palette.red },
		DiagnosticWarn = { fg = palette.yellow },
		DiagnosticInfo = { fg = palette.green },
		DiagnosticHint = { fg = palette.green },
		DiagnosticFloatingError = { fg = palette.fg, bg = palette.bg_float },
		DiagnosticFloatingWarn = { fg = palette.yellow, bg = palette.bg_float },
		DiagnosticFloatingInfo = { fg = palette.green, bg = palette.bg_float },
		DiagnosticFloatingHint = { fg = palette.green, bg = palette.bg_float },

		-- Git/Diff
		DiffAdd = { fg = palette.green, bg = bg },
		DiffChange = { fg = palette.yellow, bg = bg },
		DiffDelete = { fg = palette.red, bg = bg },
		DiffText = { fg = palette.fg, bg = palette.bg_visual },

		-- Treesitter
		["@variable"] = { fg = palette.fg },
		["@variable.builtin"] = { fg = palette.green },
		["@variable.parameter"] = { fg = palette.fg },
		["@variable.member"] = { fg = palette.fg },
		["@constant"] = { fg = palette.yellow },
		["@constant.builtin"] = { fg = palette.yellow },
		["@constant.macro"] = { fg = palette.green },
		["@string"] = { fg = palette.yellow, italic = M.config.italic.strings },
		["@string.escape"] = { fg = palette.green },
		["@character"] = { fg = palette.yellow },
		["@number"] = { fg = palette.yellow },
		["@boolean"] = { fg = palette.yellow },
		["@function"] = { fg = palette.fg },
		["@function.builtin"] = { fg = palette.green },
		["@function.macro"] = { fg = palette.green },
		["@parameter"] = { fg = palette.fg },
		["@method"] = { fg = palette.fg },
		["@field"] = { fg = palette.fg },
		["@property"] = { fg = palette.fg },
		["@constructor"] = { fg = palette.green },
		["@conditional"] = { fg = palette.green },
		["@repeat"] = { fg = palette.green },
		["@label"] = { fg = palette.green },
		["@operator"] = { fg = palette.fg },
		["@keyword"] = { fg = palette.green },
		["@exception"] = { fg = palette.green },
		["@type"] = { fg = palette.green },
		["@type.builtin"] = { fg = palette.green },
		["@include"] = { fg = palette.green },
		["@punctuation.delimiter"] = { fg = palette.fg },
		["@punctuation.bracket"] = { fg = palette.fg },
		["@punctuation.special"] = { fg = palette.green },
		["@comment"] = { fg = palette.green, italic = M.config.italic.comments },
		["@tag"] = { fg = palette.green },
		["@tag.attribute"] = { fg = palette.fg },
		["@tag.delimiter"] = { fg = palette.gray },
	}

	-- Apply user overrides
	for group, override in pairs(M.config.overrides) do
		if groups[group] then
			groups[group] = vim.tbl_extend("force", groups[group], override)
		else
			groups[group] = override
		end
	end

	-- Set all highlights
	for group, settings in pairs(groups) do
		vim.api.nvim_set_hl(0, group, settings)
	end

	-- Set terminal colors
	if M.config.terminal_colors then
		vim.g.terminal_color_0 = palette.bg
		vim.g.terminal_color_1 = palette.red
		vim.g.terminal_color_2 = palette.green
		vim.g.terminal_color_3 = palette.yellow
		vim.g.terminal_color_4 = palette.green -- using green as blue
		vim.g.terminal_color_5 = palette.green -- using green as purple
		vim.g.terminal_color_6 = palette.green -- using green as cyan
		vim.g.terminal_color_7 = palette.fg
		vim.g.terminal_color_8 = palette.gray
		vim.g.terminal_color_9 = palette.red
		vim.g.terminal_color_10 = palette.green
		vim.g.terminal_color_11 = palette.yellow
		vim.g.terminal_color_12 = palette.green
		vim.g.terminal_color_13 = palette.green
		vim.g.terminal_color_14 = palette.green
		vim.g.terminal_color_15 = palette.fg
	end
end

-- Public load function that applies the colorscheme
function M.load()
	apply_colorscheme()
	return M
end

-- Deprecated: kept for backward compatibility
M.colorscheme = M.load

return M
