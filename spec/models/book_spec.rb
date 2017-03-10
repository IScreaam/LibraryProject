require 'rails_helper'

RSpec.describe Book, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:author_name) }
  it { is_expected.to validate_length_of(:name).is_at_most(255).is_at_least(2) }
  it { is_expected.to validate_length_of(:author_name).is_at_most(255).is_at_least(2) }
end