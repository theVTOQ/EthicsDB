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
      t.references :ethical_argument, index: true, foreign_key: true
    end

    create_table :circumstances do |t|
      t.string :context
      t.references :concerned_party, index: true, foreign_key: true
    end

    create_table :imperative_rankings do |t|
      t.string :attribute
      t.string :operation
      t.integer :importance_ranking
      t.references :concerned_party, index: true, foreign_key: true
    end

    create_table :possible_actions do |t|
      t.string :description
      t.integer :morality_ranking
    end

    create_table :effect_likelihoods do |t|
      t.string :attribute
      t.string :operation
      t.decimal :likelihood
      t.references :possible_action, index: true, foreign_key: true
      t.references :concerned_party, index: true, foreign_key: true
    end
  end
end
