function VimColor(color)
	color = color or "pop-punk"
	vim.cmd.colorscheme(color)

	--Transparent Background
	vim.api.nvim_set_hl(0,"Normal", { bg = "none" })
	vim.api.nvim_set_hl(0,"NormalFloat", { bg = "none" })
end

VimColor()
