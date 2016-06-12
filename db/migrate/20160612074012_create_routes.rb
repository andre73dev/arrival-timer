class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :name
      t.string :description
      t.string :destination
      t.string :destination_link
      t.datetime :total_time

      t.timestamps null: false
    end
  end
end
