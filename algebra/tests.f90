program tests
  use matrix_operations
  implicit none

  integer, dimension(3, 2) :: matrix = 0
  integer, dimension(3, 2) :: swapped
  integer, dimension(3, 2) :: scaled

  matrix = reshape( [1, 3, 5, 2, 4, 6], [3, 2])

  write (*,*) matrix
  write (*,*) swap_rows(1, 1, matrix)

  swapped = swap_rows(2, 3, matrix)

  write (*,*) swapped

  matrix(1, 1) = 0
  write (*,*) swapped

  scaled = scale_row(1, 10, matrix)

  write (*,*) scaled

  write (*,*) add_scaled_row(2, 10, 1, matrix)
end program tests
