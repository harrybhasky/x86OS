extern "C" void main() {   // so that assembly can call it as main
    const char* str = "Dhoni is da GOAT";
    volatile char* vga = (char*)0xb8000;

    for (int i = 0; str[i] != '\0'; ++i) {
        vga[i * 2] = str[i];     // Character byte
        vga[i * 2 + 1] = 0x07;   // Attribute byte: light gray on black
    }

    return;
}
