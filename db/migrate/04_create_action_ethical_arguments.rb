class CreateActionEthicalArguments < ActiveRecord::Migration
  def change
    create_table :action_ethical_arguments do |t|
      t.references :possible_action, index: true, foreign_key: true
      t.references :ethical_argument, index: true, foreign_key: true
    end
  end
end
