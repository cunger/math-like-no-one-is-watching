module MatrixOperations

export matrix_multiplication
export swap_rows, scale_row, add_scaled_row

# Basic row operations

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

# Matrix multiplication
# The inefficient way, corresponding to how one would do it by hand.
function matrix_multiplication(m1::Matrix, m2::Matrix)
  rows1 = size(m1)[1] # number of rows in m1
  rows2 = size(m2)[1] # number of rows in m2
  cols1 = size(m1)[2] # number of columns in m1
  cols2 = size(m2)[2] # number of columns in m2

  if (cols1 != rows2)
    return # TODO exception
  end

  product = zeros(rows1, cols2)

  for r in 1:rows1
    row = m1[r,:]
    for c in 1:cols2
      col = m2[:,c]
      product[r, c] = sum([row[i] * col[i] for i in 1:rows2])
    end
  end

  product
end

Base.:*(m1::Matrix, m2::Matrix) = matrix_multiplication(m1, m2)

end
