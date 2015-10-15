dir = File.expand_path('../', __FILE__)

worker_processes 10
working_directory dir

timeout 300
listen 4567

pid "#{dir}/tmp/unicorn.pid"
stdout_path "#{dir}/log/unicorn.stdout.log"
stderr_path "#{dir}/log/unicorn.stderr.log"
