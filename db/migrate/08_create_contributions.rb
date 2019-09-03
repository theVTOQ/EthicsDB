class CreateContributions < ActiveRecord::Migration
    def change
      create_table :contributions do |t|
        t.references :user, index: true, foreign_key: true
        t.references :ethical_argument, index: true, foreign_key: true
        t.boolean :is_edit
      end

      create_table :authorized_contributions do |t|
        t.references :user, index: true, foreign_key: true
        t.references :ethical_argument, index: true, foreign_key: true
      end
    end
  end
  