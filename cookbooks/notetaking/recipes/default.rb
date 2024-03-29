#
# Cookbook:: notetaking
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

apt_repository 'neovim-ppa' do
  uri 'ppa:neovim-ppa/stable'
end

apt_update 'update'

package 'vim'
package 'tmux'
package 'texlive-latex-extra'
package 'neovim'
package 'python3-neovim'
package 'python3-pip'
package 'pandoc'
package 'ctags'
package 'ack-grep'

execute 'mkdir -p /home/vagrant/.config/nvim' do
  user 'vagrant'
end
cookbook_file 'vimrc' do
  owner 'vagrant'
  path '/home/vagrant/.config/nvim/init.vim'
end

cookbook_file 'tmux.conf' do
  owner 'vagrant'
  path '/home/vagrant/.tmux.conf'
end

cookbook_file 'bash_aliases' do
  owner 'vagrant'
  path '/home/vagrant/.bash_aliases'
end

cookbook_file 'nvim.appimage' do
  mode '0755'
  owner 'vagrant'
  path '/home/vagrant/nvim.appimage'
end

cookbook_file 'bashrc' do
  owner 'vagrant'
  path '/home/vagrant/.bashrc'
end

cookbook_file 'fd.deb' do
  path '/home/vagrant/fd.deb'
end

execute 'sudo dpkg -i /home/vagrant/fd.deb'

execute 'curl -fLo /home/vagrant/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' do
  user 'vagrant'
end
execute 'pip3 install pynvim'
execute 'pip3 install neovim-remote'
execute 'dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep'
directory '/home/vagrant/.pandoc/templates' do
  recursive true
  action :create
end

cookbook_file 'template.tex' do
  path '/home/vagrant/.pandoc/templates/template.tex'
end
