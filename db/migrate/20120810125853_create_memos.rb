class CreateMemos < ActiveRecord::Migration
  def change
    create_table :memos do |t|
      t.string :username
      t.string :subject
      t.text :content

      t.timestamps
    end
  end
end
