//
//  HomeViewController.h
//  Maystall
//
//  Created by ss4346 on 13-10-29.
//  Copyright (c) 2013年 huiztech. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseViewController.h"


#import "SGFocusImageItem.h"
#import "SGFocusImageFrame.h"
#import "ProductViewController.h"
#import "EGORefreshTableHeaderView.h"
#import "EGORefreshTableFooterView.h"

#import "AOTwoWaterView.h"
#import "MayValue.h"
#import "TestIPay88ViewController.h"

#import "AFOSCClient.h"
#import "AFHTTPRequestOperation.h"
#import "LoginViewController.h"
#import "ProductDetailViewController.h"

#import "TMQuiltView.h"
#import "TMPhotoQuiltViewCell.h"
#import "UrlImageView.h"
@interface HomeViewController : BaseViewController<SGFocusImageFrameDelegate,EGORefreshTableDelegate,AOTwoWaterViewDelegate,UIScrollViewDelegate,TMQuiltViewDataSource,TMQuiltViewDelegate,SDWebImageManagerDelegate>
{
    NSMutableArray *advList;
    
    //UIButton
    UIButton *_newestBtn;
    UIButton *_bestSellerBtn;
    
    //EGOHeader
    EGORefreshTableHeaderView *_refreshHeaderView;
    //EGOFoot
    EGORefreshTableFooterView *_refreshFooterView;
    //
    BOOL _reloading;
    int totalPage;
    int currentPage;
    AOTwoWaterView *_aoView;
    
    
    
    
    TMQuiltView *qtmquitView;
    NSMutableArray *images;
    NSArray *arr_images;
}

@property(nonatomic,retain)AOTwoWaterView *aoView;

@property(nonatomic,retain)NSMutableArray *totalArray;

@property(strong,nonatomic)NSMutableArray *productArray;

@property (nonatomic, retain) NSMutableArray *images;

@end
