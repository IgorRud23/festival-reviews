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
        @festival = Festival.new(params)
        @festival.save

        redirect "/festivals/#{@festival.id}"
      else
        flash[:new_festival_error] = "Fesitval name can't be blank or less than 5 symbols."
        erb :"festivals/new_festival"
      end

    else
      redirect "/"
  end
end


  get '/festivals/:id' do
    if is_logged
      #@festival = Festival.find(params[:id])
      #erb :"festivals/show_festival"
      redirect "/festivals"

    else
      redirect "/"
    end
  end

end
