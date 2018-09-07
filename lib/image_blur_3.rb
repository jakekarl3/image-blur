class Image

  attr_accessor :image, :coordinates

  def initialize(image)
    @image = image
  end

  def find
    coordinates = []

    image.each_with_index do |x,y|
      x.each_with_index do |a,b|
        if a == 1
          coordinates<<[y,b]
        end
      end
    end
  end

  def transform
    coordinates.each do |x|
      a = x[0]
      b = x[1]

      image[a-1][b] = 1 unless a == 0
      image[a+1][b] = 1 unless a == image.length - 1
      image[a][b-1] = 1 unless b == 0
      image[a][b+1] = 1 unless b == image[0].length - 1
    end
  end

  def blur(distance)
    distance.times do
      self.find
      self.transform
    end
  end    

  def output_image
    image.each do |x|
      puts x.join
    end
  end

end

# image = Image.new([
#   [0, 0, 0, 0],
#   [0, 0, 0, 0],
#   [0, 0, 0, 0],
#   [0, 1, 0, 0],
#   [0, 0, 0, 0],
#   [0, 0, 0, 0]
# ])

# image = Image.new([
#   [0, 0, 0, 0],
#   [0, 0, 1, 0],
#   [0, 0, 0, 0],
#   [0, 1, 0, 0],
#   [0, 0, 0, 0],
#   [0, 0, 0, 0]
# ])

# image = Image.new([
#   [0, 0, 0, 0],
#   [0, 0, 0, 0],
#   [0, 0, 0, 0],
#   [0, 0, 0, 0],
#   [1, 0, 0, 0],
#   [0, 0, 0, 0]
# ])

image = Image.new([
  [0, 0, 0, 1],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])

image.blur(2)
image.output_image