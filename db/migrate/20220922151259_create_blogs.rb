class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.string :heading
      t.text :description
      t.integer :user_id
      t.timestamps
    end
  end
end
