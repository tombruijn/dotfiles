require 'rake'
require 'erb'

HOME          = ENV['HOME']
CURRENT_DIR   = Dir.pwd
TERMINAL_FROM = "terminal"
TERMINAL_TO   = "#{HOME}/#{TERMINAL_FROM}"
BASH_PROFILE  = ".bash_profile"
BASH_TO       = "#{HOME}/#{BASH_PROFILE}"

desc "Install Tom de Bruijn's environment on this machine"
task :install do
  remove_terminal_files
  install_terminal_files

  setup_bash_profile
  setup_git

  # Tell user to reload the shell configuration
  puts "\nTom de Bruijn's dotfiles are installed!\n"
  puts "Now run the following command to reload the configuration:"
  puts "  source ~/#{BASH_PROFILE}\n\n"
  puts "or (if you're applying an update):"
  puts "  reload\n"
end

def remove_terminal_files
  if File.directory?(TERMINAL_TO)
    %x(rm -rf #{TERMINAL_TO})
  end
end

def install_terminal_files
  %x(cp -R #{CURRENT_DIR}/#{TERMINAL_FROM} #{HOME})
end

def setup_git
  %x(git config --global user.email "tom@tomdebruijn.com")
  %x(git config --global user.name "Tom de Bruijn")

  %x(cp -f #{CURRENT_DIR}/.gitignore_global #{HOME}/.gitignore_global)
  %x(git config --global core.excludesfile #{HOME}/.gitignore_global)
end

def setup_bash_profile
  # Append the source to the existing profile file
  unless File.open(BASH_TO).read =~ /source ~\/#{TERMINAL_FROM}/
    backup_bash_profile
    %x(echo '\n\nsource ~/#{TERMINAL_FROM}/.bash' >> #{BASH_TO}\n)
  end
end

def backup_bash_profile
  if File.exist?(BASH_TO)
    %x(cp #{BASH_TO} #{BASH_TO}.backup.#{Time.now.strftime("%Y-%m-%d-%H-%M-%S")})
  end
end
