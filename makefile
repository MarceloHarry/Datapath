CC = iverilog
CFLAGS = -Wall
SRC = $(wildcard *.v)
EXEC = datapath

all: $(EXEC)

$(EXEC): $(SRC)
	$(CC) $(CFLAGS) All_In_One.v -o $@

clean:
	rm -rf $(EXEC)
