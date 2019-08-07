class CreateEthicalArguments < ActiveRecord::Migration
  def change
    create_table :ethical_arguments do |t|
      t.string :topic
      t.string :title
      t.string :summary
      t.boolean :is_private
    end

    create_table :concerned_partys do |t|
      t.string :identifier
    end

    create_table :circumstances do |t|
      t.string :context
      t.references :concerned_party, index: true, foreign_key: true
    end

    create_table :attribute_importance_rankings do |t|
      t.string :attribute
      t.integer :importance_ranking
      t.references :concerned_party, index: true, foreign_key: true
    end

    create_table :possible_actions do |t|
      t.string :name
      t.integer :morality_ranking
    end

    create_table :action_effect_likelihoods do |t|
      t.string :attribute
      t.string :operation
      t.decimal :likelihood
      t.references :possible_action, index: true, foreign_key: true
    end
  end
end
