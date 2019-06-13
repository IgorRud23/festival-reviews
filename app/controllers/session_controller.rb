require 'sinatra/base'
require 'rack-flash'

class SessionsController < ApplicationController

  get '/login' do
    if is_logged
      redirect 'festivals/index'
    else
    erb :"users/login"
  end
  end

  get '/signup' do
    if is_logged
      redirect 'festivals/index'
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
      redirect '/festivals'

    else
      flash[:signup_error] = "Name and password is required or already taken."
      redirect 'signup'
    end
  end

  post '/login' do
    user = User.find_by(:user_name => params[:user_name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to "/festivals"
    else
      flash[:login_error] = "User name or password is incorrect. Please try again."
      redirect to "/login"
    end
  end


end
