#
# Cookbook:: notetaking
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

apt_update 'Update the apt cache daily' do
  frequency 86_400
  action :periodic
end

package 'vim'
package 'tmux'
package 'texlive-latex-extra'

cookbook_file 'vimrc' do
  owner 'vagrant'
  path '/home/vagrant/.vimrc'
end

cookbook_file 'tmux.conf' do
  owner 'vagrant'
  path '/home/vagrant/.tmux.conf'
end
