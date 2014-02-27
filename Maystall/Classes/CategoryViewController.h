//
//  CategoryViewController.h
//  Maystall
//
//  Created by ss4346 on 13-10-29.
//  Copyright (c) 2013年 huiztech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SGFocusImageItem.h"
#import "BaseViewController.h"

#import "AFOSCClient.h"
#import "AFHTTPRequestOperation.h"
#import "Categroy.h"
@interface CategoryViewController : BaseViewController<UIScrollViewDelegate>{
    //数据
    NSMutableArray *advList;
    
    //界面
    UIView *clothView;
    UILabel *clothTitle;
    UIButton *clothBtn;
    UIScrollView *clothScroll;
    
    UIView *shoesView;
    UILabel *shoesTitle;
    UIButton *shoesBtn;
    UIScrollView *shoesScroll;
    
    UIView *bagView;
    UILabel *bagTitle;
    UIButton *bagBtn;
    UIScrollView *bagScroll;
    
    NSMutableArray *_categoryArray;
    Categroy *category;
    NSArray *name_CategotyDetail;
}

@property (strong,nonatomic) NSMutableArray *categoryArray;

@end
