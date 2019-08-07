class EthicalArgumentsController < ApplicationController

  get '/ethical_arguments' do
    if logged_in?
      @user = current_user
      @sorted_and_ranked_args = sort_and_rank(EthicalArgument.all)

      erb :"/ethical_arguments/index"
    else
      redirect '/login'
    end
  end

  get '/ethical_arguments/authored' do
    if logged_in?
      @user = current_user
      @sorted_and_ranked_args = sort_and_rank(@user.authored_ethical_arguments)

      erb :"/ethical_arguments/new"
    else
      redirect '/login'
    end
  end

  get '/ethical_arguments/subscribed' do
    if logged_in?
      @user = current_user
      @sorted_and_ranked_args = sort_and_rank(@user.subscribed_ethical_arguments)

      erb :"/ethical_arguments/new"
    else
      redirect '/login'
    end
  end

  get '/ethical_arguments/new' do
    if logged_in?
      @user = current_user

      erb :"/ethical_arguments/new"
    else
      redirect '/login'
    end
  end

  get '/ethical_arguments/:id' do
    if logged_in?
      @ethical_argument = EthicalArgument.find(params[:id])

      erb :"/ethical_arguments/show"
    else
      redirect '/login'
    end
  end

  get '/tweets/:id/edit' do
    if logged_in?
      @tweet = Tweet.find(params[:id])

      if current_user.tweets.include?(@tweet)
        erb :"/tweets/edit"
      else
        redirect '/login'
      end
    else
      redirect '/login'
    end
  end

  post '/tweets' do
    if !params["tweet"]["content"].empty?
      tweet = Tweet.create(content: params["tweet"]["content"], user_id: current_user.id)
      redirect "/tweets/#{tweet.id}"
    else
      redirect "/tweets/new"
    end
  end

  patch '/tweets/:id' do
    if !params["tweet"]["content"].empty?
      Tweet.find(params[:id]).update(params["tweet"])
      redirect "/tweets/#{params[:id]}"
    else
      redirect "/tweets/#{params[:id]}/edit"
    end
  end

  delete '/tweets/:id' do
    if logged_in?
      tweet = Tweet.find(params[:id])

      if current_user.tweets.include?(tweet)
        tweet.destroy
        redirect '/tweets'
      else
        redirect '/tweets'
      end
    else
      redirect '/login'
    end
  end
end
