class AddIpToMemos < ActiveRecord::Migration
  def change
    add_column :memos, :ip, :integer
  end
end
