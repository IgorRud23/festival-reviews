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
    if params[:username] == "" || params[:password] == ""
      session[:notice] = "This username is taken, please try something else"
      redirect 'users/signup'
  end
end



end
