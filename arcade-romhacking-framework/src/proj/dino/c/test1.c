#include "../../../include/common/type.h"
#include "../../../include/common/typef.h"
#include "../../../include/common/math.h"
#include "../../../include/common/draw.h"
#include "../../../include/cps1/port.h"
#include "../../../include/cps1/text.h"

 /*
 int  test1( int d1 ,int e1,int f1)
 {
  //register int d1 asm("d2");

  FAST_CALL;
  register int a2=100;
  int b3=11+d1*2;
  int c=add(a2,b3);
  return c+d1;
}
int  test(){
   //register int ff __attribute__(asm("d3"));//无效
  //register int ff __attribute__(__asm("d3"));//无效
  //register int ff __attribute__(__asm__("d3"));//无效
  //register int ff __asm("d3");//有效
  //register int ff asm("d3");//无效
  //register int ff __asm__("d3"); //有效

  int ff=32;
  int e=test1(ff,1,2);
  text_palette[2]=e;

}
*/
void show_menu(uint8_t x, uint8_t y, uint8_t palette, const char* s,uint32_t action) {
   show_string(x,y,palette,s);
}
void action(){
   ;//
}
void showMenu(){
    //FP00 p;
    void(*p)();
    p=action;
    uint32_t act=(uint32_t)p;
    show_menu(8, 10, 0, "MENU-stage",act);
    show_menu(8, 11, 0, "MENU-live",act);
    show_menu(8, 12, 0, "MENU-hit",act);
    show_menu(8, 13, 0, "MENU-color",act);
    show_menu(8, 14, 0, "MENU-enemy",act);
    show_menu(8, 15, 0, "MENU-boss",act);
    show_menu(8, 16, 0, "EXIT",act);
    show_rectangle(6,8,14,14);
}
int main(int argc, char *argv[]) {
    //test();
    showMenu();
    return 0;
}
