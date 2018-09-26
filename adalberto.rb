class Adalberto

  attr_reader :message

  def initialize(message)
    @message = message
  end

  def execute!
    return unless message.valid?
    return unless message.valid_sender?

    if message.expense?
      say append_expense(message)
    else
      say excuse(message)
    end
  end

  private

  def append_expense(message)
    finance_spreadsheet.append_expense finance_entry(message)
    success
  rescue
    'Oops... Something went wrong! ☹️'
  end

  def success
    [
      'Ok... done! 😉',
      'Done! 😁',
      'Ok, ok... done 😒',
    ].sample
  end

  def finance_entry(message)
    FinanceEntry.new(message)
  end

  def excuse(message)
    [
      'I\'m not sure if I can help you right now.. 🧐',
      'IDK.. 🤔',
      'Hmmmmmmmmmm.. 😶',
    ].sample
  end

  def say(message)
    telegram.send(message)
  end

  def finance_spreadsheet
    @finance_spreadsheet ||= FinanceSpreadsheet.new
  end

  def telegram
    @telegram = Telegram.new
  end
end
