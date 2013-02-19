require 'rake'
require 'erb'

HOME          = "~/"
CURRENT_DIR   = Dir.pwd
TERMINAL_FROM = "terminal"
TERMINAL_TO   = "#{HOME}#{TERMINAL_FROM}"
BASH_PROFILE  = ".bash_profile"
BASH_TO       = "#{HOME}#{BASH_PROFILE}"

desc "Install Tom de Bruijn's environment on this machine"
task :install do
  remove_terminal_files
  install_terminal_files

  setup_bash_profile
  setup_git
  setup_sublime

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
  %x(git config --global color.diff always)

  %x(cp -f #{CURRENT_DIR}/.gitignore_global #{HOME}.gitignore_global)
  %x(git config --global core.excludesfile #{HOME}.gitignore_global)
end

def setup_bash_profile
  profile_content = File.exists?(BASH_TO) ? File.open(BASH_TO).read : ""

  login_missing = (profile_content =~ /source #{HOME}.bash_login/).nil?
  bash_missing = (profile_content =~ /source #{HOME}#{TERMINAL_FROM}/).nil?

  backup_bash_profile if login_missing || bash_missing

  %x(echo '\n\nsource #{HOME}.bash_login' >> #{BASH_TO}\n) if login_missing
  %x(echo '\n\nsource #{HOME}#{TERMINAL_FROM}/.bash' >> #{BASH_TO}\n) if bash_missing
end

def backup_bash_profile
  if File.exist?(BASH_TO)
    %x(cp #{BASH_TO} #{BASH_TO}.backup.#{Time.now.strftime("%Y-%m-%d-%H-%M-%S")})
  end
end

def setup_sublime
  %x(cp -f #{CURRENT_DIR}/sublime/Preferences.sublime-settings #{HOME}/Library/Application\\ Support/Sublime\\ Text\\ 2/Packages/User/Preferences.sublime-settings)
end
