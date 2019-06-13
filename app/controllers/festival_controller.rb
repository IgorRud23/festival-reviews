class SessionsController < ApplicationController

  get '/festivals' do
    if is_logged
      erb :"festivals/index"
    else
        redirect to "/login"
  end
  end
end
