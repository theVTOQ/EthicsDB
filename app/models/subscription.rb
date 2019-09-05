class Subscription < ActiveRecord::Base
  #belongs_to :user
  belongs_to :subscriber, class_name: 'User', foreign_key: 'user_id'
  #belongs_to :subscriber, polymorphic: true
  belongs_to :subscribed_ethical_argument, class_name: 'EthicalArgument', foreign_key: 'ethical_argument_id'
  #belongs_to :ethical_argument
end
