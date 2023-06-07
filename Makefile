EXE=tolower
OBJS=tolower.o
LD=ld.gold
# LD=clang
LD_FLAGS=-nostdlib -static
AS=as -c
# AS=clang -c
AS_FLAGS=-g


$(EXE): $(OBJS)
	$(LD) $(LD_FLAGS) -o $@ $^

%.o: %.s
	$(AS) $(AS_FLAGS) -o $@ $^

.phony: clean

clean:
	rm -f $(EXE) $(OBJS)
