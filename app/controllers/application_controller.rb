require './config/environment'
require 'sinatra/base'
require 'rack-flash'


class ApplicationController < Sinatra::Base



  configure do
    use Rack::Flash
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "projectmadeforreviewsfestivals"
  end

  get "/" do
    erb :index
  end

helpers do
  def is_logged
    !!current_user
  end

  def current_user
   User.find_by(:id => session[:user_id])
  end
end


end
