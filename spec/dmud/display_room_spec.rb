require 'spec_helper'

describe DisplayRoom do

  let(:runner) { described_class.new(room) }
  let(:room) { double(name: name, description: description, exits: [exit1, exit2]) }
  let(:name) { "Name of room" }
  let(:description) { "A lengthy description" }
  let(:exit1) { double(description: "exit 1") }
  let(:exit2) { double(description: "exit 2") }

  describe "#display" do
    subject { runner.display }

    it { should include name }
    it { should include description }
    it { should include exit1.description }
    it { should include exit2.description }
  end

end
