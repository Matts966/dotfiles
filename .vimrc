scriptencoding utf-8
set encoding=utf-8
"--------------------------------------------------------------------------
" neobundle
set runtimepath+=/Users/masahiro.matsui/.vim/bundle/neobundle.vim/

set nocompatible               " Be iMproved
filetype off                   " Required!

"# if has('vim_starting')
"#   set runtimepath+=/Users/masahiro.matsui/.vim/bundle/neobundle.vim/
"# endif

call neobundle#begin(expand('/Users/masahiro.matsui/.vim/bundle/'))

" NeoBundle 'thinca/vim-quickrun'
" let g:quickrun_config = {'*': {'hook/time/enable': '1'},}

" lightline
NeoBundle 'itchyny/lightline.vim'

" Nerdtree
NeoBundle 'scrooloose/nerdtree'
" 隠しファイルを表示する
let NERDTreeShowHidden = 1
nnoremap <silent><C-e> :NERDTree<CR>
" デフォルトでツリーを表示させる
let g:nerdtree_tabs_open_on_console_startup=1
" 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete.vim'

"カラースキームをインストール
NeoBundle 'KKPMW/moonshine-vim'
NeoBundle 'lu-ren/SerialExperimentsLain'
"Jedi-Vim
NeoBundle 'davidhalter/jedi-vim'

call neobundle#end()

" 背景色をデフォルトに揃える。colorschemeより前に記述.
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
"色系はここに
"colorscheme moonshine 
colorscheme SerialExperimentsLain 
"
set background=dark 
set t_Co=256

filetype plugin indent on     " Required!

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif

if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif

"------------------------------------
" neocomplete.vim
"------------------------------------
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" setting
"カーソルを常に画面の中央に表示させる
"set scrolloff=999
"行末行頭での移動を可能に
set whichwrap=b,s,h,l<,>,[,],~
"クリップボード（選択だけでコピーしてしまうので注意）
set clipboard=unnamedplus,autoselect
"Deleteを有効に
set backspace=indent,eol,start
" マウスを使う
set mouse=a
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd

"ウインドウタイトルを設定する
set title


" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=all
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk



set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
"TAB,EOFなどを可視化する
set list
set listchars=tab:>-,extends:<,trail:-,eol:<



" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示

syntax on 

"自動文字数カウント
augroup WordCount
	autocmd!
	autocmd BufWinEnter,InsertLeave,CursorHold * call WordCount('char')
augroup END
let s:WordCountStr = ''
let s:WordCountDict = {'word': 2, 'char': 3, 'byte': 4}
function! WordCount(...)
	if a:0 == 0
		return s:WordCountStr
	endif
	let cidx = 3
	silent! let cidx = s:WordCountDict[a:1]
	let s:WordCountStr = ''
	let s:saved_status = v:statusmsg
	exec "silent normal! g\<c-g>"
	if v:statusmsg !~ '^--'
		let str = ''
		silent! let str = split(v:statusmsg, ';')[cidx]
		let cur = str2nr(matchstr(str, '\d\+'))
		let end = str2nr(matchstr(str, '\d\+\s*$'))
		if a:1 == 'char'
			" ここで(改行コード数*改行コードサイズ)を'g<C-g>'の文字数から引く
			let cr = &ff == 'dos' ? 2 : 1
			let cur -= cr * (line('.') - 1)
			let end -= cr * line('$')
		endif
		let s:WordCountStr = printf('%d/%d', cur, end)
	endif
	let v:statusmsg = s:saved_status
	return s:WordCountStr
endfunction

"ステータスラインにコマンドを表示
set showcmd
"ステータスラインを常に表示
set laststatus=2

" Set 256 colors
let s:saved_t_Co=&t_Co
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" Restore t_Co for less command after vim quit
augroup restore_t_Co
  autocmd!
  if s:saved_t_Co == 8
    autocmd VimLeave * let &t_Co = 256
  else
    autocmd VimLeave * let &t_Co = 8
  endif
  autocmd VimLeave * let &t_Co = s:saved_t_Co
augroup END

