class AddColumnsToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :title, :string
    add_column :books, :author, :string
    add_column :books, :rating, :integer
    add_column :books, :description, :text
  end
end
