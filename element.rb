class Element
  attr_reader :begin, :end, :sense

  def initialize(data)
    @begin = data[0].to_i
    @end = data[1].to_i
    @sense = data[2]
  end

  def reversed?
    sense == 'C'
  end

  def length
    @end - @begin
  end
end
