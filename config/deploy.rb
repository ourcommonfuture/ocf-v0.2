set :application, 'ocf'
set :deploy_user, 'deploy'

# roles
set :assets_roles, [:app]
set :assets_prefix, 'assets'
set :migration_role, :app

# Custom varialbes for bundler
set :bundle_env_variables, { nokogiri_use_system_libraries: 1 }

# Output format
#set :log_level , :info
set :format , :pretty
set :pty, true

# setup repo details
set :scm, :git
set :repo_url, 'git@github.com:ourcommonfuture/ocf-v0.2.git'


# how many old releases do we want to keep, not much
set :keep_releases, 3

# files we want symlinking to specific entries in shared
set :linked_files, %w{.env}

# dirs we want symlinking to shared
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}


# this:
# http://www.capistranorb.com/documentation/getting-started/flow/
# is worth reading for a quick overview of what tasks are called
# and when for `cap stage deploy`

namespace :deploy do
  # make sure we're deploying what we think we're deploying
  before :deploy, "deploy:check_revision"

  # compile assets locally then rsync
  before :migrate, 'deploy:setup_config'
  after 'deploy:symlink:release', 'assets:precompile'

  # automatically.
  after :finishing, 'deploy:cleanup'

  after "deploy:publishing", "foreman:export"
  before :finishing, "foreman:restart"
  after :deploy, "nginx:stop"
  after :deploy, "nginx:start"
end
