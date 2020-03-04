class ImageFacade
  attr_reader :id

  def initialize(location)
    @id = nil
    @location = location
  end

  def image_info
    image = ImageSummary.new(@location)
    image.single_image
  end
end
