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

#import "MayValue.h"
#import "TestIPay88ViewController.h"

#import "AFOSCClient.h"
#import "AFHTTPRequestOperation.h"
#import "LoginViewController.h"
#import "ProductDetailViewController.h"

#import "TMQuiltView.h"
#import "TMPhotoQuiltViewCell.h"

#import "MayAppDelegate.h"
@interface HomeViewController : BaseViewController<SGFocusImageFrameDelegate,EGORefreshTableDelegate,UIScrollViewDelegate,TMQuiltViewDataSource,TMQuiltViewDelegate>
{
    NSMutableArray *advList;
    
    //UIButton
    BOOL LastestOrHotest;//yes is Lastest
    BOOL Lastest;
    BOOL Hotest;
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
    TMQuiltView *qtmquitView;
    TMQuiltView *qtmquitView_hot;
   // MayAppDelegate * app;
    
    NSMutableArray *firstView;
    NSMutableArray *fisrstView_Height;
    
    NSMutableArray *lastestBtn;
    NSMutableArray *lastestBtn_height;
    NSMutableArray *hotestBtn;
    NSMutableArray *hotestBtn_height;

}




@end
