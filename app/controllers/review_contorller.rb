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
    if is_logged
      Review.create(content: params[:content], festival_id: params[:festival_id], user_id: current_user.id)
      redirect "/festivals/#{params[:festival_id]}"
    else
      flash[:review_error] = "Add some review"
      redirect "/"
    end
  end

  get  '/reviews/delete/:review_id/:festival_id' do
    if is_logged
      @review = Review.find(params[:review_id])
      if @review.user == current_user
    @review.delete
    redirect "/festivals/#{params[:festival_id]}"
  else
    redirect '/'
  end
end
end

get '/reviews/edit/:review_id/:festival_id' do
  if is_logged
    @festival = Festival.find(params[:festival_id])
    @review = Review.find(params[:review_id])
      if @review.user == current_user
        erb :'reviews/edit_review'
  else
    redirect "/"
end
end
end

post '/reviews/edit/:review_id/:festival_id' do
  if is_logged
    @review = Review.find(params[:review_id])
    if @review.user == current_user
      @review.update(content: params[:content])
      redirect "/festivals/#{params[:festival_id]}"
  else
    redirect "/"
end
end
end



end
