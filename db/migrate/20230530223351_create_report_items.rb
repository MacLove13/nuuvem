class CreateReportItems < ActiveRecord::Migration[7.0]
  def change
    create_table :report_items do |t|
      t.references :report, null: false, foreign_key: true
      t.string :purchaser_name, default: ''
      t.string :item_description, default: ''
      t.decimal :item_price, default: 0.0
      t.integer :purchase_count, default: 0
      t.string :merchant_address, default: ''
      t.string :merchant_name, default: ''

      t.timestamps
    end
  end
end
