require 'bundler'
Bundler.require

APP_ROOT = File.expand_path("..", __dir__)

#load all controllers
Dir.glob(File.join(APP_ROOT, "app", "controllers", "*.rb")).each { |file| require file}
#load all models
Dir.glob(File.join(APP_ROOT, "app", "models", "*.rb")).each { |file| require file}

class RobotManagerApp < Sinatra::Base
  set :method_override, true
  set :root, File.expand_path("..", __dir__)
  set :views, File.join(APP_ROOT, "app", "views")
  set :public_folder, File.join(APP_ROOT, "app", "public")
end
