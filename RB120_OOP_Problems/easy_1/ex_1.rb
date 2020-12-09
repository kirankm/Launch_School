class Banner
  attr_reader :message
  def initialize(message, banner_width = nil)
    if banner_width
      @banner_width = [banner_width, message.size].max
    else
      @banner_width = message.size
    end
    @message = message.center(@banner_width)
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+" + "-" * (message.length + 2) + "+"
  end

  def empty_line
    "|" + " " * ( message.length + 2) + "|"
  end

  def message_line
    "| #{@message} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner

banner = Banner.new('')
puts banner

banner = Banner.new('', 10)
puts banner
