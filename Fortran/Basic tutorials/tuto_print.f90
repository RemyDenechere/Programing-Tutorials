program tuto_print
! tutorial about print function
    implicit none

    print *, "A number ", 10 ! classic print
! format Integer: 
    print "(3i5)", 7, 8, 9 ! 3 integer 5 spaces
    print "(i5)", 7, 8, 9 ! 1 integer(default) 5 spaces

! format floats: 
    print "(2f8.5)", 1.2345, 1.344 ! 3 floats 8 spaces 5 decimals
    print "(2f8.2)", 1.2345, 1.344

! format characters: 
    print "(/, 2a8)", "NAME", "age"
! power
    print "(e10.3)", 123.456
!combined several type: 
    print "(a5, i2)", "I am ", 28

end program tuto_print