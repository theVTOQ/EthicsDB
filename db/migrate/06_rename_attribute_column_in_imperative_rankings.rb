class RenameAttributeColumnInImperativeRankings < ActiveRecord::Migration
    rename_column :imperative_rankings, :attribute, :characteristic
end