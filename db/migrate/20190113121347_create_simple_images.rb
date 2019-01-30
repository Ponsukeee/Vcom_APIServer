class CreateSimpleImages < ActiveRecord::Migration[5.2]
  def change
    create_table :simple_images do |t|
      t.string :name
      t.binary :data, limit: 10.megabyte, null: false
      t.bigint :owner_id, null: false

      t.timestamps
    end
  end
end
