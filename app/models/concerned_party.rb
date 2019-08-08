class ConcernedParty < ActiveRecord::Base
  belongs_to :ethical_argument
  has_many :circumstances
  has_many :attribute_importance_rankings
  has_many :effect_likelihoods
  #has_many :possible_actions, through: :effect_likelihoods
end
