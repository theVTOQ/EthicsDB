class EffectLikelihood < ActiveRecord::Base
  belongs_to :possible_action
  belongs_to :concerned_party
end
