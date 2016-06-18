class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :name
      t.string :description
      t.string :origin
      t.string :destination
      t.string :destination_link
      t.datetime :total_time
      t.decimal :start_lat,  precision: 11, scale: 8
      t.decimal :end_lat,  precision: 11, scale: 8
      t.decimal :start_lng,  precision: 11, scale: 8
      t.decimal :end_lng,  precision: 11, scale: 8

      t.timestamps null: false
    end
  end
end
