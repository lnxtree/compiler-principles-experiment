OBJECTS := codegen.o main.o
CXX := clang++
CXXFLAGS := $(shell llvm-config --cxxflags)
CXXFLAGS += -Iinclude
CXXFLAGS += -std=c++17
LDFLAGS := $(shell llvm-config --ldflags --system-libs)
# LDFLAGS += -ldl -lpthread -lz -lterminfo
LIBS := $(shell llvm-config --libs all)

codegen: main.o codegen.o
	${CXX} ${OBJECTS} -o codegen ${CXXFLAGS} ${LDFLAGS} ${LIBS}

%.o: %.cc
	$(CXX) -c $< -o $@ $(CXXFLAGS)

.PHONY: clean
clean: $(OBJECTS) codegen
	@rm codegen *.o