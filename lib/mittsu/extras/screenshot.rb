require 'chunky_png'

module Mittsu
  class Screenshot
    def initialize(width:, height:, data:, filename: 'screenshot')
      pixels = data.pack(("x" + ('NX' * width)) * height).unpack("NX" * (width * height))
      pixels.map! { |pixel| pixel | 0x000000ff }
      png = ChunkyPNG::Image.new(width, height, pixels)
      png.save("#{filename}_#{Time.now.strftime('%Y_%m_%d_%H_%M_%S')}.png")
    end
  end
end
