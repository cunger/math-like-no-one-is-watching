module arithmetic
  implicit none

  integer, parameter:: dp = kind(0.d0) ! double precision

  contains

  real(dp) function arithmetic_sum (n, a_1, a_n) result(sum)
    implicit none

    ! Calculates the sum of an arithmetic sequence using the
    ! artihmetic series formula: sum = 0.5 * n * (a_1 + a_n)
    ! Where n the number of elements in the sequence,
    ! a_1 is the first and a_n is the last element.

    integer, intent(in) :: n    ! number of elements in the sequence
    integer, intent(in) :: a_1  ! first element
    integer, intent(in) :: a_n  ! last element

    sum = 0.5 * n * (a_1 + a_n)

    return
  end function arithmetic_sum
end module arithmetic
