class Edit < ActiveRecord::Base
    belongs_to :editor, class_name: 'User', foreign_key: 'user_id'
    #belongs_to :author, polymorphic: true
    belongs_to :edited_ethical_argument, class_name: 'EthicalArgument', foreign_key: 'ethical_argument_id'
end