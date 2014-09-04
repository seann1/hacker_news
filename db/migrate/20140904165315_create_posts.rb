class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.column :url, :string
      t.column :comment, :string
      t.column :points, :integer
      t.column :user_id, :integer
      t.timestamps
    end
  end
end
