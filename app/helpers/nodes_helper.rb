module NodesHelper

  def reply_title(title)
    if title.nil?
      "Re:"
    elsif title.start_with? "Re:"
      title
    else
      "Re: " + title
    end
  end

  def total_rating(node)
    node.ratings.reduce(0) { |sum, r| sum += (r.key.to_sym == :like ? r.value : 0) }
  end

  def rating_markup(node)
    concat "Score: "
    concat total_rating(node)
    if permitted_to?(:create, Rating.new)
      unless node.ratings.detect { |r| (r.user == current_user && r.key == "like") }
        concat " "
        concat link_to("(+)", ratings_path(:node_id => node.id), :method => :post)
      end
    end
  end
end
