class CreateMovingAverages < ActiveRecord::Migration
  def change
    create_table :moving_averages do |t|
      t.integer :company_id
      t.integer :daily_quote_id
      t.date :date
      t.float :avg_closing_price

      t.timestamps
    end
  end
end
