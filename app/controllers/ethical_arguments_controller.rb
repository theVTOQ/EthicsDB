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
      @sorted_and_ranked_contributions = sort_and_rank(@user.authored_ethical_arguments)

      erb :"/ethical_arguments/authored"
    else
      redirect '/login'
    end
  end

  get '/ethical_arguments/subscribed' do
    if logged_in?
      @user = current_user
      sorted_and_ranked_args = sort_and_rank(@user.subscribed_ethical_arguments)
      @authored = sort_and_rank(@user.compositions)
      @edited = sort_and_rank(@user.edits)

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

  post '/subscribe/:id' do
    ethical_argument = EthicalArgument.find(params[:id])

    current_user.subscribed_ethical_arguments << ethical_argument
    redirect "/ethical_arguments/#{params[:id]}"
  end

  post '/unsubscribe/:id' do
    ethical_argument = EthicalArgument.find(params[:id])

    current_user.subscribed_ethical_arguments.delete(ethical_argument)
    redirect "/ethical_arguments/#{params[:id]}"
  end

  post '/ethical_arguments/authored' do
    if !params["ethical_argument"].empty?
      #in future, use find_or_create_by ?
      
      concerned_party_1 = ConcernedParty.create(params["concerned_parties"][0])
      concerned_party_2 = ConcernedParty.create(params["concerned_parties"][1])

      circumstance_1 = Circumstance.create(params["circumstances"][0])
      circumstance_2 = Circumstance.create(params["circumstances"][1])

      concerned_party_1.circumstances << circumstance_1
      concerned_party_2.circumstances << circumstance_2

      imperative_ranking_1 = ImperativeRanking.create(params["imperative_rankings"][0])
      imperative_ranking_2 = ImperativeRanking.create(params["imperative_rankings"][1])

      concerned_party_1.imperative_rankings << imperative_ranking_1
      concerned_party_2.imperative_rankings << imperative_ranking_2

      possible_action_1 = PossibleAction.create(params["possible_actions"][0])
      possible_action_2 = PossibleAction.create(params["possible_actions"][1])

      effect_likelihood_1 = EffectLikelihood.create(params["effect_likelihoods"][0])
      effect_likelihood_2 = EffectLikelihood.create(params["effect_likelihoods"][1])

      affected_party_1 = (params["effect_likelihood_1_affected_party"] == 1) ? concerned_party_1 : concerned_party_2
      affected_party_1.effect_likelihoods << effect_likelihood_1

      affected_party_2 = (params["effect_likelihood_2_affected_party"] == 1) ? concerned_party_1 : concerned_party_2
      affected_party_2.effect_likelihoods << effect_likelihood_2

      possible_action_1.effect_likelihoods << effect_likelihood_1
      possible_action_2.effect_likelihoods << effect_likelihood_2

      ethical_argument = EthicalArgument.create(params["ethical_argument"])
      
      ethical_argument.concerned_partys << concerned_party_1
      ethical_argument.concerned_partys << concerned_party_2

      ethical_argument.possible_actions << possible_action_1
      ethical_argument.possible_actions << possible_action_2

      current_user.authored_ethical_arguments << ethical_argument
      
      redirect "/ethical_arguments/#{ethical_argument.id}"
    else
      redirect "/ethical_arguments/authored"
    end
  end

  patch '/ethical_arguments/:id' do
    if !params["ethical_argument"].empty?
      #in future, use find_or_create_by ?
      ethical_argument = EthicalArgument.find(params[:id])
      ethical_argument.update(params["ethical_argument"])

      concerned_party_1 = ethical_argument.concerned_partys[0]
      concerned_party_2 = ethical_argument.concerned_partys[1]

      concerned_party_1.update(params["concerned_partys"][0])
      concerned_party_2.update(params["concerned_partys"][1])

      circumstance_1 = concerned_party_1[0]
      circumstance_2 = concerned_party_2[0]

      circumstance_1.update(params["circumstances"][0])
      circumstance_2.update(params["circumstances"][1])

      #in future, be able to add circumstances, concerned parties and so on when editing ethical argument
      imperative_ranking_1 = concerned_party_1.imperative_rankings[0]
      imperative_ranking_2 = concerned_party_1.imperative_rankings[0]

      imperative_ranking_1.update(params[imperative_rankings][0])
      imperative_ranking_2.update(params[imperative_rankings][1])

      possible_action_1 = ethical_argument.possible_actions[0]
      possible_action_2 = ethical_argument.possible_actions[1]

      possible_action_1.update(params[possible_actions][0])
      possible_action_2.update(params[possible_actions][1])

      effect_likelihood_1 = possible_action_1.effect_likelihoods[0]
      effect_likelihood_2 = possible_action_2.effect_likelihoods[0]

      effect_likelihood_1.update(params[effect_likelihoods][0])
      effect_likelihood_2.update(params[effect_likelihoods][1])

      effect_likelihood_1.affected_party = (params[effect_likelihood_1_affected_party] == 1) ? concerned_party_1 : concerned_party_2
      effect_likelihood_2.affected_party = (params[effect_likelihood_2_affected_party] == 1) ? concerned_party_1 : concerned_party_2

      ethical_argument.editors << current_user if !ethical_argument.editors.include?(user)

      redirect "/ethical_arguments/#{ethical_argument.id}"
    else
      redirect "/ethical_arguments/authored"
    end
  end

  delete '/ethical_arguments/:id' do
    if logged_in?
      ethical_argument = EthicalArgument.find(params[:id])

      if current_user.authored_ethical_arguments.include?(ethical_argument)
        ethical_argument.destroy
        redirect '/authored_ethical_arguments'
      else
        redirect '/authored_ethical_arguments'
      end
    else
      redirect '/login'
    end
  end
end
