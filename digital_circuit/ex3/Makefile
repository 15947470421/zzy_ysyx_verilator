TOPNAME = top
NXDC_FILES = constr/top.nxdc
INC_PATH ?=

VERILATOR = verilator
VERILATOR_CFLAGS += -MMD --build -cc  \
				-O3 --x-assign fast --x-initial fast --noassert

BUILD_DIR = ./build
OBJ_DIR = $(BUILD_DIR)/obj_dir
BIN = $(BUILD_DIR)/$(TOPNAME)

default: $(BIN)

$(shell mkdir -p $(BUILD_DIR))

# constraint file
SRC_AUTO_BIND = $(abspath $(BUILD_DIR)/auto_bind.cpp)
$(SRC_AUTO_BIND): $(NXDC_FILES)
	python3 $(NVBOARD_HOME)/scripts/auto_pin_bind.py $^ $@

# project source
VSRCS = $(shell find $(abspath ./vsrc) -name "*.v")
CSRCS = $(shell find $(abspath ./csrc) -name "*.c" -or -name "*.cc" -or -name "*.cpp")
CSRCS += $(SRC_AUTO_BIND)

# rules for NVBoard
include $(NVBOARD_HOME)/scripts/nvboard.mk

# rules for verilator
INCFLAGS = $(addprefix -I, $(INC_PATH))
CXXFLAGS += $(INCFLAGS) -DTOP_NAME="\"V$(TOPNAME)\""

$(BIN): $(VSRCS) $(CSRCS) $(NVBOARD_ARCHIVE)
	@rm -rf $(OBJ_DIR)
	$(VERILATOR) $(VERILATOR_CFLAGS) \
		--top-module $(TOPNAME) $^ \
		$(addprefix -CFLAGS , $(CXXFLAGS)) $(addprefix -LDFLAGS , $(LDFLAGS)) \
		--Mdir $(OBJ_DIR) --exe -o $(abspath $(BIN))

all: default

run: $(BIN)
	@$^

sim:
	verilator -Wall --trace -cc ./vsrc/top.v --exe tb_top.cpp
	# 执行完这一步，将会自动产生一个obj_dir文件夹，obj_dir里面是通过verilator将top.v转化后的Vtop.cpp以及各种头文件
	
	# 注意：执行下一步之前，需要自己手动创建一个tb_top.cpp的文件，并在这个文件中编写好测试的testbench代码
	make -C obj_dir -f Vtop.mk Vtop
	# 执行这一步，就会把第一步转化的cpp文件按照tb_top.cpp文件中的测试激励代码进行编译，最终生成一个名为Vtop的可执行文件
	
	./obj_dir/Vtop
	# 这一步就是运行Vtop这个可执行文件，执行完之后，就会发现在命令行的当前目录下，生成了一个waveform.vcd文件，这个文件就是按照激励文件生成的仿真波形

clean:
	rm -rf $(BUILD_DIR)

.PHONY: default all clean run