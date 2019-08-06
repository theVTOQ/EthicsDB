class ConcernedParty < ActiveRecord::Base
  has_many :circumstances
  has_many :attribute_importance_rankings
end
