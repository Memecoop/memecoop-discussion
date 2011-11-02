class EdgesController < ApplicationController
  filter_resource_access

  # GET /edges
  # GET /edges.json
  def index
    @title = "All Edges"
    @edges = Edge.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @edges }
    end
  end

  # GET /edges/new
  # GET /edges/new.json
  def new
    @submit_text = "Create"
    @edge = Edge.new(:source_id => params[:source_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @edge }
    end
  end

  # POST /edges
  # POST /edges.json
  def create
    @edge = Edge.new(params[:edge])
    # @edge.creator = current_user

    respond_to do |format|
      if @edge.save
        format.html { redirect_to nodes_path, notice: 'Edge was successfully created.' }
        format.json { render json: @edge, status: :created, location: @edge }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @edge.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /edges/1
  # DELETE /edges/1.json
  def destroy
    @edge = Edge.find(params[:id])
    @edge.destroy

    respond_to do |format|
      format.html { redirect_to edges_path }
      format.json { head :ok }
    end
  end
end
