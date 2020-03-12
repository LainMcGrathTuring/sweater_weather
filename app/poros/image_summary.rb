class ImageSummary

  attr_reader :image

  def initialize(location)
    @image = ImageFetcher.new.get_image(location)
    @location = location
  end

  def single_image
    single_image = image[:results].sample
    @image_results = {
      alt_description: single_image[:alt_description],
      height: single_image[:height],
      width: single_image[:width],
      urls: single_image[:urls],
      city: @location.city,
      country: @location.country
    }
  end
end
