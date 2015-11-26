class CreateVouchers < ActiveRecord::Migration
  def change
    create_table :vouchers do |t|
      t.references :traveller_group, index: true, foreign_key: true
      t.decimal :price
      t.string :image

      t.timestamps null: false
    end
  end
end
