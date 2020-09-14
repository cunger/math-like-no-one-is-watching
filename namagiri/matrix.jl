# Matrix row operations

function swap_rows(i::Int64, j::Int64, matrix::Matrix)
  row_i = matrix[i,:]
  row_j = matrix[j,:]
  matrix[i,:] = row_j
  matrix[j,:] = row_i
  matrix
end

function scale_row(i::Int64, scalar, matrix::Matrix)
  row_i = matrix[i,:]
  matrix[i,:] = map(x -> scalar * x, row_i)
  matrix
end

function add_scaled_row(i::Int64, scalar, j::Int64, matrix::Matrix)
  row_i = matrix[i,:]
  row_j = matrix[j,:]
  matrix[i,:] = row_i + map(x -> scalar * x, row_j)
  matrix
end

# Gauss-Jordan elimination

# TODO
# for col in 1:size(matrix)[2]
#   for row in 1:size(matrix)[1]
#     matrix[row, col]
#   end
# end

# Tests

matrix = [1 2 3; 4 5 6; 7 8 9]
println(matrix)
println(swap_rows(2, 3, matrix))
println(scale_row(1, 10, matrix))
println(add_scaled_row(1, 2, 2, matrix))
