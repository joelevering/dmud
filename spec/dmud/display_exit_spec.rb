require 'spec_helper'

describe DisplayExit do

  let(:runner) { described_class.new(room_exit) }
  let(:room_exit) { double(description: description) }
  let(:description) { "A lengthy description" }

  describe "#display" do
    subject { runner.display }

    it { should include description }
  end
end
