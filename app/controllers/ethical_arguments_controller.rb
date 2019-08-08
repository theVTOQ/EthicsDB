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
      @current_partys = []

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

  get '/ethical_arguments/:id/edit' do
    if logged_in?
      @ethical_argument  = EthicalArgument.find(params[:id])

      if current_user.authored_ethical_arguments.include?(@ethical_argument)
        erb :"/ethical_arguments/edit"
      else
        redirect '/login'
      end
    else
      redirect '/login'
    end
  end

  post '/ethical_arguments/authored' do
    if !params["tweet"]["content"].empty?
      #in future, use find_or_create_by ?
      concerned_party_1 = ConcernedParty.create(params["concerned_partys"][0])
      concerned_party_2 = ConcernedParty.create(params["concerned_partys"][1])

      circumstance_1 = Circumstance.create(params["circumstances"][0])
      circumstance_2 = Circumstance.create(params["circumstances"][1])

      concerned_party_1.circumstances << circumstance_1
      concerned_party_2.circumstances << circumstance_2

      imperative_ranking_1 = ImperativeRanking.create(params[imperative_rankings][0])
      imperative_ranking_2 = ImperativeRanking.create(params[imperative_rankings][1])

      concerned_party_1.imperative_rankings << imperative_ranking_1
      concerned_party_2.imperative_rankings << imperative_ranking_2

      possible_action_1 = PossibleAction.create(params[possible_actions][0])
      possible_action_2 = PossibleAction.create(params[possible_actions][1])

      effect_likelihood_1 = EffectLikelihood.create(params[effect_likelihoods][0])
      effect_likelihood_2 = EffectLikelihood.create(params[effect_likelihoods][1])

      possible_action_1.effect_likelihoods << effect_likelihood_1
      possible_action_2.effect_likelihoods << effect_likelihood_2

      ethical_argument = EthicalArgument.create(params["ethical_argument"])
      ethical_argument.author_id = current_user.id

      ethical_argument.concerned_partys << concerned_party_1
      ethical_argument.concerned_partys << concerned_party_2

      ethical_argument.possible_actions << possible_action_1
      ethical_argument.possible_actions << possible_action_2

      redirect "/ethical_arguments/#{ethical_argument.id}"
    else
      redirect "/ethical_arguments/authored"
    end
  end

  patch '/ethical_arguments/:id' do
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
