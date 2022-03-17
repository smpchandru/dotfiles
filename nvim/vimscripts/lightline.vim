let g:lightline = {
\   'colorscheme': 'seoul256',
\   'mode_map': {
\   'n' : "\u24C3",
\   'i' : "\u24BE",
\   'R' : "\u24C7",
\   'v' : "\u24E5",
\   'V' : 'VL',
\   "\<C-v>": 'VB',
\   'c' : "\u24B8",
\   's' : "\u24C8",
\   'S' : 'SL',
\   "\<C-s>": 'SB',
\   't': "\u24C9",
\   },
\   'active': {
\    'left' :[[ 'mode', 'paste' ],['gitbranch'],
\             [ 'readonly', 'filename', 'modified' ]],
\    'right':[[ 'percent', 'lineinfo' ]]
\   },
\   'tabline': {
\     'left': [['buffers']],
\     'right': [['smarttabs']]
\   },
\   'separator': {
\     'left': '', 'right': ''
\   },
\   'subseparator': {
\     'left': '', 'right': ''
\   },
\   'component_raw': {
\     'buffers': 1
\   },
\   'component_function': {
\     'percent': 'LightlinePercent',
\     'lineinfo': 'LightlineLineinfo',
\     'filename': 'LightlineFilename',
\     'fullname': 'LightlineFullname',
\     'mode': 'LightlineMode',
\     'gitbranch': 'LightlineGitbranch',
\     'readonly': 'LightlineReadonly',
\     'modified': 'LightlineModified',
\     'cocstatus': 'LightlineCoc',
\     'method': 'NearestMethodOrFunction'
\   },
\   'component_expand': {
\     'buffers': 'lightline#bufferline#buffers',
\     'smarttabs': 'SmartTabsIndicator',
\     'trailing': 'lightline#trailing_whitespace#component'
\   },
\   'component_type': {
\     'buffers': 'tabsel',
\     'trailing': 'warning'
\   }
\}


let g:lightline#bufferline#clickable=1
let g:lightline#bufferline#shorten_path=1
let g:lightline#bufferline#min_buffer_count=1
let g:lightline#bufferline#show_number = 2
set showtabline=2
let g:lightline#bufferline#unnamed = 'No Name'
let g:lightline#bufferline#filename_modifier= ':.'
let g:lightline#bufferline#more_buffers = '...'
let g:lightline#bufferline#modified = ' ●'
let g:lightline#bufferline#read_only = ' '
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#clickable = 1
"let g:lightline#bufferline#auto_hide = 4000
"let g:lightline#bufferline#number_map = {
"\ 0: '₀', 1: '1', 2: '₂', 3: '₃', 4: '₄',
"\ 5: '₅', 6: '₆', 7: '₇', 8: '₈', 9: '₉'}
"let g:lightline#bufferline#number_map = {
"\ 0: '⁰', 1: "\u2460", 2: '²', 3: '³', 4: '⁴',
"\ 5: '⁵', 6: '⁶', 7: '⁷', 8: '⁸', 9: '⁹'}
"let g:lightline#bufferline#number_map = {
"\ 0: "\u2469", 1: "\u2460", 2: "\u2461", 3: "\u2462",4: "\u2463",
"\ 5: "\u2464", 6: "\u2465", 7: "\u2466", 8: "\u2467", 9: "\u2468",
"\ 10: "\u2469", 11: "\u246A", 12: "\u246B", 13: "\u246C", 14: "\u246D",
"\ 15: "\u246E", 16: "\u246F", 17: "\u2470", 18: "\u2471", 19: "\u2472",20:"\u2473"}
let g:lightline#bufferline#composed_number_map = {
\ 0: "\u2469", 1: "\u2460", 2: "\u2461", 3: "\u2462",4: "\u2463",
\ 5: "\u2464", 6: "\u2465", 7: "\u2466", 8: "\u2467", 9: "\u2468",
\ 10: "\u2469", 11: "\u246A", 12: "\u246B", 13: "\u246C", 14: "\u246D",
\ 15: "\u246E", 16: "\u246F", 17: "\u2470", 18: "\u2471", 19: "\u2472",20:"\u2473"}
"let g:lightline#bufferline#composed_number_map = {
"\ 0: "\u2776", 1: "\u2776", 2: "\u2777", 3: "\u2778",4: "\u2779",
"\ 5: "\u277A", 6: "\u277B", 7: "\u277C", 8: "\u277D", 9: "\u277E",
"\ 10: "\u277F", 11: "\u24EB", 12: "\u24EC", 13: "\u24ED", 14: "\u24EE",
"\ 15: "\u24EF", 16: "\u24F0", 17: "\u24F1", 18: "\u24F2", 19: "\u24F3",20:"\u24F4"}
nmap <A-1> <Plug>lightline#bufferline#go(1)
nmap <A-2> <Plug>lightline#bufferline#go(2)
nmap <A-3> <Plug>lightline#bufferline#go(3)
nmap <A-4> <Plug>lightline#bufferline#go(4)
nmap <A-5> <Plug>lightline#bufferline#go(5)
nmap <A-6> <Plug>lightline#bufferline#go(6)
nmap <A-7> <Plug>lightline#bufferline#go(7)
nmap <A-8> <Plug>lightline#bufferline#go(8)
nmap <A-9> <Plug>lightline#bufferline#go(9)
nmap <A-0> <Plug>lightline#bufferline#go(10)
nmap <Leader>c1 <Plug>lightline#bufferline#delete(1)
nmap <Leader>c2 <Plug>lightline#bufferline#delete(2)
nmap <Leader>c3 <Plug>lightline#bufferline#delete(3)
nmap <Leader>c4 <Plug>lightline#bufferline#delete(4)
nmap <Leader>c5 <Plug>lightline#bufferline#delete(5)
nmap <Leader>c6 <Plug>lightline#bufferline#delete(6)
nmap <Leader>c7 <Plug>lightline#bufferline#delete(7)
nmap <Leader>c8 <Plug>lightline#bufferline#delete(8)
nmap <Leader>c9 <Plug>lightline#bufferline#delete(9)
nmap <Leader>c0 <Plug>lightline#bufferline#delete(10)
function! s:trim(maxlen, str) abort
    let trimed = len(a:str) > a:maxlen ? a:str[0:a:maxlen] . '..' : a:str
    return trimed
endfunction

function! LightlineCoc() abort
    if winwidth(0) < 60
        return ''
    endif

    return coc#status()
endfunction
function! LightlinePercent() abort
    if winwidth(0) < 60
        return ''
    endif

    let l:percent = line('.') * 100 / line('$') . '%'
    return printf('%-4s', l:percent)
endfunction
function! LightlineLineinfo() abort
    if winwidth(0) < 86
        return ''
    endif

    let l:current_line = printf('%-3s', line('.'))
    let l:max_line = printf('%-3s', line('$'))
    let l:lineinfo = ' ' . l:current_line . '/' . l:max_line
    return l:lineinfo
endfunction

function! LightlineFilename() abort
    let l:prefix = expand('%:p') =~? "fugitive://" ? '(fugitive) ' : ''
    let l:maxlen = winwidth(0) - winwidth(0) / 2
    let l:relative = expand('%:.')
    let l:tail = expand('%:t')
    let l:noname = 'No Name'

    if winwidth(0) < 50
        return ''
    endif

    if winwidth(0) < 86
        return l:tail ==# '' ? l:noname : l:prefix . s:trim(l:maxlen, l:tail)
    endif

    return l:relative ==# '' ? l:noname : l:prefix . s:trim(l:maxlen, l:relative)
endfunction

function! LightlineFullname() abort
    let l:relative = expand('%')

    return l:relative
endfunction

function! LightlineModified() abort

    return &modified ? '●' : ''
endfunction

function! LightlineMode() abort
    let ftmap = {
                \ 'coc-explorer': 'EXPLORER',
                \ 'fugitive': 'FUGITIVE',
                \ 'vista': 'OUTLINE'
                \ }
    return get(ftmap, &filetype, lightline#mode())
endfunction

function! LightlineReadonly() abort
    let ftmap = {
                \ 'coc-explorer': '',
                \ 'fugitive': '',
                \ 'vista': ''
                \ }
    let l:char = get(ftmap, &filetype, '')
    return &readonly ? l:char : ''
endfunction

function! LightlineGitbranch() abort
    if exists('*fugitive#head')
        let maxlen = 20
        let branch = fugitive#head()
        return branch !=# '' ? ' '. s:trim(maxlen, branch) : ''
    endif
    return fugitive#head()
endfunction


function! String2()
    return 'BUFFERS'
endfunction

function! SmartTabsIndicator() abort
    let tabs = lightline#tab#tabnum(tabpagenr())
    let tab_total = tabpagenr('$')
    return tabpagenr('$') > 1 ? ('TABS ' . tabs . '/' . tab_total) : ''
endfunction


" autoreload
command! LightlineReload call LightlineReload()
"call lightline#explorer_pad#init()

function! LightlineReload() abort
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
endfunction
let g:lightline#trailing_whitespace#indicator = ''
