NVCC = nvcc

# NVCCFLAGS = -O3 -gencode arch=compute_75,code=sm_75 -Xcompiler -fopenmp -Xcompiler -Wall
NVCCFLAGS = -O3 -Xcompiler -fopenmp -Xcompiler -Wall \
            -gencode arch=compute_86,code=sm_86
PKGFLAGS = $(shell pkg-config --cflags --libs glew glfw3)
LDFLAGS = -lm

SRC = programCudaFixStatics.cu
TARGET = constant

all: $(TARGET)

$(TARGET): $(SRC)
	$(NVCC) $(NVCCFLAGS) -o $(TARGET) $(SRC) $(PKGFLAGS) $(LDFLAGS)

clean:
	rm -f $(TARGET) log_simulasi_final.csv


