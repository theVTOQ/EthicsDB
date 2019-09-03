class User < ActiveRecord::Base
  has_secure_password
  has_many :contributions
  has_many :authored_ethical_arguments, through: :contributions, class_name: 'EthicalArgument', foreign_key: 'authored_ethical_argument_id'
  has_many :authorized_contributions
  has_many :authored_ethical_arguments, through: :authorized_contributions, class_name: 'EthicalArgument', foreign_key: 'authored_ethical_argument_id'
  has_many :subscriptions
  has_many :subscribed_ethical_arguments, through: :subscriptions, class_name: 'EthicalArgument', foreign_key: 'subscribed_ethical_argument_id'
  #has_many :subscribed_ethical_arguments, through: :subscriptions, source: :subscriber, source_type: 'User'
end
