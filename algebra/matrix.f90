module matrix_operations
  implicit none

contains

  ! Basic row operations.

  function swap_rows(i, j, matrix) result(new_matrix)
    implicit none

    ! Swapping rows i and j in matrix.

    integer, intent(in) :: i, j
    integer, dimension(:,:), intent(in) :: matrix
    integer, dimension(size(matrix, 1), size(matrix, 2)) :: new_matrix

    new_matrix = matrix
    new_matrix(i,:) = matrix(j,:)
    new_matrix(j,:) = matrix(i,:)
  end function swap_rows

  function scale_row(i, scalar, matrix) result(new_matrix)
    implicit none

    ! Scalar multiplication of row i in matrix with scalar:
    ! row i = scalar * i

    integer, intent(in) :: i, scalar
    integer, dimension(:,:), intent(in) :: matrix
    integer, dimension(size(matrix, 1), size(matrix, 2)) :: new_matrix

    new_matrix = matrix
    new_matrix(i,:) = scalar * matrix(i,:)
  end function scale_row

  function add_scaled_row(i, scalar, j, matrix) result(new_matrix)
    implicit none

    ! Adding to row i in matrix the result of scaling row j with scalar:
    ! row i = i + scalar * j

    integer, intent(in) :: i, scalar, j
    integer, dimension(:,:), intent(in) :: matrix
    integer, dimension(size(matrix, 1), size(matrix, 2)) :: new_matrix

    new_matrix = matrix
    new_matrix(i,:) = matrix(i,:) + scalar * matrix(j,:)
  end function add_scaled_row
end module matrix_operations
