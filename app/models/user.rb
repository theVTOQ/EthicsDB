class User < ActiveRecord::Base
  has_secure_password
  has_many :compositions
  has_many :authored_ethical_arguments, through: :compositions
  has_many :edits
  has_many :edited_ethical_arguments, through: :edits
  has_many :authorized_edits
  has_many :authorized_ethical_arguments, through: :authorized_edits
  has_many :subscriptions
  has_many :subscribed_ethical_arguments, through: :subscriptions
  #has_many :subscribed_ethical_arguments, through: :subscriptions, class_name: 'EthicalArgument', foreign_key: 'subscribed_ethical_argument_id'
  #has_many :subscribed_ethical_arguments, through: :subscriptions, source: :subscriber, source_type: 'User'
end
