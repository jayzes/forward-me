worker_processes Integer(ENV['WEB_CONCURRENCY'] || 3)
timeout 10
preload_app true
listen ENV['PORT'].to_i || 3000, tcp_nopush: false

before_fork do |server, worker|

  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
    Rails.logger.info('Disconnected from ActiveRecord')
  end

end

after_fork do |server, worker|

  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
    Rails.logger.info('Connected to ActiveRecord')
  end

  if Rails.cache.respond_to?(:reset)
    Rails.cache.reset
    Rails.logger.info('Rails cache has been reset')
  end

end
