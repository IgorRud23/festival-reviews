require 'sinatra/base'
require 'rack-flash'

class SessionsController < ApplicationController

  get '/login' do
    if is_logged
      redirect to '/index' #change index to homepage
    else
    erb :"users/login"
  end
  end

  get '/signup' do
    if is_logged
      redirect to '/index' #change index to homepage
    else
      erb :"users/signup"
    end
  end

  get '/logout' do
    if is_logged
      session.clear
      redirect '/'
    else
      redirect '/'
  end
end

  post '/signup' do
    if User.new(params).valid?
      @user = User.new(params)
      @user.save
      session[:user_id] = @user.id
      redirect to '/festivals'

    else
      flash[:error_message] = "Name and password is required or already taken."
      redirect 'signup'
    end
  end

end
