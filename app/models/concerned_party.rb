class ConcernedParty < ActiveRecord::Base
  belongs_to :ethical_argument
  has_many :circumstances
  has_many :attribute_importance_rankings
end
