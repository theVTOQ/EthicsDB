class EthicalArgument < ActiveRecord::Base
  belongs_to :author, class_name: 'User', foreign_key: author_id
  has_many :subscribers, class_name: 'User', foreign_key: subscriber_id
  has_many :concerned_partys
  has_many :circumstances, through: :concerned_partys
  has_many :attribute_importance_rankings, through: :concerned_partys
  has_many :action_ethical_arguments
  has_many :possible_actions, through: :action_ethical_arguments
  has_many :action_effect_likelihoods, through: :possible_actions
  has_many :action_morality_rankings, through: :possible_actions
end
