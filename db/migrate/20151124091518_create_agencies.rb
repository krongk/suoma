class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.string :name
      t.string :en_name
      t.string :address

      t.timestamps null: false
    end
  end
end
