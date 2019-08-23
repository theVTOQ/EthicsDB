class ChangePartysTableName < ActiveRecord::Migration
    def change
        rename_table :concerned_partys, :concerned_parties
    end
end