require 'rails_helper'

describe LuckyNumsResult, type: :model do
  before(:each) { LuckyNumsResult.delete_all }

  it 'should add records to DB' do
    expect { LuckyNumsResult.create(from: 0, to: 1, result: "doesn't matter") }
      .to(change { LuckyNumsResult.count })
  end

  it "shouldn't allow adding identical records" do
    LuckyNumsResult.create(from: 0, to: 1, result: "doesn't matter")
    expect(LuckyNumsResult.new(from: 0, to: 1, result: "doesn't matter")).not_to be_valid
  end
end
