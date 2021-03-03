#ifndef _GAME_MENU_H_
#define _GAME_MENU_H_
void showMainMenu();
void  callMenuItemAction(struct MenuItem item);
void  printText(int row,int col,char* format,char* text);
 void  printMenuItem(struct MenuStatus status,char* format,struct MenuItem items[],int index);
 short chkKeyPress(short key);
 void playSound(short index);
 #endif
