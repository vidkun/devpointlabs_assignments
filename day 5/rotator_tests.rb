require 'test/unit'
require_relative 'rotator'

class RotationTest < Test::Unit::TestCase
  def test_square_rotation
    square = [
      [0, 1, 0, 0],
      [0, 1, 1, 0],
      [0, 0, 1, 0],
      [0, 0, 0, 0]
    ]
    
    square_rotated = [
      [0, 0, 0, 0],
      [0, 1, 1, 0],
      [1, 1, 0, 0],
      [0, 0, 0, 0]
    ]
    
    assert_equal square_rotated, Matrix.rotate(square)
  end
  
  def test_rectangular_rotation
    rectangle = [
      [0, 1, 0],
      [1, 1, 1]
    ]
    
    rectangle_rotated = [
      [0, 1],
      [1, 1],
      [0, 1]
    ]
    
    assert_equal rectangle_rotated, Matrix.rotate(rectangle)
  end
end