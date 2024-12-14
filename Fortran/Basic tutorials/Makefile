########################################################################
####################### Makefile Template ##############################
########################################################################

#
# gfortran:
#
# Compiler
FC = gfortran # mpif90 # 

# Compiler flags
FFLAGS = -O3

# netCDF library flags
NETCDF_FLAGS = `nf-config --fflags --flibs`

# OpenMP flag
OPENMP_FLAGS = -fopenmp

# Fortran source file
SOURCE_RESHAPE_ARRAY = reshape_array.f90
SOURCE_MATRIX_MULTIPLICATION = Matrix_multiplication.f90
 
OUTPUT_RESHAPE_ARRAY = reshape_array
OUTPUT_MATRIX_MULTIPLICATION = Matrix_multiplication

# Targets: 
all: $(OUTPUT_RESHAPE_ARRAY)
$(OUTPUT_RESHAPE_ARRAY): $(SOURCE_RESHAPE_ARRAY)
	$(FC) $(FFLAGS) $(OPENMP_FLAGS) $(SOURCE_RESHAPE_ARRAY) -o $(OUTPUT_RESHAPE_ARRAY) $(NETCDF_FLAGS) 

all: $(OUTPUT_MATRIX_MULTIPLICATION)
$(OUTPUT_MATRIX_MULTIPLICATION): $(SOURCE_MATRIX_MULTIPLICATION)
	$(FC) $(FFLAGS) $(OPENMP_FLAGS) $(SOURCE_MATRIX_MULTIPLICATION) -o $(OUTPUT_MATRIX_MULTIPLICATION) $(NETCDF_FLAGS) 