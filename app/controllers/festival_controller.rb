class FestivalsController < ApplicationController

  get '/festivals' do
    if is_logged
      @festivals = Festival.all
      erb :"festivals/index"
    else
        redirect "/"
    end
  end

  get '/festivals/new' do
    if is_logged
      erb :"festivals/new_festival"
    else
      redirect "/"
    end
  end


  post '/festivals/new' do
    if is_logged
      if Festival.new(params).valid?
        @festival = Festival.create(festival_name: params[:festival_name], user_id: current_user.id)
        redirect "/festivals/#{@festival.id}"
      else
        flash[:new_festival_error] = "Fesitval name can't be blank or less than 3 symbols."
        erb :"festivals/new_festival"
      end
    else
      redirect "/"
  end
end


  get '/festivals/:id' do
    if is_logged
      @festival = Festival.find(params[:id])
      erb :"festivals/show_festival"

    else
      redirect "/"
    end
  end

  get '/festivals/delete/:festival_id' do
    @festival = Festival.find(params[:festival_id])
      if @festival.user == current_user
        @festival.delete
        redirect "/festivals"
      end
    end

  end
