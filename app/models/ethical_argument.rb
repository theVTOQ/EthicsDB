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
end
