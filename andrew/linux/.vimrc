" Begin .vimrc

set hidden
set nowrap

"make % check for ifs
runtime macros/matchit.vim

"use fullcolors
if ! has("gui_running")
  set t_Co=256
endif
set background=dark
colors wombat256mod

set wildmenu
set wildmode=list:longest

"set Tab Space to 2
set ts=2
set shiftwidth=2
set expandtab

"make the title show up as the terminal title
set title

"scroll the page when 3 lines from the bottom
set scrolloff=3

"keep all swap files in a single folder
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

"scroll the viewport by 3 lines on ctr-e and ctr-y
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-e>

"set filetype detection, syntax highlighting, and auto-indent
syntax on
filetype on
filetype plugin on
filetype indent on


if has("autocmd")
	"setup drupal files to use php highlighting and to inclue drupal specific
	"settings
	augroup module
		autocmd BufRead,BufNewFile *.module set filetype=php
		autocmd BufRead,BufNewFile *.install set filetype=php
		autocmd BufRead,BufNewFile *.test set filetype=php

		autocmd BufRead,BufNewFile *.inc source ~/.vim/drupal.vim
		autocmd BufRead,BufNewFile *.module source ~/.vim/drupal.vim
		autocmd BufRead,BufNewFile *.install source ~/.vim/drupal.vim
		autocmd BufRead,BufNewFile *.test source ~/.vim/drupal.vim
	augroup END
endif

"use the visual bell instead of audio
set visualbell

"online document search
function! OnlineDoc()
	if &ft =~ "ruby"
		let s:urlTemplate = "http://www.railsapi.com/doc/rails-v3.0.3_ruby-v1.9.2/?q=%"
	else
		return
	endif
	let s:wordUnderCursor = expand("<cword>")
	let s:url = substitute(s:urlTemplate, "%", s:wordUnderCursor, "g")
	let s:cmd = "silent !google-chrome " . s:url
	execute s:cmd
endfunction

map <silent> <leader>d :call OnlineDoc()<CR>


" End .vimrc
