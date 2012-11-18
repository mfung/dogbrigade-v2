#require 'bundler/capistrano'
load 'deploy/assets'
#require 'capistrano/ext/multistage'

set :application, "dogbrigade"
set :repository,  "git@github.com:mfung/dogbrigade-v2.git"

set :scm, :git
set :git_enable_submodules, 1
set :branch, 'master'
set :ssh_options, { :forward_agent => true }
set :stage, :production
set :user, 'dogbrigade_user'
set :use_sudo, false

set :keep_releases, 5

set :deploy_to, '/srv/www/dogbrigade.com/application'
set :deploy_via, :remote_cache

set :app_server, :passenger
set :domain, 'dogbrigade.com'
set :normalize_asset_timestamps, false

role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db,  domain , :primary => true

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
  task :stop, :roles => :app do
  # Do nothing.
  end
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end

namespace :db do
  task :db_config, :except => {:no_release => true}, :role => :app do
    run "cp -f ~/database.yml #{current_release}/config/database.yml"
  end
end

after "deploy:finalize_update", "db:db_config"