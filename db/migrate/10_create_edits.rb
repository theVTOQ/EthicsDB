class CreateEdits < ActiveRecord::Migration
   def change
    remove_column :contributions, :is_edit    
    rename_table :contributions, :compositions

    create_table :edits do |t|
        t.integer :user_id
        t.integer :ethical_argument_id
    end
   end
end