def procdir(dirname)
  data = []
  Dir.foreach(dirname) do |dir|
    dirpath = dirname + '/' + dir
    if File.directory?(dirpath) then
      if dir != '.' && dir != '..' then
        data.push(procdir(dirpath))
      end
    else
      data.push(dirpath)
    end
  end
  return data.flatten
end
namespace :assets do
  desc "Precompile assets locally and then rsync to web servers / CDN"
  task :precompile do
    on roles(:app) do
      rsync_host = host.to_s
      checksum_file = "./tmp/assets-#{fetch(:server_name)}"
      run_locally do
        unless `tar -cf - ./app/assets/ | md5sum` == `cat #{checksum_file}`
          with rails_env: :production do ## Set your env accordingly.
            execute :bundle, "exec rake assets:precompile RAILS_ENV=production"
          end
          execute "rsync -av --delete ./public/assets/ #{fetch(:deploy_user)}@#{rsync_host}:#{shared_path}/assets/"

          execute "rm -rf public/assets && mkdir public/assets && touch public/assets/.gitkeep"
          execute "rm -rf tmp/cache/assets/*" # in case you are not seeing changes
        end
        execute "tar -cf - ./app/assets/ | md5sum > #{checksum_file}"
      end
      execute "sudo rm -rf #{fetch(:deploy_to)}/current/public/assets/ && ln -nfs #{shared_path}/assets #{fetch(:deploy_to)}/current/public/assets && chmod 777 -R #{shared_path}/assets"
    end
  end
end
