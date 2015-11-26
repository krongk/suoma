class CreateTravellerGroups < ActiveRecord::Migration
  def change
    create_table :traveller_groups do |t|
      t.references :trip, index: true, foreign_key: true
      t.references :agency_contact, index: true, foreign_key: true
      t.date :trav_date
      t.decimal :price_receivable
      t.decimal :price_received
      t.decimal :price_for_sb

      t.timestamps null: false
    end
  end
end
