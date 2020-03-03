require 'rails_helper'


RSpec.describe 'Antipode', :vcr do
  it 'can fidn antipode of Hong Kong' do
    get "/api/v1/antipode?location=Hong Kong"

    expect(response).to be_successful

    results = JSON.parse(response.body)
  end
end

#
# {
#     "data": [
#         {
#             "id": "1",
#             "type": "antipode",
#             "attributes": {
#                 "location_name": "Antipode City Name",
#                 "forecast": {
#                     "summary": "Mostly Cloudy,
#                     "current_temperature": "72",
#                                 },
#             "search_location": "Hong Kong"
#             }
#         }
#     ]
# }
