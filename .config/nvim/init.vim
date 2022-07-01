"_________________________________________
"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/
"_________________________________________

" Plugins
call plug#begin('~/.config/.vim/plugged')

" Git integration
    Plug 'mhinz/vim-signify'
" Themes
    Plug 'morhetz/gruvbox'
    Plug 'sainnhe/everforest'
    Plug 'sainnhe/sonokai'
    Plug 'dracula/vim'
" C++
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'rhysd/vim-clang-format'
    Plug 'derekwyatt/vim-fswitch'
" Latex
    Plug 'lervag/vimtex'
    Plug 'vim-latex/vim-latex'
" Other
    Plug 'SirVer/ultisnips'
    Plug 'preservim/nerdcommenter'                   " auto commenting
    Plug 'jiangmiao/auto-pairs'                      " auto pairs for '('
    Plug 'tmhedberg/SimpylFold'                      " folding
    Plug 'unblevable/quick-scope'                    " fast navigation in a line
    Plug 'easymotion/vim-easymotion'                 " navigation within a file
    Plug 'lilydjwg/colorizer'
    Plug 'ryanoasis/vim-devicons'

call plug#end()            " required
filetype plugin indent on  " required

" General settings
" turn off visual effects
set visualbell t_vd=
set belloff=all

" fast scrolling
set scrolljump=5

" split settings
set splitright
set splitbelow

" scheme and airline settings
set termguicolors
colorscheme gruvbox
set bg=dark

" encoding settings
set encoding=utf-8
set incsearch
set nohls

" text width
set textwidth=79

" spelling settings
set spelllang=en_us,ru
set spell
autocmd TermOpen * setlocal nospell

" russian keymap
set keymap=russian-jcukenwin
set iminsert=0

" hide panels
set guioptions-=T   " toolbar
set guioptions-=r   " right scrollbar
set guioptions-=L   " left scrollbar
set guioptions-=m   " menu

" change left column highlighting
set signcolumn=yes
au VimEnter * :hi CursorLineNr guibg=237
au VimEnter * :hi SignColumn guibg=237
au VimEnter * :hi SignifySignDelete guibg=237 guifg=#fb4934
au VimEnter * :hi SignifySignDeleteFirstLine guibg=237 guifg=#cc241d
au VimEnter * :hi SignifySignChange guibg=237 guifg=#fe8019
au VimEnter * :hi SignifySignAdd guibg=237 guifg=#b8bb26

" left column settings
set nu
set ruler
set relativenumber
set cursorline

" delete all trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

" saves folding in a file
autocmd BufWinLeave *.* silent! mkview
autocmd BufWinEnter *.* silent! loadview

" Python settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
let python_highlight_all=1
let g:run_cmd_python = ['python']
autocmd FileType python set foldmethod=expr
syntax on

" C++ settings
autocmd FileType cpp set foldmethod=indent
autocmd FileType cpp nmap <silent> <leader>h :FSHere<CR>
autocmd FileType cpp nmap <silent> <leader>sht :FSTab<CR>
autocmd FileType cpp nmap <silent> <leader>shl :FSSplitRight<CR>
autocmd FileType cpp nmap <silent> <leader>shh :FSSplitLeft<CR>
autocmd FileType cpp nmap <silent> <leader>shk :FSSplitAbove<CR>
autocmd FileType cpp nmap <silent> <leader>shj :FSSplitBelow<CR>

autocmd FileType c,cpp,objc nnoremap <leader>f :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <leader>f :ClangFormat<CR>

let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
            \ "BreakBeforeBraces" : "Allman"}

" Bash settings
autocmd FileType sh set foldmethod=indent

" Java settings
autocmd FileType java set foldmethod=indent

" Hot keys settings
map j gj
map k gk

" map adding blank line.
nnoremap <CR> m`o<Esc>``

imap Nop <Plug>IMAP_JumpForward nmap Nop <Plug>IMAP_JumpForward
nmap Nop <Plug>IMAP_JumpForward nmap Nop <Plug>IMAP_JumpForward
vmap Nop <Plug>IMAP_JumpForward

" split navigations
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

" exit terminal mode using <ESC>
tnoremap <C-d> <C-\><C-n>

" resize windows
nnoremap <silent> <C-M-j> :resize -2<CR>
nnoremap <silent> <C-M-k> :resize +2<CR>
nnoremap <silent> <C-M-l> :vertical resize -2<CR>
nnoremap <silent> <C-M-h> :vertical resize +2<CR>

" tab navigations
nnoremap <silent> <C-t> :tabnew<CR>
nnoremap <silent> <M-l> :tabnext<CR>
nnoremap <silent> <M-h> :tabprev<CR>
nnoremap <silent> <M-L> :tabm +1<CR>
nnoremap <silent> <M-H> :tabm -1<CR>
nnoremap <silent> <M-1> 1gt
nnoremap <silent> <M-2> 2gt
nnoremap <silent> <M-3> 3gt
nnoremap <silent> <M-4> 4gt
nnoremap <silent> <M-5> 5gt
nnoremap <silent> <M-6> 6gt
nnoremap <silent> <M-7> 7gt
nnoremap <silent> <M-8> 8gt
nnoremap <silent> <M-9> 9gt

" moving lines
xnoremap <silent> K :move '<-2<CR>gv-gv
xnoremap <silent> J :move '<+1<CR>gv-gv

" copy and paste to/from clipboard
noremap <leader>y "+y
noremap <leader>p "+p
noremap <leader>ay :%y+<CR>

" auto correcting in a line
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" fast replacements
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

" remove characters after '[n].'
nnoremap <silent> <leader>di :%s/\(\d\+\.\).*/\1/<CR>

" auto commenting setting
nnoremap <silent> <M-/> :call nerdcommenter#Comment(0,"toggle")<CR>
vnoremap <silent> <M-/> :call nerdcommenter#Comment(0,"toggle")<CR>

" change keymap to Russian
nnoremap <silent> <M-r> :set iminsert=1<CR>
" change keymap to English
nnoremap <silent> <M-e> :set iminsert=0<CR>

" run python code using <C-R>
autocmd FileType python map <buffer> <F9> :w<CR>:sp<CR>:exec 'term python' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:sp<CR>:exec 'term python' shellescape(@%, 1)<CR>

" compile C++ file using <F9>. Run using <F10>
autocmd FileType cpp map <buffer> <F8> :w<CR>:!g++ -std=c++17 -Wshadow -Wall -O2 -o %:r %<CR>
autocmd FileType cpp map <buffer> <F9> :w<CR>:!g++ -std=c++17 -Wshadow -Wall -g -fsanitize=address -fsanitize=undefined -o %:r %<CR>
autocmd FileType cpp map <buffer> <F10> :sp<CR>:term ./%:r<CR>

" compile C file using <F9>. Run using <F10>
autocmd FileType c map <buffer> <F8> :w<CR>:!g++ -Wshadow -Wall -O2 -o %:r %<CR>
autocmd FileType c map <buffer> <F9> :w<CR>:!g++ -Wshadow -Wall -g -fsanitize=address -fsanitize=undefined -o %:r %<CR>
autocmd FileType c map <buffer> <F10> :sp<CR>:term ./%:r<CR>

" compile java file using <F9>. Run using <F10>
autocmd FileType java map <buffer> <F9> :w<CR>:sp<CR>:exec 'term javac -Xlint' shellescape(@%, 1)<CR>
autocmd FileType java map <buffer> <F10> :sp<CR>:exec 'term java' shellescape(expand("%:r"))<CR>

" compile pascal file using <F9>. Run using <F10>
autocmd FileType pascal map <buffer> <F9> :w<CR>:sp<CR>:exec 'term fpc ' shellescape(@%, 1)<CR>
autocmd FileType pascal map <buffer> <F10> :sp<CR>:term ./%:r<CR>

" run .m file using <F9>
autocmd FileType matlab map <buffer> <F9> :w<CR>:sp<CR>:exec 'term octave' shellescape(@%, 1)<CR>

" compile and open LaTex document
autocmd FileType plaintex map <buffer> <F9> :w<CR>:sp<CR>:exec 'term pdflatex' shellescape(@%, 1)<CR>
autocmd FileType plaintex map <buffer> <F10> :sp<CR>:terminal zathura %:r.pdf<CR>:q<CR>
autocmd FileType tex map <buffer> <F9> :w<CR>:sp<CR>:exec 'term pdflatex' shellescape(@%, 1)<CR>
autocmd FileType tex map <buffer> <F10> :sp<CR>:terminal zathura %:r.pdf<CR>:q<CR>

" run bash script
autocmd FileType sh map <buffer> <F9> :sp<CR>:term ./%<CR>

map :W <Nop>

" Statusline settings.
function MyStatusLine()
    "hi NormalColor guibg=#a7c080 guifg=#2b3339
    "hi InsertColor guibg=#7fbbb3 guifg=#2b3339
    "hi ReplaceColor guibg=#e68183 guifg=#2b3339
    "hi VisualColor guibg=#d699b6 guifg=#2b3339
    "hi BgColor guibg=#404c51
    hi NormalColor guibg=#fe8019 guifg=#282828
    hi InsertColor guibg=#b8bb26 guifg=#282828
    hi ReplaceColor guibg=#fb4934 guifg=#282828
    hi VisualColor guibg=#d3869b guifg=#282828
    hi BgColor guibg=#504945

    set statusline=
    set statusline+=%#NormalColor#%{(mode()=='n')?'\ \ NORMAL\ ':''}
    set statusline+=%#InsertColor#%{(mode()=='i')?'\ \ INSERT\ ':''}
    set statusline+=%#ReplaceColor#%{(mode()=='R')?'\ \ REPLACE\ ':''}
    set statusline+=%#ReplaceColor#%{(mode()=='Rv')?'\ \ V-REPLACE\ ':''}
    set statusline+=%#VisualColor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
    set statusline+=%#VisualColor#%{(mode()=='V')?'\ \ V-LINE\ ':''}
    let &statusline.='%#VisualColor#%{(mode()=="\<C-V>")?"\ \ V-BLOCK\ ":""}'
    set statusline+=%#InsertColor#%{(mode()=='c')?'\ \ COMMAND\ ':''}
    set statusline+=%#InsertColor#%{(mode()=='t')?'\ \ TERMINAL\ ':''}
    set statusline+=%#BgColor#%{''}

    set statusline+=\ %<%f\ \|
    set statusline+=%{strlen(&filetype)?'\ '.WebDevIconsGetFileTypeSymbol().'\ '.&filetype.'\ \|':''}
    "set statusline+=\ %{strlen(FugitiveHead())?'\ '.FugitiveHead().'\ \|\ ':''}
    set statusline+=%=
    set statusline+=%-8.(%l,%c%V%)
    set statusline+=\ %-4L
    set statusline+=\ %-4P
endfunction

set laststatus=2
call MyStatusLine()

" Tabline settings
function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let fname = fnamemodify(bufname(buflist[winnr - 1]), ":p:.")
  if len(fname) != 0
      return fname
  endif
  return "[Нет имени]"
endfunction

function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999X'
  endif

  return s
endfunction

set tabline=%!MyTabLine()

" Git settings.
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

" I find the numbers disctracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1

" Jump though hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gJ
nmap <leader>gK 9999<leader>gk

" Quick-scope settings.
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" gruvbox
highlight QuickScopePrimary guifg='#83a598' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#8ec07c' gui=underline ctermfg=81 cterm=underline

let g:qs_max_chars=150

" LaTeX settings
let g:vimtex_fold_enabled=1
let g:vimtex_fold_manual=1
let g:tex_flavor='latex'
let g:vimtex_view_method='mupdf'

" Ultisnips
let g:UltiSnipsExpandTrigger="<M-Tab>"
let g:UltiSnipsJumpForwardTrigger="<M-j>"
let g:UltiSnipsJumpBackwardTrigger="<M-k>"

" Sources
"source $XDG_CONFIG_HOME/nvim/coc.vim
