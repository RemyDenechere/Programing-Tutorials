
program tuto_number

! ----- MATH OPERATORS -----
  real :: float_num = 1.111111111111111
  real :: float_num2 = 1.111111111111111
  double precision :: dbl_num = 1.1111111111111111d+0
  double precision :: dbl_num2 = 1.1111111111111111d+0
  real :: rand(1)
  integer :: low = 1, high = 10

  integer, parameter :: dp = kind(0.d0) ! double precision
  integer :: nGrid = 10
  integer :: idx, i
  real(dp), allocatable :: vect1(:), vect2(:), sumvect(:)
  

  allocate(vect1(nGrid))
  allocate(vect2(nGrid))
  allocate(sumvect(nGrid))


  print "(a8,i1)", "5 + 4 = ", 5 + 4
  print "(a8,i1)", "5 - 4 = ", (5 - 4)
  print "(a8,i2)", "5 * 4 = ", (5 * 4)
  print "(a8,i1)", "5 / 4 = ", (5 / 4)
  print "(a8,f8.5)", "5 / 4 = ", (5.0 / 4.0)
  ! Modulus
  print "(a8,i1)", "5 % 4 = ", mod(5,4)
  ! Exponentiation
  print "(a7,i3)", "5**4 = ", (5**4)

  ! ----- addition of arrays  -----
  do idx = 1, nGrid
    vect1(idx) = 1 + idx**2
    vect2(idx) = 1 + idx**0.5
  end do 
  sumvect = vect1 + vect2 
  
  print *, "vect1 = ", vect1
  print *, "vect2 = ", vect2
  print*, "vect1 + vect2 = ", sumvect


  ! ----- Do loops -----
  Do i = 1, 3, 3
    print*, i
  end Do 


  end program tuto_number