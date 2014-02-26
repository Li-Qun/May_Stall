//
//  CartCell.m
//  Maystall
//
//  Created by ss4346 on 14-1-7.
//  Copyright (c) 2014年 huiztech. All rights reserved.
//

#import "CartCell.h"

@implementation CartCell

@synthesize bgView ;
@synthesize selectedBtn;
@synthesize addBtn;
@synthesize subBtn;
@synthesize numLabel;
@synthesize headImage;
@synthesize titleLabel;
@synthesize priceLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:@"cartCell"];
    self.frame = CGRectMake(0, 0, 320, 130);
    currentNum = 120;
    if (self) {

        bgView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 300, 110)];
        bgView.layer.cornerRadius = 4;
        bgView.layer.borderWidth = 2;
        bgView.layer.masksToBounds = YES;
        bgView.layer.borderColor = [NAV_COLOR CGColor];
        
        selectedBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 45, 20, 20)];
        selectedBtn.backgroundColor = [UIColor blueColor];
        [selectedBtn addTarget:self action:@selector(setCellSelcted) forControlEvents:UIControlEventTouchUpInside];
        
        headImage = [[EGOImageView alloc] initWithFrame:CGRectMake(35, 30, 50, 50)];
        [headImage setImage:[UIImage imageNamed:@"icon_product_favorite_selected"]];
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 20, 200, 20)];
        titleLabel.text = @"Lumigrids is an LED projector for bicycles, which aims to improve safety during night riding.";
        titleLabel.textColor = PRODCUT_TITLE;
        titleLabel.font = [UIFont fontWithName:@"Helvetica" size:11.0];
        titleLabel.backgroundColor = [UIColor clearColor];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(90, 40, 30, 20)];
        label.backgroundColor = [UIColor clearColor];
        label.font = [UIFont fontWithName:@"Helvetica" size:11.0];
        label.textColor = PRODCUT_TITLE;
        label.text = @"price:";
        
        priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 40, 90, 20)];
        priceLabel.backgroundColor = [UIColor clearColor];
        priceLabel.font = [UIFont fontWithName:@"Helvetica" size:11.0];
        priceLabel.textColor = PRODCUT_TITLE;
        priceLabel.text = @"$120.00";
        
        subBtn = [[UIButton alloc] initWithFrame:CGRectMake(160, 60, 35, 32)];
        [subBtn setImage:[UIImage imageNamed:@"buy_btn_left"] forState:UIControlStateNormal];
        [subBtn setImage:[UIImage imageNamed:@"buy_btn_left"] forState:UIControlStateHighlighted];
        [subBtn setImage:[UIImage imageNamed:@"buy_btn_left"] forState:UIControlStateSelected];
        [subBtn addTarget:self action:@selector(subMethod) forControlEvents:UIControlEventTouchUpInside];
        
        numLabel = [[UILabel alloc] initWithFrame:CGRectMake(195, 60, 35, 32)];
        numLabel.backgroundColor = [UIColor clearColor];
        numLabel.font = [UIFont fontWithName:@"Helvetica" size:14.0];
        numLabel.textColor = PRODCUT_TITLE;
        numLabel.text = [NSString stringWithFormat:@"%d",currentNum];
        
        addBtn = [[UIButton alloc] initWithFrame:CGRectMake(245, 60, 35, 32)];
        [addBtn setImage:[UIImage imageNamed:@"buy_btn_right"] forState:UIControlStateNormal];
        [addBtn setImage:[UIImage imageNamed:@"buy_btn_right"] forState:UIControlStateHighlighted];
        [addBtn setImage:[UIImage imageNamed:@"buy_btn_right"] forState:UIControlStateSelected];
        [addBtn addTarget:self action:@selector(addMethod) forControlEvents:UIControlEventTouchUpInside];
        
        [bgView addSubview:selectedBtn];
        [bgView addSubview:headImage];
        [bgView addSubview:titleLabel];
        [bgView addSubview:label];
        [bgView addSubview:priceLabel];
        [bgView addSubview:subBtn];
        [bgView addSubview:numLabel];
        [bgView addSubview:addBtn];
        
        [self addSubview: bgView];
        
    }
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor clearColor];
    bgColorView.layer.cornerRadius = 7;
    bgColorView.layer.masksToBounds = YES;
    [self setSelectedBackgroundView:bgColorView];
    
    return self;
}

- (void)setCellSelcted
{
    NSLog(@"cell selected");
    [self setSelected:YES];
}

- (void)addMethod
{

    currentNum++;
    NSLog(@"***add*** %d",currentNum);
    numLabel.text = [NSString stringWithFormat:@"%d",currentNum];
    
}

- (void)subMethod
{
    NSLog(@"***sub***");
    if (currentNum > 0) {
        currentNum--;
        numLabel.text = [NSString stringWithFormat:@"%d",currentNum];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
