#ifndef _COMMON_MENU_H_
#define _COMMON_MENU_H_

struct MenuItem {
	char* Text;	//菜单文本地址
	int* Action;//菜单程序地址
};
struct MenuStatus {
    int pos_max;
	int	pos;
	int pos_old;
    short isChange;
};
#endif
