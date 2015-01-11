namespace :deploy do
  task :setup_config do
    on roles(:app), in: :sequence, wait: 1 do
      set :role_name, "web"
      set :web_processes, 5
      generate_files ['nginx.conf', 'env']
    end
  end

  def generate_files config_files
    full_app_name = fetch(:full_app_name)
    config_files.each do |file|
      smart_template file
    end

    # .env
    if config_files.include? 'env'
      template_env = ERB.new(File.read("config/deploy/shared/env.erb")).result(binding)
      original_env = File.read(".env")
      from_erb = StringIO.new("#{original_env}#{template_env}")
      upload! from_erb, "#{shared_path}/config/env"
      sudo "rm -f #{shared_path}/.env && cp #{shared_path}/config/env #{shared_path}/.env && chmod +x #{shared_path}/.env"
    end

    # nginx
    if config_files.include? 'nginx.conf'
      sudo "ln -nfs #{shared_path}/config/nginx.conf #{sub_strings("/etc/nginx/sites-enabled/{{full_app_name}}")}"
      if fetch(:use_ssl)
        puts "SSL certificates"
        sudo "ln -nfs #{release_path}/config/cert/ssl /etc/nginx/ssl"
      end
    end

  end
end
