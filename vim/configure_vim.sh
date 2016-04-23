mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim &&
cd ~/.vim/bundle && git clone git://github.com/altercation/vim-colors-solarized.git &&
git clone https://github.com/scrooloose/nerdtree.git &&
git clone git://github.com/tpope/vim-rails.git && git clone git://github.com/tpope/vim-bundler.git &&
git clone https://github.com/kien/ctrlp.vim.git &&
git clone git://github.com/tpope/vim-endwise.git && 
git clone git://github.com/tpope/vim-commentary.git &&
git clone https://github.com/vim-ruby/vim-ruby.git &&
git clone https://github.com/ervandew/supertab.git &&
git clone https://github.com/gregsexton/MatchTag.git &&
git clone https://github.com/vim-scripts/delimitMate.vim.git &&
git clone git://github.com/tpope/vim-fugitive.git && vim -u NONE -c "helptags vim-fugitive/doc" -c q &&
git clone https://github.com/scrooloose/syntastic.git &&
git clone https://github.com/bling/vim-airline &&
git clone https://github.com/tomtom/tlib_vim.git &&
git clone https://github.com/MarcWeber/vim-addon-mw-utils.git &&
git clone https://github.com/garbas/vim-snipmate.git &&
git clone https://github.com/honza/vim-snippets.git &&
git clone https://github.com/elzr/vim-json.git &&
git clone https://github.com/sjl/gundo.vim &&
git clone https://github.com/leafgarland/typescript-vim.git 