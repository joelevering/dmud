require 'spec_helper'

describe Runner do

  subject(:runner) { Runner.new(room) }
  let(:room) { double }

  describe "#start" do
    context "when the user says 'quit'" do
      before do
        Runner.stub(:gets).and_return("quit")
        runner.stub(:stop)
      end

      it "calls stop" do
        runner.start
        runner.should have_received(:stop).once
      end
    end

  end

  describe "#respond_to_input" do

  end
end
