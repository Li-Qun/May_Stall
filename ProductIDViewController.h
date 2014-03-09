//
//  ProductIDViewController.h
//  Maystall
//
//  Created by Liqun on 01/03/2014.
//  Copyright (c) 2014 huiztech. All rights reserved.
//

#import "BaseViewController.h"

@interface ProductIDViewController : BaseViewController<UIScrollViewDelegate,UIWebViewDelegate>
{
    NSString *ID_Product;
    NSString *Name_Product;
    UIScrollView *scrollView;
    UIView *bottomView;//最喜欢 分享 购物车 bar 视图
    
    //产品描述、规格选项按钮
    UIButton *_newestBtn;//图形描述
    UIButton *_bestSellerBtn;//评论
    UIWebView *webView_Information;
    //高度临时增量
    float height_ever;
    UILabel *label_text;//图文文本；
    
    //选项卡按钮
    UIButton *commentBtn;
    UIButton *favoriteBtn;
    UIButton *shareBtn;
    UIButton *cartBtn;
    //favorite 标签 isCarted 标签
    BOOL isFavorited;
    BOOL isCarted;
    //cart board
    UIView *view_Select;
    NSArray *array_shape;
    NSString *string_shape;
    //两行按钮数组 颜色 尺寸
    NSMutableArray *size_color_array;
    UILabel *label_buy_Num;
    UILabel *count_label;
    NSString *string_Money_total;//价格总计。
    NSString *string_Money_Single;//商品单价
    NSString *string_Numbers;//购买数量
    UIImageView *totoal_BackGround;//统计价格背景条
}
@property(nonatomic,retain) NSString *ID_Product;
@property(nonatomic,retain)  NSString *Name_Product;
@end
