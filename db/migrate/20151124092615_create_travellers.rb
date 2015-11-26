class CreateTravellers < ActiveRecord::Migration
  def change
    create_table :travellers do |t|
      t.references :traveller_group, index: true, foreign_key: true
      t.string :name
      t.string :mobile
      t.string :id_card
      t.boolean :is_kid

      t.timestamps null: false
    end
  end
end
