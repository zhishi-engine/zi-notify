class AiResponse
  def initialize(color = nil)
    @response = {}
    @response[:color] = color if color
    @response[:fields] = []
  end

  def add_pretext(text)
    @response[:pretext] = text
  end

  def set_title(title, title_link=nil)
    @response[:title] = title
    @response[:title_link] = title_link
  end

  def add_text(text)
    @response[:text] = text
  end

  def add_field(title, value, short = false)
    @response[:fields].push({
      title: title,
      value: value,
      short: short
      })
  end

  def speech_and_displaytext(speech, display_text=nil)
    @speech = speech
    @display_text = display_text || speech
  end

  def package_response
    package = { speech: @speech }
    package[:displayText] = @display_text
    package[:data] = {
      slack: { attachments: [@response] }
    }
    package
  end
end
