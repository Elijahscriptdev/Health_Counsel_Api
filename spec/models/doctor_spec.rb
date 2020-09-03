require 'rails_helper'

RSpec.describe Doctor, type: :model do
  it { should have_many(:appointments) }
  it { should have_many(:users) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:hospital) }
  it { should validate_presence_of(:age) }
  it { should validate_presence_of(:specialty) }
  it { should validate_presence_of(:experience_level) }
end
