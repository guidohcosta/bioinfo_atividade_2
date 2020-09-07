class Sequence
  attr_reader :element, :lib

  def initialize(content, element)
    @element = element
    @lib = content.slice(element.begin, element.length)
    @lib.reverse! if element.reversed?
  end
end
