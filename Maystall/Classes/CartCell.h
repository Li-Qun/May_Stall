//
//  CartCell.h
//  Maystall
//
//  Created by ss4346 on 14-1-7.
//  Copyright (c) 2014年 huiztech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGOImageView.h"

@interface CartCell : UITableViewCell{
    
    UIView *bgView;
    UIButton *addBtn;
    UIButton *subBtn;
    UILabel *numLabel;
    EGOImageView *headImage;
    UILabel *titleLabel;
    UILabel *priceLabel;
    UIButton *selectedBtn;
    
    NSInteger currentNum;

}

@property (retain,nonatomic) UIView *bgView;
@property (retain,nonatomic) UIButton *addBtn;
@property (retain,nonatomic) UIButton *subBtn;
@property (retain,nonatomic) UILabel *numLabel;
@property (retain,nonatomic) EGOImageView *headImage;
@property (retain,nonatomic) UILabel *titleLabel;
@property (retain,nonatomic) UILabel *priceLabel;
@property (retain,nonatomic) UIButton *selectedBtn;





@end
