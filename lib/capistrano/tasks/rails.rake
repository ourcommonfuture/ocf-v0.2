namespace :rails do
  desc "Open the rails console on each of the remote servers"
  task :console do
    on roles(:app), :primary => true do
      execute_interactively "~/.rvm/wrappers/ocf/bundle exec rails console #{fetch(:stage)}"
    end
  end

  def execute_interactively(command)
    exec "ssh -l #{fetch(:deploy_user)} #{host.to_s} -t 'cd #{deploy_to}/current && #{command}'"
  end
end
