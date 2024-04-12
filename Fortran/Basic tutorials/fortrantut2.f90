program fortrantut2
    implicit none
    real, parameter :: PI = 3.1415
    REAL :: r_num = 0.0, r_num2 = 0.1 ! 6 digits precision
    double precision :: r_num3 = 0.10000000001d+0 ! 12 digits precision
    integer :: i_1 = 0, i_2 = 1 
    logical :: can_vote = .true.
    character(len=10) :: month
    complex :: con = (2.1, 4.0)

    print *, "biggest Real ", huge(r_num)
    print *, "biggest Int ", huge(i_1)
    print *, "smallest Real ", tiny(r_num)
    ! print *, "smallest Int", tiny(i_1)
    print "(a4, i1)", "Int ", kind(i_1)
    print "(a5, i1)", "Real ", kind(i_1)
    print "(a7, i1)", "Double ", kind(r_num3)
    print "(a8, i1)", "Logical ", kind(can_vote)

end program fortrantut2

