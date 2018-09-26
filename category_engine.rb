class CategoryEngine

  attr_reader :message

  def initialize(message)
    @message = message
  end

  def category
    return 'entertainment' if entertainment?
    return 'market' if market?
    return 'dinner' if dinner?
    'other'
  end

  private

  def entertainment?
    keywords = %w(beer party)

    keywords.any? do |keyword|
      raw_message.include?(keyword)
    end
  end

  def market?
    keywords = %w(market shopping)

    keywords.any? do |keyword|
      raw_message.include?(keyword)
    end
  end

  def dinner?
    keywords = %w(food dinner)

    keywords.any? do |keyword|
      raw_message.include?(keyword)
    end
  end

  def raw_message
    message.text.downcase
  end
end
