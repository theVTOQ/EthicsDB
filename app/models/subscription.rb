class Subscription < ActiveRecord::Base
  belongs_to :subscriber, class_name: 'User', foreign_key: 'subscriber_id'
  #belongs_to :subscriber, polymorphic: true
  belongs_to :ethical_argument
end
