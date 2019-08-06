class ActionEthicalArgument < ActiveRecord::Base
  belongs_to :possible_action
  belongs_to :ethical_argument
end
