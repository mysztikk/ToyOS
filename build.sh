nasm -fbin -o boot.bin boot.s
nasm -fbin -o more.bin more.s
cat boot.bin more.bin > file.img
truncate -s 360K file.img
hexdump boot.bin
hexdump more.bin
hexdump file.img
