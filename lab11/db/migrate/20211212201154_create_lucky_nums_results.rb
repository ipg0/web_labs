class CreateLuckyNumsResults < ActiveRecord::Migration[6.1]
  def change
    create_table :lucky_nums_results do |t|
      t.integer :from
      t.integer :to
      t.text :result

      t.timestamps
    end
  end
end
