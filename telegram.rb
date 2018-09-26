class Telegram
  def send(message)
    HTTParty.get url(message)
  end

  private

  def url(message)
    escaped_message = CGI::escape(message.to_s)
    "https://api.telegram.org/#{ENV['TELEGRAM_TOKEN']}/sendMessage?chat_id=#{ENV['TELEGRAM_ID']}&text=#{escaped_message}"
  end
end
