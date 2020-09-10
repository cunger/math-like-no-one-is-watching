module matrix_operations
  implicit none

contains

  function swap_rows(i, j, matrix) result(new_matrix)
    implicit none

    integer, intent(in) :: i, j
    integer, dimension(:,:), intent(in) :: matrix
    integer, dimension(size(matrix, 1), size(matrix, 2)) :: new_matrix

    new_matrix = matrix
    new_matrix(i,:) = matrix(j,:)
    new_matrix(j,:) = matrix(i,:)
  end function swap_rows

  function scale_row(i, scalar, matrix) result(new_matrix)
    implicit none

    integer, intent(in) :: i, scalar
    integer, dimension(:,:), intent(in) :: matrix
    integer, dimension(size(matrix, 1), size(matrix, 2)) :: new_matrix

    new_matrix = matrix
    new_matrix(i,:) = scalar * matrix(i,:)
  end function scale_row

  function add_scaled_row(i, scalar, j, matrix) result(new_matrix)
    implicit none

    integer, intent(in) :: i, scalar, j
    integer, dimension(:,:), intent(in) :: matrix
    integer, dimension(size(matrix, 1), size(matrix, 2)) :: new_matrix

    new_matrix = matrix
    new_matrix(i,:) = matrix(i,:) + scalar * matrix(j,:)
  end function add_scaled_row
end module matrix_operations
