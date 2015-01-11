namespace :foreman do
  desc "Export the Procfile to Ubuntu's upstart scripts"
  task :export do
    on roles(:app, :crawler), in: :sequence, wait: 1 do
      execute "cd #{release_path} && sudo foreman export upstart /etc/init -a #{fetch(:full_app_name)} -u #{fetch(:deploy_user)}"
    end
  end

  desc "Start the application services"
  task :start do
    on roles(:app, :crawler), in: :sequence, wait: 1 do
      execute "sudo start #{fetch(:full_app_name)}"
    end
  end

  desc "Stop the application services"
  task :stop do
    on roles(:app, :crawler), in: :sequence, wait: 1 do
      execute "sudo stop #{fetch(:full_app_name)}"
    end
  end

  desc "Restart the application services"
  task :restart do
    on roles(:app, :crawler), in: :sequence, wait: 1 do
      execute "sudo start #{fetch(:full_app_name)} || sudo restart #{fetch(:full_app_name)}"
    end
  end

  desc "Flush redis"
  task :flush do
    on roles(:app, :crawler), in: :sequence, wait: 1 do
      execute "sudo echo 'FLUSHALL' | redis-cli"
    end
  end



end
