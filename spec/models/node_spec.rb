require 'spec_helper'

describe Node do

  describe "to maintain graph structure consistency" do

    context "when a node has a sink added" do

      it "has the sink in its list of sinks"

      it "is in the sink's list of sources"

      it "has the same number of sinks as sink_edges"

      it "does not change the number of sources"
    end

    context "when a node has a source added" do

      it "has the source in its list of sources"

      it "is in the source's list of sinks"

      it "has the same number of sources as source_edges"

      it "does not change the number of sinks"
    end
  end
end
