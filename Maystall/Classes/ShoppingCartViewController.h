//
//  ShoppingCartViewController.h
//  Maystall
//
//  Created by ss4346 on 13-10-29.
//  Copyright (c) 2013年 huiztech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

#import "CartCell.h"
#import "MayValue.h"

@interface ShoppingCartViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>{
    
    //标志位
    BOOL allSelected;

    UITableView *mainTableView;
    
    NSMutableArray *goods;
    
    UILabel *totalPrice;
    
    UILabel *price;
    
    UILabel *cashBack;

}

@end
