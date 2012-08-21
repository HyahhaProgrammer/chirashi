class ChangeIpToString < ActiveRecord::Migration
  def up
    change_table :memos do |t|
      t.change :ip, :string
    end
  end

  def down
     change_table :memos do |t|
      t.change :ip, :integer
    end
  end
end
