class CreateVrms < ActiveRecord::Migration[5.2]
  def change
    create_table :vrms do |t|
      t.string :name
      t.binary :data, null: false, limit: 1024.megabyte
      t.bigint :owner_id, null: false

      t.timestamps
    end
  end
end
