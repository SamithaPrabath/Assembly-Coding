nasm -f elf file_name.asm

ld -m elf_i386 -s -o outfile_name file_name.o
ld -m elf_i386 -o outfile_name file_name.o

./outfile_name
