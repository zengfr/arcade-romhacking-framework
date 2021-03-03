#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "../../../include/common/type.h"
#include "../../../include/common/typef.h"
#include "../../../include/common/menu.h"
#include "menu.h"

#define MENU_ITEM_COUNT 20
void showMainMenu() {
    const int count=MENU_ITEM_COUNT;
    struct MenuItem menuItems[MENU_ITEM_COUNT];
	struct MenuStatus status;
    status.pos_max=count;


    for (int i = 0; i < count; i++)
    {
         menuItems[i].Text ="MENU"+i;
	     menuItems[i].Action =(int*) 0x1a1276;
    }

	while(1) {

		printText(0,0,"---MAIN_MENU---","");
		for(int i=0; i<17; i++) {
			printText(i,0,"%s",menuItems[i].Text);
		}

		while(!chkKeyPress(1)) { //只要不按1P的开始键就不离开

			if(chkKeyPress(2)) { //如果按了1P的UP键
				playSound(0);//播放一次音效
				status.pos_old = status.pos;
				status.pos--;
				status.isChange = 1;
				if(status.pos<0)
					status.pos = 16;//让光标去最下面一行
			}
			if(chkKeyPress(3)) { //如果按了1P的DOWN键
				playSound(0);//播放一次音效
				status.pos_old = status.pos;
				status.pos++;
				status.isChange = 1;//
				if(status.pos>=17)
					status.pos = 0;//让光标去最上面一行
			}
			if(status.isChange) {

				printMenuItem(status,"  %s",menuItems,status.pos_old);//把旧光标位置恢复颜色
				printMenuItem(status,"* %s",menuItems,status.pos);//把新光标位置变颜色
				status.isChange = 0;
			}

		}
		if(status.pos<=0)//如果是选了退出
			break;
		printMenuItem(status,"-%s-",menuItems,status.pos);//在屏幕顶上显示当前光标的名字
		callMenuItemAction(menuItems[status.pos]);
	}
	return;
}
void  callMenuItemAction(struct MenuItem item){
    FUNC32(item.Action)();
}
void  printText(int row,int col,char* format,char* text){

     return;
 }
 void  printMenuItem(struct MenuStatus status,char* format,struct MenuItem items[],int index){

     return;
 }
 short chkKeyPress(short key){
    return 0;
 }
 void playSound(short index){
    return;
 }
