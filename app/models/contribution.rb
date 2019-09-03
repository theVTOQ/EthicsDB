class Contribution < ActiveRecord::Base
    belongs_to :author, class_name: 'User', foreign_key: 'author_id'
    #belongs_to :author, polymorphic: true
    belongs_to :ethical_argument
end