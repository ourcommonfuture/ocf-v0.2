set :stage, :production
set :branch, "master"
set :bundle_flags, '--deployment'
set :rvm_ruby_version, '2.1.3'
set :server_name, "onlineuwc.org"
set :full_app_name, "ocf"
set :log_path, "/var/log/#{fetch(:full_app_name)}"
set :deploy_to, "/var/www/#{fetch(:full_app_name)}"
set :rails_env, :production
 
server '178.62.111.27', user: 'deploy', roles: %w{app}, primary: true