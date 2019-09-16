class EthicalArgument < ActiveRecord::Base
  has_many :compositions
  has_many :authors, through: :compositions, class_name: 'User', foreign_key: 'author_id'
  
  has_many :edits
  has_many :editors, through: :edits, class_name: 'User', foreign_key: 'editor_id'

  has_many :authorized_contributions
  has_many :authorized_editors, through: :authorized_contributions, class_name: 'User', foreign_key: 'authorized_editor_id'
  
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions
  
  #has_many :subscribers, through: :subscriptions, class_name: 'User', foreign_key: 'subscriber_id'
  has_many :concerned_partys
  has_many :circumstances, through: :concerned_partys
  
  #has_many :attribute_importance_rankings, through: :concerned_partys
  has_many :imperative_rankings, through: :concerned_partys
  #has_many :effect_likelihoods, through: :concerned_partys
  
  has_many :action_ethical_arguments
  has_many :possible_actions, through: :action_ethical_arguments

  def self.sort_and_rank
    #binding.pry
    sorted_and_ranked = {}
    #ethical_arguments.map {
    #  |ethical_argument| [ethical_argument.topic, [ethical_argument]]
    #}.to_h.each{|topic, list| list.sort_by {|ethical_argument| ethical_argument.subscribers.count }}
    self.all.each do |ethical_argument|
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
end
