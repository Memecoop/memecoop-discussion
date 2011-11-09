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
end
