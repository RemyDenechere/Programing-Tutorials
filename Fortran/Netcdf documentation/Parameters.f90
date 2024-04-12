module Parameters

    implicit none 

    ! input files: ----------------------------------------------------
    character(LEN=280), parameter :: &
    
    ! To use in UCAR -----------------------------------------------------------------
    ! dir_Tb = "/glade/campaign/cesm/development/bgcwg/projects/CESM2-OMIP2-like-4p2z-run/g.e22.GOMIPECOIAF_JRA-1p4-2018.TL319_g17.4p2z.001branch/ocn/proc/tseries/day_1/g.e22.GOMIPECOIAF_JRA-1p4-2018.TL319_g17.4p2z.001branch.pop.h.ecosys.nday1.TEMP_BOTTOM_2.19580101-20211231.nc", &
    ! dir_Tp = "/glade/campaign/cesm/development/bgcwg/projects/CESM2-OMIP2-like-4p2z-run/g.e22.GOMIPECOIAF_JRA-1p4-2018.TL319_g17.4p2z.001branch/ocn/proc/tseries/day_1/g.e22.GOMIPECOIAF_JRA-1p4-2018.TL319_g17.4p2z.001branch.pop.h.ecosys.nday1.TEMP_mean_150m.19580101-20211231.nc", &
    ! dir_zf = "/glade/campaign/cesm/development/bgcwg/projects/CESM2-OMIP2-like-4p2z-run/g.e22.GOMIPECOIAF_JRA-1p4-2018.TL319_g17.4p2z.001branch/ocn/proc/tseries/day_1/g.e22.GOMIPECOIAF_JRA-1p4-2018.TL319_g17.4p2z.001branch.pop.h.ecosys.nday1.mesozooC_zint_100m.19580101-20211231.nc", &
    ! dir_dz = "/glade/campaign/cesm/development/bgcwg/projects/CESM2-OMIP2-like-4p2z-run/g.e22.GOMIPECOIAF_JRA-1p4-2018.TL319_g17.4p2z.001branch/ocn/proc/tseries/day_1/g.e22.GOMIPECOIAF_JRA-1p4-2018.TL319_g17.4p2z.001branch.pop.h.ecosys.nday1.mesozoo_loss_zint_150m.19580101-20211231.nc", &
    ! dir_det = "/glade/campaign/cesm/development/bgcwg/projects/CESM2-OMIP2-like-4p2z-run/g.e22.GOMIPECOIAF_JRA-1p4-2018.TL319_g17.4p2z.001branch/ocn/proc/tseries/day_1/g.e22.GOMIPECOIAF_JRA-1p4-2018.TL319_g17.4p2z.001branch.pop.h.ecosys.nday1.pocToFloor_2.19580101-20211231.nc"

    ! Last FEISTY tunning data -------------------------------------------------------
    ! dir_Tb = "/project/rdenechere/TunningFEISTY/TL319_g17.4p2z/&
    ! g.e22.GOMIPECOIAF_JRA-1p4-2018.TL319_g17.4p2z.001branch&
    ! .pop.h.ecosys.nday1.TEMP_mean_150m.19580101-20211231.nc", &
    ! dir_Tp = "/project/rdenechere/TunningFEISTY/TL319_g17.4p2z/& 
    ! g.e22.GOMIPECOIAF_JRA-1p4-2018.TL319_g17.4p2z.001branch.&
    ! pop.h.ecosys.nday1.TEMP_BOTTOM_2.19580101-20211231.nc", &
    ! dir_zf = "/project/rdenechere/TunningFEISTY/TL319_g17.4p2z/&
    ! g.e22.GOMIPECOIAF_JRA-1p4-2018.TL319_g17.4p2z.001branch.&
    ! pop.h.ecosys.nday1.mesozooC_zint_150m.19580101-20211231.nc", &
    ! dir_dz = "/project/rdenechere/TunningFEISTY/TL319_g17.4p2z/&
    ! g.e22.GOMIPECOIAF_JRA-1p4-2018.TL319_g17.4p2z.001branch.&
    ! pop.h.ecosys.nday1.mesozoo_loss_zint_150m.19580101-20211231.nc", &
    ! dir_det = "/project/rdenechere/TunningFEISTY/TL319_g17.4p2z/&
    ! g.e22.GOMIPECOIAF_JRA-1p4-2018.TL319_g17.4p2z.001branch.&
    ! pop.h.ecosys.nday1.pocToFloor_2.19580101-20211231.nc"

    ! 2D data from last FEISTY tunning: ----------------------------------------------
    dir_Tb = "/project/rdenechere/TunningFEISTY/TL319_g17.4p2z/&
        2D_data/TEMP_BOTTOM_2_2D.nc", &
    dir_Tp = "/project/rdenechere/TunningFEISTY/TL319_g17.4p2z/& 
        2D_data/TEMP_mean_150m_2D.nc", &
    dir_zf = "/project/rdenechere/TunningFEISTY/TL319_g17.4p2z/&
        2D_data/mesozooC_zint_150m_2D.nc", &
    dir_dz = "/project/rdenechere/TunningFEISTY/TL319_g17.4p2z/&
        2D_data/mesozoo_loss_zint_150m_2D.nc", &
    dir_det = "/project/rdenechere/TunningFEISTY/TL319_g17.4p2z/&
        2D_data/pocToFloor_2_2D.nc", &
    dir_H = "/project/rdenechere/TunningFEISTY/TL319_g17.4p2z/&
        2D_data/Depth_1D.nc", &

    ! Input data (Spinup): --------------------------------------------
    Dir_IniBE = '../output/BE_bio_Spinup.nc',&
    Dir_IniSf = '../output/Sf_bio_Spinup.nc',&
    Dir_IniSp = '../output/Sp_bio_Spinup.nc',&
    Dir_IniSd = '../output/Sd_bio_Spinup.nc',&
    Dir_IniMf = '../output/Mf_bio_Spinup.nc',&
    Dir_IniMp = '../output/Mp_bio_Spinup.nc',&
    Dir_IniMd = '../output/Md_bio_Spinup.nc',&
    Dir_IniLp = '../output/Lp_bio_Spinup.nc',&
    Dir_IniLd = '../output/Ld_bio_Spinup.nc'
    
    ! General parameters: ---------------------------------------------
    integer, parameter  :: dp = kind(0.d0)   ! double precision
    real(dp), parameter :: zero = 0.0        ! Zero
    real(dp), parameter :: eps = 1d-200      ! Small number for divisions 
    integer, parameter :: YR = 64            ! Number of year in Time series
    integer, parameter ::  Nmonth = YR*12    ! Number of month in Time series
    integer, dimension(12), parameter ::  MNTH = (/ 31, 28, 31, 30, 31, 30, &
                                                    31, 31, 30, 31, 30, 31 /) ! Length of month (days)

    ! Environemental data for test: -----------------------------------
    real(dp), parameter :: PI_be_cutoff = 200 ! Benthic-pelagic coupling cutoff (depth, m)

    ! Groupe information: ---------------------------------------------
    integer, parameter :: nFishGroup = 8                      ! Number of fish functional group
    integer, parameter :: nResource = 1                       ! Benthic resource  
    integer, parameter :: nDeriv = nFishGroup +  nResource    ! Number of group for witch the derivative is calculated
    real(dp), parameter :: Delta_t = 1.0                      ! Time step [d]

    ! Parameters physiology: ------------------------------------------
    real(dp), parameter :: ke = 0.0630             ! [°c-1]                Temperature correction for cmax and encounter
    real(dp), parameter :: kmet = 0.08550          ! [°c-1]                Temperature correction for Metabolic cost cost
    real(dp), parameter :: gamma = 70.0            ! []                    Coeff for mass-specific Encounter rate             
    real(dp), parameter :: b_enc = 0.20            ! [m-2 g^(b_enc−1) d−1] Exponent for mass-specific Encounter rate 
    real(dp), parameter :: h = 20.0                ! [d g^(b_cmax)]        Coeff for Cmax 
    real(dp), parameter :: b_cmax = 0.250          ! []                    Exponent for Cmax 
    real(dp), parameter :: a_met = 0.20*h          ! [d-1 g^(b_met)]       Coeff for Metabolic loss 
    real(dp), parameter :: b_met = 0.1750          ! []                    Exponent for Metabolic cost 
    real(dp), parameter :: eps_a =  0.70           ! []                    Assimilation efficiency 
    real(dp), parameter :: Nat_mrt = 0.10/365.0;   ! [m-2 d-1]             Natural mortality coeffient 
    ! Fishing : ---------------------------------------------------------
    real(dp), parameter :: Frate = 0.30/365.0      ! [d-1]                 Fishing intensity 
    real(dp), parameter :: Jselct = 0.10           ! []                    Fishing Selectivity of juveniles  
    real(dp), parameter :: Aselct = 1.0            ! []                    Fishing Selectivity of adult 
    
    ! Param for Size-class growth rate: ----------------------------------
    real(dp), parameter :: Z_s = 0.0010/0.50;      ! Small fish Ratio of upper and lower body size boundary 
    real(dp), parameter :: Z_m = 0.50/250.0;       ! Medium fish Ratio of upper and lower body size boundary 
    real(dp), parameter :: Z_l = 250.0/125000.0;   ! Large fish Ratio of upper and lower body size boundary 
    real(dp), parameter :: kappa_l = 1.0           ! Larval Fraction of energy available (E_a) invested in growth 
    real(dp), parameter :: kappa_j = 1.0           ! Juvenile Fraction of energy available (E_a) invested in growth 
    real(dp), parameter :: kappa_a = 0.50          ! Adult Fraction of energy available (E_a) invested in growth 
    real(dp), parameter :: eps_R = 0.010           ! Reproduction efficiency: account for energy spend in reprodutive organe, aditional foraging activities, cost of migration, and death from egg release to hatchement. 
    ! Benthic chemostat
    real(dp), parameter :: Bent_eff =  0.0750      ! Benthic Efficiency from detritus to benthic biomass
    real(dp), parameter :: CC = 80.0               ! Carring Capacity for benthic chemostat

    ! Parameters feeding preferences: ---------------------------------
    real(dp), parameter :: D = 0.750                    ! Demersal feeding in pelagic reduction
    real(dp), parameter :: A = 0.50                     ! Adult predation reduction
    
    real(dp), parameter :: pref_Mz = 0.90               ! Preference for one mesozooplankton group
    ! Medium Forage 
    real(dp), parameter :: pref_Mf_Mz = 0.50* pref_Mz   ! Preference for Mesozooplankton   
    real(dp), parameter :: pref_Mf_S = 1.0              ! Preference for small fish
    ! Medium pelagic 
    real(dp), parameter :: pref_Mp_Mz = 0.50* pref_Mz   ! Preference for Mesozooplankton
    real(dp), parameter :: pref_Mp_S = 1.0              ! Preference for small fish
    ! Medium Demersal 
    real(dp), parameter :: pref_Md_BE = 1.0             ! Preference for Benthos
    ! Large Pelagic
    real(dp), parameter :: pref_Lp_Mf = 1.0 * A         ! Preference for Medium forage
    real(dp), parameter :: pref_Lp_Mp = 1.0 
    ! Large Demersal
    real(dp), parameter :: pref_Ld_Mf = D * A           ! Preference for Medium forage
    real(dp), parameter :: pref_Ld_Mp = D               ! Preference for Medium pelagics
    real(dp), parameter :: pref_Ld_Md =  1.0            ! Preference for Medium Demersal
    real(dp), parameter :: pref_Ld_BE = 1.0             ! Preference for Benthos

    ! Unit conversion for input data: ---------------------------------------------- 
    real(dp), parameter :: convers_zm  = 10.0**(-3 -2)*12.01*9.0, &                  ! zooplankton biomass 
                           convers_det = 10.0**(-9 +4)*12.01*9.0*24.0*3600.0, &      ! detritus 
                           convers_dZm = 10.0**(-2 -3)*12.01*9.0*24.0*3600.0         ! zooplankton loss
end module Parameters