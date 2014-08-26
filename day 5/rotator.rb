# Ex:

# 0 0 0 0
# 0 X 0 0
# X X X 0
# 0 0 0 0

# 0 0 0 0
# 0 0 X 0
# 0 X X 0
# 0 0 X 0

class Matrix

  def self.rotate(matrix)
      # get dimensions
      rows = matrix.size
      columns = matrix[0].size

      # create new array with swapped dimensions, and reverse the values
      rotated = Array.new(columns) { |c| Array.new(rows) { |r| matrix[r][columns - c -1 ] } }
  end
end
