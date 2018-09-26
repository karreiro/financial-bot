class GoogleSheetsApi

  attr_reader :spreadsheet_id

  def initialize(spreadsheet_id)
    @spreadsheet_id = spreadsheet_id
  end

  def append_data(values)

    range = "#{sheet_name}!A1"
    range_value = Google::Apis::SheetsV4::ValueRange.new(values: values)

    service.append_spreadsheet_value(spreadsheet_id,
                                     range,
                                     range_value,
                                     value_input_option: 'USER_ENTERED')
  end

  def create_sheet
    service.batch_update_spreadsheet(spreadsheet_id, batch_update_request, {})
  end

  private

  def batch_update_request

    gray = { "red": 0.8, "green": 0.8, "blue": 0.8 }
    three_columns = { "row_count": 1, "column_count": 5 }

    {
      requests: [
        {
          add_sheet: {
            properties: {
              "title": sheet_name,
              "grid_properties": three_columns,
              "tab_color": gray
            }
          }
        }
      ]
    }
  end

  def sheet_name
    Date.today.strftime("%m%Y")
  end

  def service
    @service ||= Google::Apis::SheetsV4::SheetsService.new.tap do |sheets_service|
      sheets_service.authorization = authorization
    end
  end

  def authorization
    Google::Auth.get_application_default(auth_spreadsheets)
  end

  def auth_spreadsheets
    Google::Apis::SheetsV4::AUTH_SPREADSHEETS
  end
end
