class FinanceEntry

  attr_reader :message

  def initialize(message)
    @message = message
  end

  def raw
    [[id, date, value, category, raw_message]]
  end

  private

  def id
    message.id
  end

  def date
    message.date
  end

  def value
    message.expense_value
  end

  def category
    category_engine.category
  end

  def category_engine
    CategoryEngine.new(message)
  end

  def raw_message
    message.text
  end
end
