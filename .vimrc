set number
set relativenumber
set shiftwidth=4
set tabstop=4
set expandtab
set nobackup
set nowrap
set incsearch
set ignorecase
set smartcase
set showcmd
set showmode
set showmatch
set hlsearch
set history=1000
set nocompatible

filetype on
filetype plugin on
filetype indent on
syntax on

noremap <Space>pv :Exp<cr>
map! <c-c> <Esc>
noremap <tab> <cmd>bNext<cr>
noremap <S-tab> <cmd>bprevious<cr>

noremap <tab> <cmd>bNext<cr>
noremap <S-tab> <cmd>bprevious<cr>

let g:netrw_banner=0

"let g:netrw_liststyle=3
call plug#begin('~/.vim/plugged')

Plug 'nvim-lua/plenary.nvim', { 'dir': '~/.local/share/nvim/lazy/plenary.nvim' }
Plug 'nvim-telescope/telescope.nvim', { 'dir': '~/.local/share/nvim/lazy/telescope.nvim' }

call plug#end()

" Find files using Telescope command-line sugar.
" nnoremap <Space>pf <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <Space>pg <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <Space>pb <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <Space>ph <cmd>lua require('telescope.builtin').help_tags()<cr>

