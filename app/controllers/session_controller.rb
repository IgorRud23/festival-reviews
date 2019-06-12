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

  post '/signup' do
    if User.new(:username => params[:username]).valid?
      redirect 'signup'

    else
      flash[:error_message] = "Name and password is required"
      redirect 'signup'
    end
  end




end
