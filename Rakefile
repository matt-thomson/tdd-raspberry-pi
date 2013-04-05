VENDINGMACHINE_ROOT = "vendingmachine"
MACHINEDIR='/home/pi/vendingmachine'

PI = ENV["PI"] || "pi@raspberrypi"

def remote_run(command)
  sh "ssh #{PI} #{command}"
end


desc "start vendingmachine service"
task :start => :init_d do
  remote_run "sudo /etc/init.d/vendingmachine restart"
end

desc "stop vendingmachine service on pi"
task :stop do
  remote_run "sudo /etc/init.d/vendingmachine stop"
end

desc "vendingmachine service status on pi"
task :status do
  remote_run "sudo /etc/init.d/vendingmachine status"
end

desc "run integration tests"
task :integration => :deploy do
  remote_run "cd  #{MACHINEDIR} && rake test"
end

task :init_d => :deploy do
  #install init.d script
  remote_run "sudo 'rsync -av --delete /home/pi/vendingmachine/init.d/vendingmachine /etc/init.d/vendingmachine && sudo chmod +x /etc/init.d/vendingmachine'"
  #start on boot
  remote_run "sudo update-rc.d vendingmachine defaults"
end

require 'rake/testtask'

desc 'run unit tests'
task :default => :test
Rake::TestTask.new(:test) do |t|
  t.test_files = FileList['test/**/*test.rb', 'test/*test.rb']
end

desc "deploy to pi"
task :deploy => :test do
  sh "rsync -avz --delete * #{PI}:#{VENDINGMACHINE_ROOT}/"
end

desc "render documentation"
task :doc do
  sh "cd .. && pandoc --standalone -o doc/html/README.html -i README.md"
end
