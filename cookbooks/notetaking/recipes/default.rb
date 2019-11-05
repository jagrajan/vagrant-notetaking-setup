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
package 'python-neovim'
package 'python3-neovim'
package 'python-pip'
package 'python3-pip'

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

cookbook_file 'profile' do
  owner 'vagrant'
  path '/home/vagrant/.profile'
end

cookbook_file 'fd.deb' do
  path '/home/vagrant/fd.deb'
end

execute 'sudo dpkg -i /home/vagrant/fd.deb'

execute 'curl -fLo /home/vagrant/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' do
  user 'vagrant'
end
execute 'pip install pynvim'
execute 'pip3 install pynvim'
