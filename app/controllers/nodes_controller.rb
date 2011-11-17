class NodesController < ApplicationController
  filter_resource_access
  filter_access_to :feedback, :require => :create

  # GET /nodes
  # GET /nodes.json
  def index
    @title = "All Nodes"
    @nodes = Node.order(:id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @nodes }
    end
  end

  # GET /nodes/new
  # GET /nodes/new.json
  def new
    @submit_text = "Create"
    @node = Node.new(:title => params[:title])
    @topic_id = params[:topic_id]
    @source_id = params[:source_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @node }
    end
  end

  # GET /nodes/feedback
  def feedback
    @submit_text = "Leave Feedback"

    # Check for "feedback?path" in the URL, to avoid recursive feedback-on-feedback-on- ...
    if /feedback\?path/i =~ params[:path]
      redirect_to feedback_path(:path => feedback_path)
    else
      title = "Feedback: [Summarize your feedback here]"
      content = "[Provide detailed feedback here.]\n\n" +
                "(For page: " + params[:path] + ")"

      @node = Node.new(:title => title, :content => content)

      respond_to do |format|
        format.html { render "new" }
        format.json { render json: @node }
      end
    end
  end

  # POST /nodes
  # POST /nodes.json
  def create
    @node = Node.new(params[:node])
    @node.creator = current_user

    respond_to do |format|
      if @node.save
        if params[:topic_id]
          @node.topic_node_memberships.create!(:topic_id => params[:topic_id])
        end
        if params[:source_id]
          @node.source_edges.create!(:source_id => params[:source_id])
          source = Node.find(params[:source_id])
          source.topics.each do |t|
            @node.topic_node_memberships.create!(:topic_id => t.id)
          end
        end
        format.html { redirect_to :back, notice: 'Post was successfully created.' }
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
    @title = @node.title

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @node }
    end
  end

  # GET /nodes/1/edit
  def edit
    @submit_text = "Update"
    @node = Node.find(params[:id])
  end

  # PUT /nodes/1
  # PUT /nodes/1.json
  def update
    @node = Node.find(params[:id])

    respond_to do |format|
      if @node.update_attributes(params[:node])
        format.html { redirect_to @node, notice: 'Post was successfully updated.' }
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
      format.html { redirect_to nodes_path }
      format.json { head :ok }
    end
  end
end
