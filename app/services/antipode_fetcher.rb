class AntipodeFetcher

  def get_antipode(location_coordinates)
    response = Faraday.get("http://amypode.herokuapp.com/api/v1/antipodes") do |req
      req.headers['api_key'] = ENV['ANTIPODE']
    end
    response
    require "pry"; binding.pry
  end

end
