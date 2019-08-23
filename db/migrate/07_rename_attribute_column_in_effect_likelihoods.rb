class RenameAttributeColumnInEffectLikelihoods < ActiveRecord::Migration
    rename_column :effect_likelihoods, :attribute, :characteristic
end