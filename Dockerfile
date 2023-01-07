# Building CafeMol-3.2.1
FROM ubuntu:20.04 AS build
RUN apt update && apt install -y
RUN apt install wget gcc g++ gfortran cmake -y

RUN mkdir app && cd app \
 && wget https://www.cafemol.org/distribution/cafemol_3.2.1.tar.gz \
 && tar -zxvf cafemol_3.2.1.tar.gz && cd cafemol_3.2.1 \
 && mkdir build && cd build \
 && cmake -DCMAKE_Fortran_COMPILER=gfortran -DCMAKE_BUILD_TYPE=Release -DOMP_PAR=ON .. \
 && make

# Making a smaller docker image
FROM ubuntu:20.04 AS product
RUN apt update && apt install -y && apt install gcc g++ gfortran -y
COPY --from=0 /app/cafemol_3.2.1/bin/cafemol /usr/local/bin