program Matrix_multiplication
    implicit none
    integer, parameter :: n = 3, m = 2  ! Dimensions: A(n, m) and B(m)
    real :: A(m, n), B(m, n), C(m, n)      ! Declare matrix and vector
    
    integer :: i

    ! DEFINITION OF TYPE FOR FEISTY
    type FEISTY_type
        real, dimension(8, 11) :: Pref_mat, biomass_mat, result
        real, dimension(11)     :: biomass = (/1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11/)
        real :: pref_Mz = 1                 ! Preference Small fish for medium mesozooplankton group
        ! Medium Forage 
        real :: pref_Mf_Mz =0.5              ! Preference for Medium Mesozooplankton   
        real :: pref_Mf_Lz = 1             ! Preference for Large Mesozooplankton
        real :: pref_Mf_S = 1              ! Preference for small fish
        ! Medium pelagic 
        real :: pref_Mp_Mz =0.5             ! Preference for Medium Mesozooplankton
        real :: pref_Mp_Lz = 1             ! Preference for Large Mesozooplankton
        real :: pref_Mp_S = 1              ! Preference for small fish
        ! Medium Demersal 
        real :: pref_Md_BE =1             ! Preference for Benthos
        ! Large Pelagic
        real :: pref_Lp_Mf  =1            ! Preference for Medium forage
        real :: pref_Lp_Mp =1
        ! Large Demersal
        real :: pref_Ld_Mf   = 1           ! Preference for Medium forage
        real :: pref_Ld_Mp   = 1           ! Preference for Medium pelagics
        real :: pref_Ld_Md   = 0.5           ! Preference for Medium Demersal
        real :: pref_Ld_BE   = 1          ! Preference for Benthos
    end type 

    type(FEISTY_type) :: FEISTY


    ! Initialize matrix A and vector B
    A = reshape([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], [m, n])
    B = reshape([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], [m, n])  ! 1D vector (rank-1 array)

    ! Element-wise multiplication: C = A * B
    C = A * B ! Reshape B to match row size

    ! Print the result matrix C
    print *, "Matrix A:"
    do i = 1, m
        print*, A(i, :)
    end do

    print *, "Vector B:"
    do i = 1, m
        print*, B(i, :)
    end do

    print *, "Matrix C (Element-wise multiplication):"
    do i = 1, m
        print *, C(i, :)
    end do

    ! TEST FOR FEISTY MULTIPLICATION OF PREFERENCE AND BIOMASS VECTOR
    FEISTY%Pref_mat = transpose(reshape([FEISTY%pref_Mz,    0.0,               0.0,               0.0,                0.0,    &
                                        0.0,    0.0,                0.0,                0.0,                0.0, 0.0, & ! Small Forage
                                        FEISTY%pref_Mz,    0.0,               0.0,               0.0,                0.0,  &
                                        0.0,                0.0,                0.0,             0.0,                0.0, 0.0, & ! Small Pelagic
                                        FEISTY%pref_Mz,    0.0,               0.0,               0.0,                0.0,      &
                                        0.0,                0.0,                0.0,       0.0,                0.0, 0.0, & ! Small Demersal
                                        FEISTY%pref_Mf_Mz, FEISTY%pref_Mf_Lz, 0.0,     FEISTY%pref_Mf_S,   FEISTY%pref_Mf_S,   &
                                        FEISTY%pref_Mf_S,   0.0,                0.0,    0.0,                0.0, 0.0, & ! Medium Forage
                                        FEISTY%pref_Mp_Mz, FEISTY%pref_Mp_Lz, 0.0,     FEISTY%pref_Mp_S,   FEISTY%pref_Mp_S,   &
                                        FEISTY%pref_Mp_S,   0.0,                0.0,   0.0,                0.0, 0.0, & ! Medium Pelagic
                                        0.0,               0.0,   FEISTY%pref_Md_BE, 0.0,                0.0,                &
                                        0.0,                0.0,                0.0,  0.0,                0.0, 0.0, & ! Medium Demersal
                                        0.0,               0.0,               0.0,   0.0,                0.0,                &
                                        0.0,                FEISTY%pref_Lp_Mf,  FEISTY%pref_Lp_Mp,  0.0,    0.0, 0.0, & ! Large Pelagic
                                        0.0,               0.0,               FEISTY%pref_Ld_BE, 0.0,  0.0,                &
                                        0.0, FEISTY%pref_Ld_Mf,  FEISTY%pref_Ld_Mp,  FEISTY%pref_Ld_Md,  0.0, 0.0  & ! Large Demersal 
                                        ], [11, 8]))
    
    
    FEISTY%biomass_mat = spread(FEISTY%biomass, 1, 8)                                     
    FEISTY%result = FEISTY%Pref_mat * FEISTY%biomass_mat
    
    ! Preference matrix
    print* , "Pref_mat dimensions", size(FEISTY%Pref_mat, 1), size(FEISTY%Pref_mat, 2)
    print* , "Pref_mat values: "
    do i = 1, 8
        print '(11(F6.2, 1X))', FEISTY%Pref_mat(i, :)
    end do
    print* , "Pref_mat values second print: "
    print '(11(F6.2, 1X))', FEISTY%Pref_mat
    print*, "Biomass dimensions", size(FEISTY%biomass, 1)
    print*, "Biomass = ", FEISTY%biomass

    ! Biomass as a matrix 
    print*, "Biomass_mat dimensions", size(FEISTY%biomass_mat, 1), size(FEISTY%biomass_mat, 2)
    do i = 1, 8
        print '(11(F6.2, 1X))', FEISTY%biomass_mat(i, :)
    end do
    ! results
    print*, "result dimensions", size(FEISTY%result, 1), size(FEISTY%result, 2)
    do i = 1, 8
        print '(11(F6.2, 1X))', FEISTY%result(i, :)
    end do

end program Matrix_multiplication