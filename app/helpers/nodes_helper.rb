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
    concat "<span class=\"rating_number\">".html_safe()
    concat total_rating(node)
    concat "</span>".html_safe()
    if permitted_to?(:create, Rating.new)
      unless node.ratings.detect { |r| (r.user == current_user && r.key == "like") }
        concat " "
        concat link_to("(+)", ratings_path(:node_id => node.id), :remote => true, :method => :post, :class => "rate_link")
      end
    end
  end

  def render_node(node, options = {})
    init_options(options)
    render :partial => 'nodes/node', :locals => {:node => node, :options => options}
  end

  def traverse_node_tree(nodes, options = {}, &lookup_children)
    ret = ''
    return ret if nodes.empty?

    init_options(options)

    ret << "<ul class=\"sibling_node_list\">\n"
    nodes.each do |n|
      ret << "<li class=\"node_container round\">\n"
      ret << render_node(n, options)
      new_options = options.merge({:depth => options[:depth] + 1})
      ret << traverse_node_tree(lookup_children.call(n), new_options, &lookup_children)
      ret << "</li>"
    end
    ret << "</ul>\n"
    return ret.html_safe
  end

  def render_new_node_link(options = {})
    render :partial => "shared/new_node_link",
           :locals => {
             :topic_id => options[:topic_id],
             :source_id => options[:source_id]
           }
  end

  private

  def init_options(options)
    options[:depth] ||= 0
  end
end
