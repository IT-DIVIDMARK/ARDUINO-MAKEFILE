# Microcontroller settings
MCU = atmega328p
F_CPU = 16000000UL

# Compiler and linker settings
CC = avr-gcc
OBJCOPY = avr-objcopy
AVRDUDE = avrdude
PROGRAMMER = <PROGRAMMER>  # Replace with your programmer type
PORT = <PORT>  # Replace with your programmer port

# Compiler flags
CFLAGS = -g -Os -Wall -mmcu=$(MCU) -DF_CPU=$(F_CPU)

# Source files
SRC = main.c

# Output files
TARGET = main
HEX = $(TARGET).hex

.PHONY: all clean flash

all: $(HEX)

$(HEX): $(TARGET)
	$(OBJCOPY) -O ihex -R .eeprom $< $@

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $@ $<

flash: $(HEX)
	$(AVRDUDE) -c $(PROGRAMMER) -p $(MCU) -P $(PORT) -U flash:w:$(HEX)

clean:
	rm -f $(TARGET) $(HEX)
