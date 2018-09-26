class FinanceSpreadsheet

  attr_reader :google_sheets_api

  def initialize
    @google_sheets_api = GoogleSheetsApi.new(ENV['SPREADSHEET_ID'])
  end

  def append_expense(finance_entry)
    append_data(finance_entry)
  rescue
    create_sheet(finance_entry)
  end

  private

  def append_data(finance_entry)
    google_sheets_api.append_data(finance_entry.raw)
  end

  def create_sheet(finance_entry)
    google_sheets_api.create_sheet
    google_sheets_api.append_data(finance_entry.raw)
  end
end
