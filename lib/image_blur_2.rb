class Image

  attr_accessor :image, :coordinates

  def initialize(image)
    @image = image
  end

  def find
    @coordinates = []

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
      top = 0
      bottom = image.length - 1
      left = 0
      right = image[0].length - 1

      if a == top && b == left
        image[a+1][b] = 1
        image[a][b+1] = 1
      elsif a == bottom && b == left
        image[a-1][b] = 1
        image[a][b+1] = 1
      elsif a == top && b == right
        image[a+1][b] = 1
        image[a][b-1] = 1
      elsif a == bottom && b == right
        image[a-1][b] = 1
        image[a][b-1] = 1
      elsif a == top
        image[a+1][b] = 1
        image[a][b+1] = 1
        image[a][b-1] = 1
      elsif a == bottom
        image[a-1][b] = 1
        image[a][b+1] = 1
        image[a][b-1] = 1
      elsif b == left
        image[a-1][b] = 1
        image[a+1][b] = 1
        image[a][b+1] = 1
      elsif b == right
        image[a-1][b] = 1
        image[a+1][b] = 1
        image[a][b-1] = 1
      else
        image[a-1][b] = 1
        image[a+1][b] = 1
        image[a][b+1] = 1
        image[a][b-1] = 1
      end
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
  [0, 0, 0, 0],
  [1, 0, 1, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [1, 0, 0, 1]
])

image.find
image.transform
image.output_image