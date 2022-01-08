class LuckyNumsResult < ApplicationRecord
  serialize :result
  validates_uniqueness_of :to, scope: :from
end
