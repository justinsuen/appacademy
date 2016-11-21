class Card
  attr_reader :face_value
  attr_accessor :position

  def initialize(face_value, position = :down)
    @face_value = face_value
    @position = position
  end

  def hide
    @position = :down
  end

  def reveal
    @position = :up
  end

  def face_up?
    position == :up
  end

  def to_s
    face_value.to_s
  end

  def ==(other)
    face_value == other.face_value
  end
end
