# frozen_string_literal: true

require "spec_helper"

RSpec.describe Car, type: :model do
  it { is_expected.to be_versioned }

  describe "changeset", versioning: true do
    it "has the expected keys (see issue 738)" do
      car = described_class.create!(name: "Alice")
      car.update(name: "Bob")
      assert_includes car.versions.last.changeset.keys, "name"
    end
  end
end
