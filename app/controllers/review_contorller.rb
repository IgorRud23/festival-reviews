class ReviewController < ApplicationController
  get '/reviews/new/:id' do
    if is_logged
      @festival = Festival.find(params[:id])
      erb :'reviews/new_review'
    else
        redirect "/"
    end
  end

  post '/reviews/new/:festival_id' do
    if true
      @review = Review.new(params)
      @review.save
      redirect "/festivals/#{params[:festival_id]}"
    else
      flash[:review_error] = "Review should be more than two symbols"
      redirect "/reviews/new/#{params[:id]}"
    end
  end

end
