class CreateAgencyContacts < ActiveRecord::Migration
  def change
    create_table :agency_contacts do |t|
      t.references :agency, index: true, foreign_key: true
      t.string :name
      t.string :mobile
      t.boolean :is_admin

      t.timestamps null: false
    end
  end
end
