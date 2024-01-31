program fortrantut
    implicit none
    character*20 :: name ! define character variable
    character (len = 20) :: first_name, last_name
      
    print *, "hello, what's your name? "
    read *, first_name, last_name  ! ask to type the character name
    print *, "hello ", trim(first_name), "  ", trim(last_name) ! trim is to remove the extra character not needed.
    
end program fortrantut