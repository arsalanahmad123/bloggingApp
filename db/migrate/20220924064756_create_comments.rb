class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :commentor
      t.text :body
      t.integer :blog_id
      t.timestamps
    end
  end
end
