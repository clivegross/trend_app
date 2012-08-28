class CreateDailyQuotes < ActiveRecord::Migration
  def change
    create_table :daily_quotes do |t|
      t.date :date
      t.float :closing_price
      t.integer :company_id
      t.integer :volume

      t.timestamps
    end
  end
end
