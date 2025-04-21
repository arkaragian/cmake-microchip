#include <stdint.h>

int main(void) {
    uint32_t a = 0;
    while(1) {
        //Do Something
        if(a % 2 == 0) {
            a = a+3;
        } else {
            a++;
        }
    }
    return 1;
}
