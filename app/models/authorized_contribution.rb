class AuthorizedContribution < ActiveRecord::Base
    belongs_to :authorized_editor, class_name: 'User', foreign_key: 'authorized_editor_id'
    belongs_to :ethical_argument
end