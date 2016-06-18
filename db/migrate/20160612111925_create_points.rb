class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.references :route, index: true, foreign_key: true
      t.string :name
      t.decimal :start_lat,  precision: 11, scale: 8
      t.decimal :end_lat,  precision: 11, scale: 8
      t.decimal :start_lng,  precision: 11, scale: 8
      t.decimal :end_lng,  precision: 11, scale: 8
      t.decimal :start_time
      t.decimal :end_time
      t.datetime :start_time
      t.datetime :end_time
      t.datetime :travel_time
      t.string :transration

      t.timestamps null: false
    end
  end
end
