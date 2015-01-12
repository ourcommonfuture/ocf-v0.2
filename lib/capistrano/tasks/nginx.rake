namespace :nginx do
  %w(start stop restart reload).each do |task_name|
    desc "#{task } Nginx"
    task task_name do
      on roles(:app, :crawler), in: :sequence, wait: 1 do
        sudo "/etc/init.d/nginx #{task_name}"
      end
    end
  end
end
