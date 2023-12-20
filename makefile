CC=$(DEVKITPPC)/bin/powerpc-eabi-gcc

main_translated.elf: main_translated.c
	$(CC) -mogc -mcpu=750 -mbig -fwrapv -g -no-pie -o main.elf -D GEKKO -I "/home/sandyx/code/v/thirdparty/libgc/include" -I "/opt/devkitpro/libogc/include" -I "/opt/devkitpro/devkitPPC/include" -L"/opt/devkitpro/libogc/lib/cube" -L "/opt/devkitpro/devkitPPC/lib/gcc/powerpc-eabi-13.2.0" -L"~/code/v/thirdparty/libgc" main.c -logc -lm

mainpoop.elf: main.c
	$(CC) -mogc -mcpu=750 -mbig -fwrapv -g -no-pie -o main.elf -D GEKKO -I "/home/sandyx/code/v/thirdparty/libgc/include" -I "/opt/devkitpro/libogc/include" -I "/opt/devkitpro/devkitPPC/include" -L"/opt/devkitpro/libogc/lib/cube" -L "/opt/devkitpro/devkitPPC/lib/gcc/powerpc-eabi-13.2.0" -L"~/code/v/thirdparty/libgc" main.c -logc

main.elf:
	v -cc $(CC) main.v -o -prod -gc none -enable-globals

clean:
	rm main_translated.c
	rm main.elf
