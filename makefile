MCU = atmega328p
PRG = main

CFLAGS=-g -mmcu=$(MCU) -Wall -Wstrict-prototypes -Os -mcall-prologues
#
$(PRG).hex : $(PRG).elf
	avr-size $(PRG).elf
	avr-objcopy -R .eeprom -O ihex $(PRG).elf $(PRG).hex

$(PRG).elf : $(PRG).o
	avr-gcc $(CFLAGS) -o $(PRG).elf -Wl,-Map,$(PRG).map $(PRG).o

$(PRG).o : $(PRG).c 
	avr-gcc $(CFLAGS) -Os -c $(PRG).c  -c   
#
install: $(PRG).hex
	avrdude -p m328p -c usbtiny -e -U flash:w:$(PRG).hex

clean:
	rm -rf *.o $(PRG).elf *.eps *.png *.pdf *.bak *.hex *.bin *.srec

