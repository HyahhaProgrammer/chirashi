set :rvm_type, :system
set :rvm_ruby_string, '1.9.2@rails-3.2'

set :application, "chirashi"
set :repository,  "git@github.com:HyahhaProgrammer/chirashi.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :scm_passphrase do
  Capistrano::CLI.password_prompt("enter scm passphrase:")
end
default_run_options[:pty] = true

role :web, "chirashi.org"                          # Your HTTP server, Apache/etc
role :app, "chirashi.org"                          # This may be the same as your `Web` server
role :db,  "chirashi.org", :primary => true        # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

set :deploy_to, "/home/#{application}/apps/#{application}"
set :user, "chirashi"

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
   task :start do
     run "#{try_sudo} service httpd restart"
   end
#   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "bundle exec rake assets:precompile RAILS_ENV=production"
     run "touch #{File.join(current_path,'tmp','restart.txt')}"
   end
end

