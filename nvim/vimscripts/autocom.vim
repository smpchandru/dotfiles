" All cutocommands
" autogroups/commands
augroup numbertoggle
				autocmd!
				autocmd BufEnter,FocusGained,InsertLeave * set nu rnu
				autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
" traverse back git object
autocmd User fugitive 
												\ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
												\ nnoremap <buffer> <C-o> ..  :edit %:h<CR>
												\ endif
" ===== fugutive setting for close buffer once leave
autocmd BufReadPost fugitive://* set bufhidden=delete
set textwidth=0
" python indenting
au BufNewFile,BufRead *.py call SetPythonIndent()
" fomat c and c++ file using COC plugin
au! BufWritePost,BufEnter  *.{c,cpp,cc,h,hpp} call SetCCIndent()
" restore line cursors
set conceallevel=3
"yaml settings
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
" Syntax highlight for Jenkinsfile
hi! link GitLens GitLens
hi GitLens ctermfg=grey

