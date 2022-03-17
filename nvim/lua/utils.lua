local M = {}
function M.SetPythonIndent()
     vim.o.tabstop=4
     vim.o.softtabstop=4
     vim.o.shiftwidth=4
     vim.o.textwidth=0
     vim.o.expandtab = true
     vim.o.autoindent = true
     vim.o.fileformat= 'unix'
end
-- C/C++ indentation settings
function M.SetCCIndent()
    vim.o.tabstop=2
    vim.o.softtabstop=2
    vim.o.shiftwidth=2
    vim.o.textwidth=0
    vim.o.expandtab = true
    vim.o.fileformat='unix'
end
-- Toggle mouse enable
-- copied from http://unix.stackexchange.com/questions/156707/how-to-toggle-mouse-support-in-vim
function M.ToggleMouse()

	-- check if mouse is enabled
	if vim.o.mouse == 'a'
    then
		-- disable mouse
		vim.o.mouse =''
	else
		-- enable mouse everywhere
		 vim.o.mouse='a'
	end
end
--Retain the cursor position across the vim sessions
function M.ResCur()
  if vim.fn.line("'\"") <= vim.fn.line("$")
  then
    vim.cmd([[ normal! g`" ]])
    return 1
  end
end
 --function to search in range
function M.RangeSearch(direction)
  vim.fn.inputsave()
  vim.g.srchstr = vim.fn.input(direction)
  vim.fn.inputrestore()
  if vim.fn.strlen(vim.g.srchstr) > 0
 then
    vim.g.srchstr = vim.g.srchstr..'\\%>'..(vim.fn.line("'<")-1)..'l'.. '\\%<'..(vim.fn.line("'>")+1)..'l'
  else
    vim.g.srchstr = ''
  end
end

local opts = {noremap = true, silent = true}
M.map = function (mode,key,action,opt)
	vim.api.nvim_set_keymap(mode,key,action,opt or opts)
end
return M
