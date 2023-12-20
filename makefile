CC=$(DEVKITPPC)/bin/powerpc-eabi-gcc

#main_t.c may require some manual fixing before it compiles
##change gp_fifo = main__memalign(32U, (262144)); to gp_fifo = memalign(32U, (262144));
##change _const_main__cube to cube
##change _const_main__color to color
##change guMtxConcat, guTransApply, guMtxIdentity etc.. to c_guMtxConcat, c_guTransApply
main.elf: main_t.c
	$(CC) -mogc -mcpu=750 -mbig -g -no-pie -o main.elf -D GEKKO -I "/opt/devkitpro/libogc/include" -I "/opt/devkitpro/libogc/include/ogc" -I "/opt/devkitpro/devkitPPC/include" -L"/opt/devkitpro/libogc/lib/cube" -L "/opt/devkitpro/devkitPPC/lib/gcc/powerpc-eabi-13.2.0" -L"~/code/v/thirdparty/libgc" main_t.c -logc -lm

main_t.c:
	v -cc $(CC) main.v -o main_t.c -prod -gc none -enable-globals

clean:
	rm main_t.c
	rm main.elf
