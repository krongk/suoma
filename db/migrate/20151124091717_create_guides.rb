class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.string :name
      t.string :mobile
      t.string :license_number
      t.string :qq
      t.string :wechat
      t.boolean :is_published

      t.timestamps null: false
    end
  end
end
