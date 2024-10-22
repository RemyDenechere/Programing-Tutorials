program Matrix_multiplication
    implicit none
    integer, parameter :: n = 3, m = 2  ! Dimensions: A(n, m) and B(m)
    real :: A(m, n), B(m, n), C(m, n)      ! Declare matrix and vector
    integer :: i

    ! DEFINITION OF TYPE FOR FEISTY
    type FEISTY_type
        real, dimension(8, 11) :: Pref_mat
        real, dimension(8)     :: biomass = (/1, 1, 1, 1, 1, 1, 1, 1/)
        real :: pref_Mz                 ! Preference Small fish for medium mesozooplankton group
        ! Medium Forage 
        real :: pref_Mf_Mz              ! Preference for Medium Mesozooplankton   
        real :: pref_Mf_Lz              ! Preference for Large Mesozooplankton
        real :: pref_Mf_S               ! Preference for small fish
        ! Medium pelagic 
        real :: pref_Mp_Mz              ! Preference for Medium Mesozooplankton
        real :: pref_Mp_Lz              ! Preference for Large Mesozooplankton
        real :: pref_Mp_S               ! Preference for small fish
        ! Medium Demersal 
        real :: pref_Md_BE              ! Preference for Benthos
        ! Large Pelagic
        real :: pref_Lp_Mf              ! Preference for Medium forage
        real :: pref_Lp_Mp
        ! Large Demersal
        real :: pref_Ld_Mf              ! Preference for Medium forage
        real :: pref_Ld_Mp              ! Preference for Medium pelagics
        real :: pref_Ld_Md              ! Preference for Medium Demersal
        real :: pref_Ld_BE              ! Preference for Benthos
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
    FEISTY%Pref_mat =transpose(reshape([FEISTY%pref_Mz,    0.0,               0.0,               0.0,                0.0,    &
    0.0,                0.0,                0.0,                0.0,                0.0, 0.0, & ! Small Forage
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
    
    print*, "Pref_mat dimensions", size(FEISTY%Pref_mat, 1), size(FEISTY%Pref_mat, 2)
    do i = 1, 8
        print*, FEISTY%Pref_mat(i, :)
    end do
    print*, "Biomass dimensions", size(FEISTY%biomass, 1)
    print*, "Biomass = ", FEISTY%biomass

end program Matrix_multiplication