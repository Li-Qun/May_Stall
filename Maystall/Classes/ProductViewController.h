//
//  ProductViewController.h
//  Maystall
//
//  Created by ss4346 on 13-10-31.
//  Copyright (c) 2013年 huiztech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

#import "CommentViewController.h"

@interface ProductViewController : BaseViewController
{
    UIImageView *mainImageView;
    UIImageView *borderTopLine;
    
    UIScrollView *bgScrollView;
    UIView *insertView;
    UIView *lowerPart;
    
    UILabel *titleLabel;
    UILabel *favoriteLabel;
    
    UIButton *addShoppingCart;
    UIButton *browseMore;
    
    //选项卡按钮
    UIButton *commentBtn;
    UIButton *favoriteBtn;
    UIButton *shareBtn;
    UIButton *cartBtn;
    
    //favorite 标签
    BOOL isFavorited;
    NSArray *array;
}

@end
