require "rails_helper"

describe Move do
  describe "validations" do
    context "any move" do
      subject { Move.new(name: "vertical punch", move_type: "hand", belt_level: "white") }

      it { should validate_uniqueness_of(:name) }
      it { should validate_presence_of(:move_type) }
      it { should validate_inclusion_of(:move_type).in_array(Move::MOVE_TYPES)}
    end
  end
end
