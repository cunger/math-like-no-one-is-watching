include("matrix_operations.jl")
using MatrixOperations

function gauss_jordan_elimination(matrix::Matrix)
  rows = size(matrix)[1] # number of rows
  cols = size(matrix)[2] # number of columns

  curr_row = 0
  for c in 1:cols
    curr_row += 1

    # 1 | Find first row that has a non-zero element at position c.
    for r = 1:rows
      if matrix[r,c] != 0
        swap_rows(curr_row, r, matrix)
        break
      end
    end

    pivot = matrix[curr_row, c]

    # If whole column is 0, move to next one.
    if pivot == 0 continue end

    # 2 | Make pivot element 1.
    if pivot != 1
      scale_row(curr_row, 1/pivot, matrix)
    end

    # 3 | Make all other column elements 0.
    for r = 1:rows
      if r == curr_row continue end
      if matrix[r,c] == 0 continue end

      add_scaled_row(r, - matrix[r,c], curr_row, matrix)
    end
  end
end

end # module

m = [ 0 1 2; 3 4 5 ]
MatrixOperations.gauss_jordan_elimination(m)
println(m)
