class Contribution < ActiveRecord::Base
    belongs_to :author, class_name: 'User', foreign_key: 'user_id'
    #belongs_to :author, polymorphic: true
    belongs_to :authored_ethical_argument, class_name: 'EthicalArgument', foreign_key: 'ethical_argument_id'
end