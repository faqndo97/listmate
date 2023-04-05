class AddShareIdToLists < ActiveRecord::Migration[7.0]
  def change
    add_column :lists, :share_id, :string, null: false, unique: true, index: true
  end
end
