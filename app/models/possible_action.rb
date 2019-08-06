class PossibleAction < ActiveRecord::Base
  has_many :action_ethical_arguments
  has_many :ethical_arguments, through: :action_ethical_arguments
  has_many :action_effect_likelihoods
end
