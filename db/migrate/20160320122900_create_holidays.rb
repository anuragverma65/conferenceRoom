class CreateHolidays < ActiveRecord::Migration
  def change
    create_table :holidays do |t|
      t.date :date
      t.string :reason

      t.timestamps null: false
    end
  end
end
