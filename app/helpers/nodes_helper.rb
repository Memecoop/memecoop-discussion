module NodesHelper

  def reply_title(title)
    # Had to put this in bc of barfing on nodes without titles
    if (title)
      if title.start_with? "Re: "
        title
      else
        "Re: " + title
      end
    end
  end
end
