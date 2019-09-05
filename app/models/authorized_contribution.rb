class AuthorizedContribution < ActiveRecord::Base
    belongs_to :authorized_editor, class_name: 'User', foreign_key: 'user_id'
    belongs_to :authorized_ethical_argument, class_name: 'EthicalArgument', foreign_key: 'ethical_argument_id'
end