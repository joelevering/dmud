require 'spec_helper'

describe DisplayRoom do

  let(:runner) { described_class.new(room) }
  let(:room) { double(name: name, description: description) }
  let(:name) { "Name of room" }
  let(:description) { "A lengthy description" }

  describe "#display" do
    subject { runner.display }

    it { should include name }
    it { should include description }
  end

end
