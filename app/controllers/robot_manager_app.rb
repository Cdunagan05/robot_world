require 'pry'
require 'sinatra/base'

class RobotManagerApp < Sinatra::Base

  get '/' do
    erb :dashboard
  end

  get '/robots' do
    @robots = robot_manager.all
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  get '/robots/:id' do |id|
    @robot = robot_manager.find(id.to_i)
    erb :show
  end

  get '/robots/:id/edit' do
    @robot = robot_manager.find(params[:id].to_i)
    erb :edit
  end

  put '/robots/:id' do
    robot_manager.update(params[:id].to_i, params[:robot])
    redirect "/robots/#{params[:id]}"
  end

  post '/robots' do
    robot_manager.create(params[:robot])
    redirect '/robots'
  end

  delete '/robots/:id' do
    robot_manager.destroy(params[:id].to_i)
    redirect '/robots'
  end

  def robot_manager
    if ENV['RACK_ENV'] == 'test'
      database = SQLite3::Database.new("db/robot_manager_test.db")
    else
      database = SQLite3::Database.new('db/robot_manager_development.db')
    end
    database.results_as_hash = true
    RobotManager.new(database)
  end
end
