class AddCategoryToSermons < ActiveRecord::Migration
  def change
    add_column :sermons, :category, :string
  end
end
