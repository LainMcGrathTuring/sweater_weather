class ImageFacade
  attr_reader :id,
              :location

  def initialize(location)
    @id = nil
    @location = location
  end

  def image_info
    image = ImageSummary.new(@location)
    image.single_image
  end
end
