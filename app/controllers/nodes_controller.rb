class NodesController < ApplicationController
  # GET /nodes
  # GET /nodes.json
  def index
    @title = "All Topics"
    @nodes = Node.find_all_by_category(:topic)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @nodes }
    end
  end

  # GET /nodes/new
  # GET /nodes/new.json
  def new
    @node = Node.new
    @source_id = params[:source_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @node }
    end
  end

  # POST /nodes
  # POST /nodes.json
  def create
    @node = Node.new(params[:node])
    @node.creator = current_user

    respond_to do |format|
      if @node.save
        if params[:source_id]
          @node.source_edges.create!(:source_id => params[:source_id])
        end
        format.html { redirect_to nodes_path, notice: 'Node was successfully created.' }
        format.json { render json: @node, status: :created, location: @node }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @node.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # GET /nodes/1
  # GET /nodes/1.json
  def show
    @node = Node.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @node }
    end
  end

  # GET /nodes/1/edit
  def edit
    @node = Node.find(params[:id])
  end

  # PUT /nodes/1
  # PUT /nodes/1.json
  def update
    @node = Node.find(params[:id])

    respond_to do |format|
      if @node.update_attributes(params[:node])
        format.html { redirect_to @node, notice: 'Node was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @node.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nodes/1
  # DELETE /nodes/1.json
  def destroy
    @node = Node.find(params[:id])
    @node.destroy

    respond_to do |format|
      format.html { redirect_to nodes_url }
      format.json { head :ok }
    end
  end
end
