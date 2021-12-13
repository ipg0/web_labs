class CreateLuckyNumsResults < ActiveRecord::Migration[6.1]
  def change
    create_table :lucky_nums_results, id: false do |t|
      t.integer :from, null: false
      t.integer :to, null: false
      t.text :result

      t.timestamps
    end
  end
end
