class EthicalArgument < ActiveRecord::Base
  has_many :user_ethical_arguments
  has_many :users, through: :user_ethical_arguments
  has_many :concerned_partys
  has_many :circumstances, through: :concerned_partys
  has_many :attribute_importance_rankings, through: :concerned_partys
  has_many :action_ethical_arguments
  has_many :possible_actions, through: :action_ethical_arguments
  has_many :action_effect_likelihoods, through: :possible_actions
  has_many :action_morality_rankings, through: :possible_actions
end
