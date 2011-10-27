require 'spec_helper'

describe NodesController do

  render_views

  describe "GET 'index'" do

    it "is successful" do
      get 'index'
      response.should be_success
    end

    it "has the right title" do
      get 'index'
      response.should have_selector("title",
                                    :content => "All Nodes")
    end
  end

  describe "GET 'new'" do

    it "is successful"

    it "has the right title"

  end

  describe "POST 'create'" do

    context "given invalid node data" do

      it "renders the 'new' page"

      it "does not create a node"

    end

    context "given valid node data" do

      it "is successful"

      it "has the right title"

      it "creates a node"

      context "when it's a reply" do

        it "has an incoming edge from its parent"

      end
    end
  end

  describe "GET 'show'" do

    context "given a valid node id" do

      before(:each) do
        @node = Factory(:node)
      end

      it "is successful" do
        get :show, :id => @node
        response.should be_success
      end

      it "has the right title"
      # What should the title be for nodes#show?

      it "finds the right node" do
        get :show, :id => @node
        assigns(:node).should == @node
      end
    end

    context "given an invalid node id" do

      it "renders an error page"

    end
  end

  describe "GET 'edit'" do

    context "given a valid node id" do

      before(:each) do
        @node = Factory(:node)
      end

      it "is successful" do
        get :edit, :id => @node
        response.should be_success
      end

      it "has the right title"

      it "finds the right node" do
        get :edit, :id => @node
        assigns(:node).should == @node
      end
    end

    context "given an invalid node id" do

      it "renders an error page"

    end
  end

  describe "PUT 'update'" do

    context "given invalid node data" do

      it "renders the 'edit' page"

      it "does not change the node"
    end

    context "given valid node data" do

      it "is successful"

      it "has the right title"

      it "updates the node's attributes"
    end
  end

  describe "DELETE 'destroy" do
    it "is successful"

    it "has the right title"
  end
end