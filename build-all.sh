#!/bin/bash -l
#SBATCH --time=0-01:00:00
#SBATCH -p batch
#SBATCH -N 1
#SBATCH --ntasks-per-node 16
set -e

source env-build-fenics.sh

./build-cmake.sh
./build-adios2.sh
./build-petsc.sh
./build-python-modules.sh
./build-pugixml.sh
./build-fenics.sh
./build-gmsh.sh

mkdir -p ${PREFIX}/bin
cp env-build-fenics.sh ${PREFIX}/bin/env-build-fenics.sh
cp env-fenics.sh ${PREFIX}/bin/env-fenics.sh
