module NodesHelper

  def reply_title(title)
    if title.start_with? "Re: "
      title
    else
      "Re: " + title
    end
  end
end
