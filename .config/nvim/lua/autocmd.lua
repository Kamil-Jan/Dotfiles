vim.cmd [[
    " Change left column highlighting
    autocmd VimEnter * :hi CursorLineNr guibg=237
    autocmd VimEnter * :hi SignColumn guibg=237
    autocmd VimEnter * :hi SignifySignDelete guibg=237 guifg=#fb4934
    autocmd VimEnter * :hi SignifySignDeleteFirstLine guibg=237 guifg=#cc241d
    autocmd VimEnter * :hi SignifySignChange guibg=237 guifg=#fe8019
    autocmd VimEnter * :hi SignifySignAdd guibg=237 guifg=#b8bb26

    " Delete all trailing whitespaces on save
    autocmd BufWritePre * %s/\s\+$//e

    " C++ settings
    autocmd FileType cpp nmap <silent> <leader>h :FSHere<CR>
    autocmd FileType cpp nmap <silent> <leader>sht :FSTab<CR>
    autocmd FileType cpp nmap <silent> <leader>shl :FSSplitRight<CR>
    autocmd FileType cpp nmap <silent> <leader>shh :FSSplitLeft<CR>
    autocmd FileType cpp nmap <silent> <leader>shk :FSSplitAbove<CR>
    autocmd FileType cpp nmap <silent> <leader>shj :FSSplitBelow<CR>

    autocmd FileType c,cpp,objc nnoremap <leader>f :<C-u>ClangFormat<CR>
    autocmd FileType c,cpp,objc vnoremap <leader>f :ClangFormat<CR>

    " Run python code using <F9>
    autocmd FileType python map <buffer> <F9> :w<CR>:sp<CR>:exec 'term python' shellescape(@%, 1)<CR>
    autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:sp<CR>:exec 'term python' shellescape(@%, 1)<CR>

    " Compile C++ file using <F9>. Run using <F10>
    autocmd FileType cpp map <buffer> <F8> :w<CR>:!g++ -std=c++17 -Wshadow -Wall -O2 -o %:r %<CR>
    autocmd FileType cpp map <buffer> <F9> :w<CR>:!g++ -std=c++17 -Wshadow -Wall -g -fsanitize=address -fsanitize=undefined -o %:r %<CR>
    autocmd FileType cpp map <buffer> <F10> :sp<CR>:term ./%:r<CR>

    " Compile C file using <F9>. Run using <F10>
    autocmd FileType c map <buffer> <F8> :w<CR>:!g++ -Wshadow -Wall -O2 -o %:r %<CR>
    autocmd FileType c map <buffer> <F9> :w<CR>:!g++ -Wshadow -Wall -g -fsanitize=address -fsanitize=undefined -o %:r %<CR>
    autocmd FileType c map <buffer> <F10> :sp<CR>:term ./%:r<CR>

    " Compile Java file using <F9>. Run using <F10>
    autocmd FileType java map <buffer> <F9> :w<CR>:sp<CR>:exec 'term javac -Xlint' shellescape(@%, 1)<CR>
    autocmd FileType java map <buffer> <F10> :sp<CR>:exec 'term java' shellescape(expand("%:r"))<CR>

    " Compile Pascal file using <F9>. Run using <F10>
    autocmd FileType pascal map <buffer> <F9> :w<CR>:sp<CR>:exec 'term fpc ' shellescape(@%, 1)<CR>
    autocmd FileType pascal map <buffer> <F10> :sp<CR>:term ./%:r<CR>

    " Compile and open LaTex document
    autocmd FileType plaintex map <buffer> <F9> :w<CR>:sp<CR>:exec 'term pdflatex' shellescape(@%, 1)<CR>
    autocmd FileType plaintex map <buffer> <F10> :sp<CR>:terminal zathura %:r.pdf<CR>:q<CR>
    autocmd FileType tex map <buffer> <F9> :w<CR>:sp<CR>:exec 'term pdflatex' shellescape(@%, 1)<CR>
    autocmd FileType tex map <buffer> <F10> :sp<CR>:terminal zathura %:r.pdf<CR>:q<CR>

    " Run bash script
    autocmd FileType sh map <buffer> <F9> :sp<CR>:term ./%<CR>
]]

