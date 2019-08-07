class CreateUserEthicalArgumentTables < ActiveRecord::Migration
  def change
    create_table authored_ethical_arguments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :ethical_argument, index: true, foreign_key: true
    end

    create_table subscribed_to_ethical_arguments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :ethical_argument, index: true, foreign_key: true
    end
  end
end
