class AddIndexToLuckyNumsResults < ActiveRecord::Migration[6.1]
  def change
    add_index :lucky_nums_results, %i[from to], unique: true
  end
end
