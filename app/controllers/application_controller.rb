require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    erb :index
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

    def sort_and_rank(ethical_arguments)
      sorted_and_ranked = {}
      #ethical_arguments.map {
      #  |ethical_argument| [ethical_argument.topic, [ethical_argument]]
      #}.to_h.each{|topic, list| list.sort_by {|ethical_argument| ethical_argument.subscribers.count }}
      ethical_arguments.each do |ethical_argument|
        topic = ethical_argument.topic
        if sorted_and_ranked.key?(topic)
          sorted_and_ranked[topic] << ethical_argument unless sorted_and_ranked[topic].include?(ethical_argument)
        else
          sorted_and_ranked[topic] = [ethical_argument]
        end 
      end

      sorted_and_ranked.each do |topic, ethical_arguments|
        ethical_arguments.sort_by{|ethical_argument| ethical_argument.subscribers.length }
        #ethical_arguments.each do |ethical_argument|

        #end
      end

      sorted_and_ranked
    end

    def rank_morality_of_possible_actions(possible_actions, imperative_rankings)

    end

    def username_taken?(username)
      User.all.collect{|user| user.username}.include?(username)
    end

    def email_taken?(email)
      User.all.collect{|user| user.email}.include?(email)
    end
  end
end
