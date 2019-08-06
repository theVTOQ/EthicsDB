class CreateUserEthicalArguments < ActiveRecord::Migration
  def change
    create_table user_ethical_arguments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :ethical_argument, index: true, foreign_key: true
    end
  end
end
