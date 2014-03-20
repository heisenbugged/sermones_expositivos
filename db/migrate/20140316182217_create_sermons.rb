class CreateSermons < ActiveRecord::Migration
  def change
    create_table :sermons do |t|
      t.string :title
      t.date :date
      t.string :author
      t.string :audio

      t.timestamps
    end
  end
end
