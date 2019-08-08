class EffectLikelihood < ActiveRecord::Base
  belongs_to :possible_action
  belongs_to :affected_party, class_name: :concerned_party, foreign_key: 'affected_party_id'
end
