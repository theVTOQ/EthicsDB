class RenameColumnsInSubscription < ActiveRecord::Migration
    def change
      rename_column :subscriptions, :subscriber_id, :user_id
      rename_column :subscriptions, :subscribed_ethical_argument_id, :ethical_argument_id
    end
end