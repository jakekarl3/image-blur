class Image
  attr_accessor :data, :coordinates

  def initialize(data)
    @data = data
    @coordinates = []
  end

  def find
    data.each_with_index do |x,y|
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

      data[a-1][b] = 1 unless a == 0
      data[a+1][b] = 1 unless a == data.length - 1
      data[a][b-1] = 1 unless b == 0
      data[a][b+1] = 1 unless b == data[0].length - 1
    end
    self
  end

  def blur(distance=1)
    distance.times do
      self.find
      self.transform
    end

    return Image.new(@data)
  end
end