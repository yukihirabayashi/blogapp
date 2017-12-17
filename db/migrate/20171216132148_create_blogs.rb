class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
    t.string :name
    t.string :email
    t.string :title
    t.text :content
    t.timestamps null: false
    end
  end
end
