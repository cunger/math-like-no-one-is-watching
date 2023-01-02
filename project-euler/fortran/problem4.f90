! ----------------------------------------------------------------------------
! Project Euler - Problem 4
! https://projecteuler.net/problem=4
!
! A palindromic number reads the same both ways. The largest palindrome made
! from the product of two 2-digit numbers is 9009 = 91 × 99.
!
! Find the largest palindrome made from the product of two 3-digit numbers.
! ----------------------------------------------------------------------------

program problem4
  implicit none

  integer :: left, right
  integer :: product
  integer :: max_product

  max_product = 0

  do left = 999, 100, -1
    do right = 999, 100, -1
      product = left * right
      if (product > max_product .and. palindromic(product)) then
        max_product = product
      end if
    end do
  end do

  print *, max_product

contains

  function palindromic(num) result(bool)
    implicit none

    integer, intent(in) :: num
    character(len=6) :: str ! num as string
    character :: format
    logical :: bool

    write(str, '(I6)') num
    str = trim(str)

    bool = (str == reverse(str))
  end function palindromic

  function reverse(string) result(gnirts)
    implicit none

    character(len=*), intent(in) :: string
    character(len=len(string)) :: gnirts
    integer :: i, length

    length = len(string)
    do i = 1, length
      gnirts(length-i+1:length-i+1) = string(i:i)
    end do
  end function reverse
end program problem4
