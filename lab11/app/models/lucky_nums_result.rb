class LuckyNumsResult < ApplicationRecord
  validates_uniqueness_of :to, scope: :from
end
