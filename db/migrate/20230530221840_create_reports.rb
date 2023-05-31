class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :purchase_count, default: 0
      t.decimal :total_price, default: 0

      t.timestamps
    end
  end
end
