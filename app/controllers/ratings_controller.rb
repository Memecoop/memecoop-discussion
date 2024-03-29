class RatingsController < ApplicationController
  filter_resource_access

  # POST /ratings
  # POST /ratings.json
  def create
    @rating = Rating.new(:user_id => current_user.id,
                         :node_id => params[:node_id],
                         :key => :like,
                         :value => 1)

    respond_to do |format|
      if @rating.save
        format.html { redirect_to nodes_path,
                      :flash => { :success => 'Rating was successfully created.' } }
        format.js { render :nothing => true }
      end
    end
  end
end
