# includes default Makefile from previous configuration
include Makefile

# test target
default: test_read

## compilation directories
O := ./obj

OBJECTS = \
	$O/decompose_mesh.dec.o \
	$O/decompose_mesh_par.dec_module.o \
	$O/fault_scotch.dec_module.o \
	$O/lts_helper.dec.o \
	$O/lts_setup_elements.dec.o \
	$O/part_decompose_mesh.dec_module.o \
	$O/partition_scotch.dec.o \
	$O/partition_metis.dec.o \
	$O/partition_patoh.dec.o \
	$O/partition_rows.dec.o \
	$O/wrap_patoh.o \
	$O/wrap_metis.o \
	$O/param_reader.cc.o \
  $O/count_number_of_sources.shared.o \
	$O/exit_mpi.shared.o \
	$O/heap_sort.shared.o \
	$O/read_parameter_file.shared.o \
	$O/read_value_parameters.shared.o \
	$O/search_kdtree.shared.o \
	$O/shared_par.shared_module.o \
  $O/sort_array_coordinates.shared.o \
	$O/write_VTK_data.shared.o \
	$(EMPTY_MACRO)

test_read:
	${FCCOMPILE_CHECK} ${FCFLAGS_f90} -o ./bin/test_read test_read.f90 -I./obj $(OBJECTS) $(PART_LIBS)

