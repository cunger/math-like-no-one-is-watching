program tests
  use matrix_operations
  implicit none

  integer, dimension(3, 2) :: matrix = 0

  matrix = reshape( [1, 3, 5, 2, 4, 6], [3, 2])

  write (*,*) matrix
  write (*,*) swap_rows(2, 3, matrix)
  write (*,*) scale_row(1, 10, matrix)
  write (*,*) add_scaled_row(2, 10, 1, matrix)
end program tests
