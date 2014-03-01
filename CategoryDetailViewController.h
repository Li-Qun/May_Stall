//
//  CategoryDetailViewController.h
//  Maystall
//
//  Created by Liqun on 27/02/2014.
//  Copyright (c) 2014 huiztech. All rights reserved.
//

#import "BaseViewController.h"

#import "EGORefreshTableHeaderView.h"
#import "EGORefreshTableFooterView.h"
#import "TMQuiltView.h"
#import "TMPhotoQuiltViewCell.h"
#import "MayAppDelegate.h"


@interface CategoryDetailViewController : BaseViewController<EGORefreshTableDelegate,UIScrollViewDelegate,TMQuiltViewDataSource,TMQuiltViewDelegate>
{
    //UIButton
    BOOL LastestOrHotest;//yes is Lastest
    UIButton *_newestBtn;
    UIButton *_bestSellerBtn;
    
    NSString *name_CategoryDetail;
    NSString *ID_BtnTag;
    
    //EGOHeader
    EGORefreshTableHeaderView *_refreshHeaderView;
    //EGOFoot
    EGORefreshTableFooterView *_refreshFooterView;
    //
    BOOL _reloading;
    int totalPage;
    int currentPage;
    TMQuiltView *qtmquitView;
    
    NSMutableArray *firstView;
    NSMutableArray *fisrstView_Height;
    
    NSMutableArray *lastestBtn;
    NSMutableArray *lastestBtn_height;
    NSMutableArray *hotestBtn;
    NSMutableArray *hotestBtn_height;
    // MayAppDelegate * app;
    
}
@property(nonatomic,retain)NSString *name_CategoryDetail;
@property(nonatomic,retain)NSString *ID_BtnTag;
@end
