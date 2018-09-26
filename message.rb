class Message

  attr_reader :json

  def initialize(json)
    @json = json
  end

  def valid_sender?
    sender_id.to_i == ENV['TELEGRAM_ID'].to_i
  end

  def valid?
    !!message
  end

  def expense?
    /.*([Ss]pent).*\d.*/ =~ text
  end

  def id
    message['message_id']
  end

  def date
    Time.at(message['date']).strftime("%d/%m/%Y")
  end

  def expense_value
    matches = text.match /(?<value>\d{1,}.\d{0,2})/
    matches[:value].to_f if matches
  end

  def sender_id
    from['id'] if from
  end

  def text
    message['text'] if message
  end

  private

  def from
    message['from'] if message
  end

  def message
    json['message'] if json
  end
end
