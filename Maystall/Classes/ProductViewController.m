//
//  ProductViewController.m
//  Maystall
//
//  Created by ss4346 on 13-10-31.
//  Copyright (c) 2013年 huiztech. All rights reserved.
//

#import "ProductViewController.h"
#import "MayColorValue.h"

@interface ProductViewController ()

@end

@implementation ProductViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    //初始化数据
    array = @[@"XS号",@"S号",@"M号",@"L号",@"XL号",@"XXL号",@"XXXL号",@"XXXXL号"];
    
	[self createNavigationBarItem];
    [self createMainView];
    [self createBottomBar];
    
    isFavorited = NO;
}
#pragma -mark button action
- (void)backToPreviousView
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)commentBtnSelected
{
    CommentViewController *view = [[CommentViewController alloc] init];
    [self.navigationController pushViewController:view animated:YES];
}

- (void)favoriteBtnSelected
{
    if (isFavorited) {
        isFavorited = NO;
        favoriteBtn.selected = NO;
    }else{
        isFavorited = YES;
        favoriteBtn.selected = YES;
    }
}

- (void)shareBtnSelected
{

}

- (void)cartBtnSelected
{

}

- (void)browserMore
{
    
}

- (void)blowUp
{
    insertView = [[UIView alloc] initWithFrame:CGRectMake(0, 351, 320, 120)];
    insertView.backgroundColor = [UIColor clearColor];
    [bgScrollView insertSubview:insertView aboveSubview:bgScrollView];
    //自动生成按钮
    [self autoBtnWithNum:array.count];
    
    //将按钮下移
    lowerPart.frame = CGRectMake(0, 500, 320, 400);
}

- (void)blowOff
{
    [insertView removeFromSuperview];
    lowerPart.frame = CGRectMake(0, 351, 320, 400);
}

- (void)autoBtnWithNum:(NSInteger) num
{
    UIView *view = [[UIView alloc] init];
    int row = num/3;
    int column = num%3;
    int length = 250;
    int height = 30;
    for (int i = 0; i < num; i++) {
        if (i/3 != row) {
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i%3*length/3+i%3*10, i/3*height+i/3*5, length/3, height)];
            [button setBackgroundImage:[UIImage imageNamed:@"btn_add_cart_normal"] forState:UIControlStateNormal];
            [button setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
            [view addSubview:button];
        }else{
            int columns = num - row*3;
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i%3*length/columns+i%3*10, i/3*height+i/3*5, (length +20 - (columns-1)*10)/columns, height)];
            [button setBackgroundImage:[UIImage imageNamed:@"btn_add_cart_normal"] forState:UIControlStateNormal];
            [button setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
            [view addSubview:button];
        }
    }
    view.frame = CGRectMake(40, 0, 320, row*30);
    [insertView addSubview:view];
    
    NSLog(@"row is:%d,column is:%d",row,column);
}

#pragma -mark add subview
- (void)createMainView
{
    borderTopLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"border_top_line"]];
    borderTopLine.frame = CGRectMake(0, 0, 320, 7);
    
    //主体页面
    bgScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - [UIApplication sharedApplication].statusBarFrame.size.height -44)];
    bgScrollView.showsVerticalScrollIndicator = NO;
    [bgScrollView setContentSize:CGSizeMake(320, 640)];
    
    mainImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
    mainImageView.backgroundColor = [UIColor clearColor];
    mainImageView.image = [UIImage imageNamed:@"1.jpeg"];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 300, 320, 40)];
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 250, 40)];
    titleLabel.text = @"的司法考试将带来福利的时间罚款多少积分";
    titleLabel.font = [UIFont fontWithName:@"Helvetica" size:12.0];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = PRODCUT_TITLE;
    [lineView addSubview:titleLabel];
    
    UIView *portraitLine = [[UIView alloc] initWithFrame:CGRectMake(255, 5, 1, 30)];
    portraitLine.backgroundColor = PRODCUT_TITLE;
    [lineView addSubview:portraitLine];
    
    //收藏图标
    UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_product_favorite_selected"]];
    icon.frame = CGRectMake(260, 14, 15, 12);
    [lineView addSubview:icon];
    
    //收藏人数
    favoriteLabel = [[UILabel alloc] initWithFrame:CGRectMake(280, 11, 35, 18)];
    favoriteLabel.font = [UIFont fontWithName:@"Helvetica" size:9.0];
    favoriteLabel.textColor = TAB_COLOR_LIGHT;
    favoriteLabel.text = @"1 人喜欢";
    favoriteLabel.backgroundColor = [UIColor clearColor];
    [lineView addSubview:favoriteLabel];
    
    //动态生成的View
    UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(10, 340, 300, 2)];
    line1.backgroundColor = PRODCUT_TITLE;
    [bgScrollView addSubview:line1];
    
    UIButton *blowUp = [[UIButton alloc] initWithFrame:CGRectMake(270, 329, 26, 22)];
    [blowUp setImage:[UIImage imageNamed:@"btn_blow_up"] forState:UIControlStateNormal];
    [blowUp addTarget:self action:@selector(blowUp) forControlEvents:UIControlEventTouchUpInside];
    [bgScrollView addSubview:blowUp];
    
    //下半部分==================================================================
    
    lowerPart = [[UIView alloc] initWithFrame:CGRectMake(0, 351, 320, 400)];
    
    UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 300, 2)];
    line2.backgroundColor = PRODCUT_TITLE;
    [lowerPart addSubview:line2];
    
    UIButton *blowOff = [[UIButton alloc] initWithFrame:CGRectMake(147, -11, 26, 22)];
    [blowOff setImage:[UIImage imageNamed:@"btn_blow_off"] forState:UIControlStateNormal];
    [blowOff addTarget:self action:@selector(blowOff) forControlEvents:UIControlEventTouchUpInside];
    [lowerPart addSubview:blowOff];
    
    
    //加入购物车
    addShoppingCart = [[UIButton alloc] initWithFrame:CGRectMake(67.5, 9, 185, 34)];
    [addShoppingCart setTitle:@"123123123" forState:UIControlStateNormal];
    [addShoppingCart setBackgroundImage:[UIImage imageNamed:@"btn_add_cart_normal"] forState:UIControlStateNormal];
    [addShoppingCart setBackgroundImage:[UIImage imageNamed:@"btn_add_cart_selected"] forState:UIControlStateHighlighted ];
    [addShoppingCart setBackgroundImage:[UIImage imageNamed:@"btn_add_cart_selected"] forState:UIControlStateSelected];
    [addShoppingCart addTarget:self action:@selector(cartBtnSelected) forControlEvents:UIControlEventTouchUpInside];
    [lowerPart addSubview:addShoppingCart];
    
    //浏览更多
    browseMore = [[UIButton alloc] initWithFrame:CGRectMake(67.5, 51, 185, 34)];
    [browseMore setTitle:@"Browse More" forState:UIControlStateNormal];
    [browseMore setBackgroundImage:[UIImage imageNamed:@"btn_add_cart_normal"] forState:UIControlStateNormal];
    [browseMore setBackgroundImage:[UIImage imageNamed:@"btn_add_cart_selected"] forState:UIControlStateHighlighted ];
    [browseMore setBackgroundImage:[UIImage imageNamed:@"btn_add_cart_selected"] forState:UIControlStateSelected];
    [browseMore addTarget:self action:@selector(browserMore) forControlEvents:UIControlEventTouchUpInside];
    [lowerPart addSubview:browseMore];
    
    [bgScrollView addSubview:mainImageView];
    [bgScrollView addSubview:lineView];
    
    [bgScrollView addSubview:lowerPart];
    
    [self.view addSubview:bgScrollView];
    [self.view addSubview:borderTopLine];
}

- (void)createBottomBar
{
    int height = [UIScreen mainScreen].bounds.size.height - [UIApplication sharedApplication].statusBarFrame.size.height -44 -49;
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, height, 320, 49)];
//    bottomView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];
    bottomView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_bottom_tab"]];

    
    //评论按钮
    commentBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 70, 49)];
    [commentBtn setTitle:@"commen" forState:UIControlStateNormal];
    [commentBtn setTitleColor:TAB_COLOR_LIGHT forState:UIControlStateNormal];
    [commentBtn setImage:[UIImage imageNamed:@"icon_product_comment"] forState:UIControlStateNormal ];
//    [commentBtn setImage:[UIImage imageNamed:@"icon_product_comment"] forState:UIControlStateHighlighted];
    [commentBtn setTitleEdgeInsets:UIEdgeInsetsMake(30.0, -22.0, 5.0, 0.0)];
    [commentBtn setImageEdgeInsets:UIEdgeInsetsMake(-10, 20, 0, 0)];
    [commentBtn addTarget:self action:@selector(commentBtnSelected) forControlEvents:UIControlEventTouchUpInside];
    commentBtn.backgroundColor = [UIColor clearColor];
    commentBtn.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:12.0];
    [bottomView addSubview:commentBtn];
    
    //收藏按钮
    favoriteBtn = [[UIButton alloc] initWithFrame:CGRectMake(83.3, 0, 70, 49)];
    [favoriteBtn setTitle:@"favorite" forState:UIControlStateNormal];
    [favoriteBtn setTitleColor:TAB_COLOR_LIGHT forState:UIControlStateNormal];
    [favoriteBtn setImage:[UIImage imageNamed:@"icon_product_favorite_normal"] forState:UIControlStateNormal ];
//    [favoriteBtn setImage:[UIImage imageNamed:@"icon_product_favorite_normal"] forState:UIControlStateHighlighted];
    [favoriteBtn setImage:[UIImage imageNamed:@"icon_product_favorite_selected"] forState:UIControlStateSelected];
    [favoriteBtn setTitleEdgeInsets:UIEdgeInsetsMake(30.0, -22.0, 5.0, 0.0)];
    [favoriteBtn addTarget:self action:@selector(favoriteBtnSelected) forControlEvents:UIControlEventTouchUpInside];
    [favoriteBtn setImageEdgeInsets:UIEdgeInsetsMake(-10, 20, 0, 0)];
    favoriteBtn.backgroundColor = [UIColor clearColor];
    favoriteBtn.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:12.0];
    [bottomView addSubview:favoriteBtn];
    
    //分享按钮
    shareBtn = [[UIButton alloc] initWithFrame:CGRectMake(166.6, 0, 70, 49)];
    [shareBtn setTitle:@"share" forState:UIControlStateNormal];
    [shareBtn setTitleColor:TAB_COLOR_LIGHT forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageNamed:@"icon_product_share"] forState:UIControlStateNormal];
//    [shareBtn setImage:[UIImage imageNamed:@"icon_product_share"] forState:UIControlStateHighlighted];
    [shareBtn setTitleEdgeInsets:UIEdgeInsetsMake(30.0, -22.0, 5.0, 0.0)];
    [shareBtn setImageEdgeInsets:UIEdgeInsetsMake(-10, 20, 0, 0)];
    [shareBtn addTarget:self action:@selector(shareBtnSelected) forControlEvents:UIControlEventTouchUpInside];
    shareBtn.backgroundColor = [UIColor clearColor];
    shareBtn.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:12.0];
    [bottomView addSubview:shareBtn];
    
    //购物车按钮
    cartBtn = [[UIButton alloc] initWithFrame:CGRectMake(249.9, 0, 70, 49)];
    [cartBtn setTitle:@"cart" forState:UIControlStateNormal];
    [cartBtn setTitleColor:TAB_COLOR_LIGHT forState:UIControlStateNormal];
    [cartBtn setImage:[UIImage imageNamed:@"icon_product_cart"] forState:UIControlStateNormal];
//    [cartBtn setImage:[UIImage imageNamed:@"icon_product_cart"] forState:UIControlStateHighlighted];
    [cartBtn setTitleEdgeInsets:UIEdgeInsetsMake(30.0, -22.0, 5.0, 0.0)];
    [cartBtn setImageEdgeInsets:UIEdgeInsetsMake(-10, 20, 0, 0)];
    [cartBtn addTarget:self action:@selector(cartBtnSelected) forControlEvents:UIControlEventTouchUpInside];
    cartBtn.backgroundColor = [UIColor clearColor];
    cartBtn.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:12.0];
    [bottomView addSubview:cartBtn];
    
    [self.view addSubview:bottomView];
    
}

- (void)createNavigationBarItem
{
    self.navigationItem.title = @"Product Detail";
    
    //左键
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 60, 31);
    [leftButton setTitle:@"Back" forState:UIControlStateNormal];
    [leftButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(backToPreviousView) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"btn_nav_back"] forState:UIControlStateNormal];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] init];
    [leftItem setCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;

    //右键
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 40, 31);
    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(backToPreviousView) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"btn_nav_home"] forState:UIControlStateNormal];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] init];
    [rightItem setCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
