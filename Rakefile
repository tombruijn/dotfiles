require 'rake'
require 'erb'

HOME        = ENV['HOME']
CURRENT_DIR = Dir.pwd
BASH_DIR    = HOME + "/Bash"

desc "Installs my environment on this machine."
task :install do
  # Removes Bash Directory if it exists
  if File.directory?(BASH_DIR)
    %x(rm -rf #{BASH_DIR})
  end
  
  # Creates Bash Directory in $HOME
  %x(mkdir -p #{BASH_DIR}/dotfiles #{BASH_DIR}/bin)
  
  # Copy Bashrc file
  %x(cp #{CURRENT_DIR}/bashrc #{BASH_DIR}/bashrc)
  
  # Copy all dotfiles
  Dir.open("#{CURRENT_DIR}/dotfiles").each do |file|
    unless File.directory?("#{CURRENT_DIR}/dotfiles/#{file}")
      %x(cp #{CURRENT_DIR}/dotfiles/#{file} #{BASH_DIR}/dotfiles/#{file})
    end
  end
  
  # Backup the current ~/.profile if it exists
  if File.exist?("#{HOME}/.profile")
    %x(cp #{HOME}/.bashrc #{HOME}/.bashrc.backup.#{Time.now.strftime("%Y-%m-%d-%H-%M-%S")})
  end
  
  # Append the Bash source to the .profile in the $HOME directory
  #File.open("#{HOME}/.bashrc", "w") { |file| file << 'source ~/Bash/bashrc' }
  %x(echo '\n\nsource ~/Bash/bashrc' >> #{HOME}/.bashrc)
  
  # Tell user to reload the shell configuration
  puts "\n\nInstalled! Now run the following command to reload the configuration:"
  puts "source ~/.bashrc\n\n"
end