module  abstract_type
    inplicit none
    private 

    ! abstract: showcase cannot be used as a variable or anything from nowon
    type, abstract :: showcase 
    contains 
    ! Define a procedure 

    end type 
    
    ! Allocate to variable the type showcase. 
    class(showcase) :: variable 
    
    

end module 
