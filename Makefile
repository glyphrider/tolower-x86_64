EXE=tolower
OBJS=tolower.o
LD=ld.gold
LD_FLAGS=-g -nostdlib -static
AS=as -c
AS_FLAGS=-g


$(EXE): $(OBJS)
	$(LD) $(LD_FLAGS) -o $@ $^

%.o: %.s
	$(AS) $(AS_FLAGS) -o $@ $^

.phony: clean

clean:
	rm -f $(EXE) $(OBJS)
