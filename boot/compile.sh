rm -f boot.img
nasm -o boot.img boot.asm
# dd if=boot.img bs=512 count=1 of=boot_floppy.img
