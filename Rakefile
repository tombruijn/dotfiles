require 'rake'
require 'erb'

HOME        = ENV['HOME']
CURRENT_DIR = Dir.pwd
DOT_DIR     = HOME + "/dotfiles"
BASH_FILE   = ".bash_login"

desc "Installs my environment on this machine."
task :install do
  # Removes dotfiles directory if it exists
  if File.directory?(DOT_DIR)
    %x(rm -rf #{DOT_DIR})
  end
  
  # Creates dotfiles directory in $HOME
  %x(mkdir -p #{DOT_DIR})
  
  # Copy all dotfiles
  Dir.open("#{CURRENT_DIR}/dotfiles").each do |file|
    unless File.directory?("#{CURRENT_DIR}/dotfiles/#{file}")
      %x(cp #{CURRENT_DIR}/dotfiles/#{file} #{DOT_DIR}/#{file})
    end
  end
  
  # Backup the current profile file if it exists
  if File.exist?("#{HOME}/#{BASH_FILE}")
    %x(cp #{HOME}/#{BASH_FILE} #{HOME}/#{BASH_FILE}.backup.#{Time.now.strftime("%Y-%m-%d-%H-%M-%S")})
  end
  
  # Append the source to the profile file in the $HOME directory
  found = false
  File.open("#{HOME}/#{BASH_FILE}") do |file|
    file.each_line do |line|
      if line =~ /source ~\/dotfiles/
        found = true
      end
   end
  end
  
  if not found
    puts %x(echo '\n\nsource ~/dotfiles/.bash' >> #{HOME}/#{BASH_FILE})
  end
  
  # Tell user to reload the shell configuration
  puts "\n\nInstalled! Now run the following command to reload the configuration:"
  puts "source ~/#{BASH_FILE}\n\n"
end
