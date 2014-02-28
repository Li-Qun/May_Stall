//
//  CategoryDetailViewController.m
//  Maystall
//
//  Created by DAWEI FAN on 27/02/2014.
//  Copyright (c) 2014 huiztech. All rights reserved.
//

#import "CategoryDetailViewController.h"
#import "ProductViewController.h"

#import "MayColorValue.h"
#import "MayValue.h"
#import "Config.h"

#import "UIImageView+WebCache.h"
#import "SBJson.h"
#import "ASIFormDataRequest.h"
#import <QuartzCore/QuartzCore.h>
#import "CheckNetwork.h"

#import "TMQuiltView.h"
#import "TMPhotoQuiltViewCell.h"

@interface CategoryDetailViewController ()

@end

@implementation CategoryDetailViewController
@synthesize name_CategoryDetail=name_CategoryDetail;
@synthesize ID_BtnTag=ID_BtnTag;
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
    [self createNavigationBarItem];
    [self createSecondaryTab];//创建下方最新最棒
    [self getMainArray];
}
- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.navigationController.navigationBarHidden = NO;
    [self setTabNavigationBarTitleWithText:@"CategoryDetail"];//不好使
    self.navigationItem.title =name_CategoryDetail;
    self. navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];//更改导航栏标题颜色 为白色
      qtmquitView = [[TMQuiltView alloc] initWithFrame:CGRectMake(0, 33 , 320, VIEW_HEIGHT)];
}

-(void)getMainArray
{
    BOOL isNetWork=[CheckNetwork isExistenceNetwork];
    [Config Instance].isNetworkRunning = [CheckNetwork isExistenceNetwork];
    if(!isNetWork)//无网络
    {
        UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"提示"
                                                       message:@"网络不佳，请重新操作试试看～"
                                                      delegate:nil
                                             cancelButtonTitle:nil
                                             otherButtonTitles: @"确定",nil];
        [alert show];
    }
    else
    {
    //http://www.maystall.com/index.php?route=mobile/ajax&action=product&product_id=36&type=lastest
        NSString *string=[NSString stringWithFormat:@"%@",kBASEURL];
        NSURL *url = [ NSURL URLWithString :  string ];
        __block ASIFormDataRequest *request = [ ASIFormDataRequest requestWithURL :url];
        [request setRequestMethod:@"POST"];
        [request setPostValue:kPRODCUTS forKey:kACTION];
        [request setPostValue:ID_BtnTag forKey:kPRODUCT_ID];
        [request setPostValue:@"lastest" forKey:@"type"];
        NSLog(@"%d",[request responseStatusCode]);
        [request setCompletionBlock :^{
            NSString * response  =  [request responseString];
            SBJsonParser *parser = [[SBJsonParser alloc] init];
            NSDictionary *array = [parser objectWithString:response];
            NSLog(@"%@",array);
           [self creatWater:[array objectForKey:@"products"]];
//            [self.view addSubview:qtmquitView];
//            
        }];
        [request setFailedBlock :^{
//            NSLog(@"HTTP 响应码：%d",[request responseStatusCode]);
//            NSError *error = [request error ];
//            NSLog ( @"error:%@" ,[error userInfo ]);
        }];
        [request startAsynchronous ];//异步
    }
}
-(void)creatWater:(NSArray *)array
{
    firstView=[[NSMutableArray alloc]init];
    fisrstView_Height=[[NSMutableArray alloc]init];
    for(int i=0;i<array.count;i++)
    {
        NSDictionary *dict=[[NSDictionary alloc]init];
        dict=[array objectAtIndex:i];
        
        NSString *url=[NSString stringWithFormat:@"%@image/%@",webImageURL,[dict objectForKey:@"thumb"]] ;
        UIImageView *imageView=[[UIImageView alloc]init];
        //        [imageView setImageWithURL:[NSURL URLWithString: url]];
        //     [app.arrary_height addObject:[NSString stringWithFormat:@"%f",imageView.image.size.height]];
        [imageView setImageWithURL:[NSURL URLWithString: url]
                  placeholderImage:[UIImage imageNamed:@"moren.png"]
                           success:^(UIImage *image) {
                            [firstView addObject:[array objectAtIndex:i]];
                            [fisrstView_Height addObject:[NSString stringWithFormat:@"%f",image.size.height]];
                           if(fisrstView_Height.count==array.count)
                           {
                               qtmquitView.delegate = self;
                               qtmquitView.dataSource = self;
                               [self.view addSubview:qtmquitView];
                               [qtmquitView reloadData];
                               [self createHeaderView];
                               [self performSelector:@selector(testFinishedLoadData) withObject:nil afterDelay:0.0f];
                               
                           }
                               NSLog(@"图片显示成功OK " );}
                           failure:^(NSError *error) {NSLog(@"资讯置顶图片显示失败NO");}];
    }
 
}
//＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
//初始化刷新视图
//＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
#pragma mark
#pragma methods for creating and removing the header view

-(void)createHeaderView{
    if (_refreshHeaderView && [_refreshHeaderView superview]) {
        [_refreshHeaderView removeFromSuperview];
    }
	_refreshHeaderView = [[EGORefreshTableHeaderView alloc] initWithFrame:
                          CGRectMake(0.0f, 0.0f - self.view.bounds.size.height,
                                     self.view.frame.size.width, self.view.bounds.size.height)];
    _refreshHeaderView.delegate = self;
    
	[qtmquitView addSubview:_refreshHeaderView];
    
    [_refreshHeaderView refreshLastUpdatedDate];
}

-(void)testFinishedLoadData{
	
    [self finishReloadingData];
    [self setFooterView];
}

#pragma mark -
#pragma mark method that should be called when the refreshing is finished
- (void)finishReloadingData{
	
	//  model should call this when its done loading
	_reloading = NO;
    
	if (_refreshHeaderView) {
        [_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:qtmquitView];
    }
    
    if (_refreshFooterView) {
        [_refreshFooterView egoRefreshScrollViewDataSourceDidFinishedLoading:qtmquitView];
        [self setFooterView];
    }
    
    // overide, the actula reloading tableView operation and reseting position operation is done in the subclass
}

-(void)setFooterView{
	//    UIEdgeInsets test = self.aoView.contentInset;
    // if the footerView is nil, then create it, reset the position of the footer
    CGFloat height = MAX(qtmquitView.contentSize.height, qtmquitView.frame.size.height);
    if (_refreshFooterView && [_refreshFooterView superview])
	{
        // reset position
        _refreshFooterView.frame = CGRectMake(0.0f,
                                              height,
                                              qtmquitView.frame.size.width,
                                              self.view.bounds.size.height);
    }else
	{
        // create the footerView
        _refreshFooterView = [[EGORefreshTableFooterView alloc] initWithFrame:
                              CGRectMake(0.0f, height,
                                         qtmquitView.frame.size.width, self.view.bounds.size.height)];
        _refreshFooterView.delegate = self;
        [qtmquitView addSubview:_refreshFooterView];
    }
    
    if (_refreshFooterView)
	{
        [_refreshFooterView refreshLastUpdatedDate];
    }
}


-(void)removeFooterView
{
    if (_refreshFooterView && [_refreshFooterView superview])
	{
        [_refreshFooterView removeFromSuperview];
    }
    _refreshFooterView = nil;
}

//===============
//刷新delegate
#pragma mark -
#pragma mark data reloading methods that must be overide by the subclass

-(void)beginToReloadData:(EGORefreshPos)aRefreshPos{
	
	//  should be calling your tableviews data source model to reload
	_reloading = YES;
    
    if (aRefreshPos == EGORefreshHeader)
	{
        // pull down to refresh data
        [self performSelector:@selector(refreshView) withObject:nil afterDelay:2.0];
    }else if(aRefreshPos == EGORefreshFooter)
	{
        // pull up to load more data
        [self performSelector:@selector(getNextPageView) withObject:nil afterDelay:2.0];
    }
	
	// overide, the actual loading data operation is done in the subclass
}

//刷新调用的方法
-(void)refreshView
{
	NSLog(@"刷新完成");
    [self testFinishedLoadData];
	
}
//加载调用的方法
-(void)getNextPageView
{
//	for(int i = 0; i < 10; i++) {
//		[_images addObject:[NSString stringWithFormat:@"%d.jpeg", i % 10 + 1]];
//	}
	[qtmquitView reloadData];
    [self removeFooterView];
    [self testFinishedLoadData];
}

#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	if (_refreshHeaderView)
	{
        [_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    }
	
	if (_refreshFooterView)
	{
        [_refreshFooterView egoRefreshScrollViewDidScroll:scrollView];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
	if (_refreshHeaderView)
	{
        [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
    }
	
	if (_refreshFooterView)
	{
        [_refreshFooterView egoRefreshScrollViewDidEndDragging:scrollView];
    }
}


#pragma mark -
#pragma mark EGORefreshTableDelegate Methods

- (void)egoRefreshTableDidTriggerRefresh:(EGORefreshPos)aRefreshPos
{
	
	[self beginToReloadData:aRefreshPos];
	
}

- (BOOL)egoRefreshTableDataSourceIsLoading:(UIView*)view{
	
	return _reloading; // should return if data source model is reloading
	
}


// if we don't realize this method, it won't display the refresh timestamp
- (NSDate*)egoRefreshTableDataSourceLastUpdated:(UIView*)view
{
	
	return [NSDate date]; // should return date data source was last changed
	
}
//- (UIImage *)imageAtIndexPath:(NSIndexPath *)indexPath {
//    return [UIImage imageNamed:[self.images objectAtIndex:indexPath.row]];
//}

- (NSInteger)quiltViewNumberOfCells:(TMQuiltView *)TMQuiltView {
    NSLog(@"%@===%@",firstView,fisrstView_Height);
    return [fisrstView_Height count];
}

- (TMQuiltViewCell *)quiltView:(TMQuiltView *)quiltView cellAtIndexPath:(NSIndexPath *)indexPath {
    TMPhotoQuiltViewCell *cell = (TMPhotoQuiltViewCell *)[quiltView dequeueReusableCellWithReuseIdentifier:@"PhotoCell"];
    if (!cell) {
        cell = [[TMPhotoQuiltViewCell alloc] initWithReuseIdentifier:@"PhotoCell"];
    }
    NSDictionary *dict=[[NSDictionary alloc]init];
    NSLog(@"%@",firstView);
    dict=[firstView objectAtIndex:indexPath.row];
    NSLog(@"======%d",indexPath.row);
    NSString *url=[NSString stringWithFormat:@"%@image/%@",webImageURL,[dict objectForKey:@"thumb"]] ;
    
    
    [cell.photoView setImageWithURL:[NSURL URLWithString: url]
                   placeholderImage:[UIImage imageNamed:@"moren.png"]
                            success:^(UIImage *image) {  NSLog(@"图片显示成功OK%d ",indexPath.row);}
                            failure:^(NSError *error) {NSLog(@"资讯置顶图片显示失败NO");}];
    cell.titleLabel.text = [NSString stringWithFormat:@"%d", indexPath.row];
    
    UIView *back=[[UIView alloc]init];
    back.backgroundColor=[UIColor whiteColor];
    back.frame=CGRectMake(0, 0, 145.0, 80);
    
    UILabel *label_name=[[UILabel alloc]initWithFrame:CGRectMake(4, 0, 136.0, 50)];
    label_name.backgroundColor=[UIColor clearColor];
    label_name.textColor=TAB_COLOR_DARK;
    label_name.font=[UIFont fontWithName:@"Helvetica" size:13.0];
    label_name.numberOfLines = 0;
    label_name.lineBreakMode = NSLineBreakByTruncatingTail;//dkfd....
    label_name.text=[dict objectForKey:@"name"];
    [back addSubview:label_name];
    
    UIImageView *price_ImageView=[[UIImageView alloc]initWithFrame:CGRectMake(-1, 49,82, 22)];
    price_ImageView.image=[UIImage imageNamed:@"price_Label.png"];
    UILabel *price_label=[[UILabel alloc]initWithFrame:CGRectMake(20,2, 59, 17)];
    price_label.textColor=TAB_COLOR_LIGHT;
    price_label.backgroundColor=[UIColor clearColor];
    price_label.text=[dict objectForKey:@"price"];
    price_label.font=[UIFont fontWithName:@"Helvetica" size:12.0];
    [price_ImageView addSubview:price_label];
    [back addSubview:price_ImageView];
    
    UIImageView *love_imageView=[[UIImageView alloc]initWithFrame:CGRectMake(95, 52, 20, 17)];
    love_imageView.image=[UIImage imageNamed:@"icon_product_favorite_normal.png"];
    [back addSubview:love_imageView];
    UILabel *love_total=[[UILabel alloc]initWithFrame:CGRectMake(116, 52, 28, 17)];
    love_total.backgroundColor=[UIColor clearColor];
    love_total.textColor=TAB_COLOR_LIGHT;
    love_total.font=[UIFont fontWithName:@"Helvetica" size:12.0];
    love_total.text=[dict objectForKey:@"liked"];
    [back addSubview:love_total];
    
    
    
    [cell.view addSubview:back];    return cell;
}

#pragma mark - TMQuiltViewDelegate

- (NSInteger)quiltViewNumberOfColumns:(TMQuiltView *)quiltView {
	
    return 2;
}

- (CGFloat)quiltView:(TMQuiltView *)quiltView heightForCellAtIndexPath:(NSIndexPath *)indexPath
{
    return [[fisrstView_Height objectAtIndex:indexPath.row]integerValue] / [self quiltViewNumberOfColumns:quiltView];
}

- (void)quiltView:(TMQuiltView *)quiltView didSelectCellAtIndexPath:(NSIndexPath *)indexPath
{
	NSLog(@"index:%d",indexPath.row);
    ProductViewController *view=[[ProductViewController alloc] init];
    [self.navigationController pushViewController:view animated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)createNavigationBarItem
{
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
-(void)createSecondaryTab//Home页面 最新 最好 的两个选择按钮
{
    UIView *secondaryTabView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 33)];
    secondaryTabView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_btn_wave"]];
    
    CGSize titleSize = [@"Bestseller" sizeWithFont:[UIFont fontWithName:@"Helvetica" size:12.0]];
    _newestBtn = [[UIButton alloc] init];
    _newestBtn.titleLabel.Font = [UIFont fontWithName:@"Helvetica" size:12.0];
    _newestBtn.frame = CGRectMake(40, 6, titleSize.width += 10, 21);
    [_newestBtn setBackgroundImage:[UIImage imageNamed:@"btn_wave_selected"] forState:UIControlStateSelected];
    [_newestBtn setTitleColor:TAB_COLOR_DARK forState:UIControlStateNormal];
    [_newestBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_newestBtn setTitle:@"Newest" forState:UIControlStateNormal];
    [_newestBtn addTarget:self action:@selector(newwestBtnSelected) forControlEvents:UIControlEventTouchUpInside];
    _newestBtn.selected = YES;
    
    _bestSellerBtn = [[UIButton alloc] init];
    int marginRight = 320-40-titleSize.width-10;
    _bestSellerBtn.titleLabel.Font = [UIFont fontWithName:@"Helvetica" size:12.0];
    _bestSellerBtn.frame = CGRectMake(marginRight, 6, titleSize.width += 10, 21);
    [_bestSellerBtn setBackgroundImage:[UIImage imageNamed:@"btn_wave_selected"] forState:UIControlStateSelected];
    [_bestSellerBtn setTitleColor:TAB_COLOR_DARK forState:UIControlStateNormal];
    [_bestSellerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_bestSellerBtn setTitle:@"Bestseller" forState:UIControlStateNormal];
    [_bestSellerBtn addTarget:self action:@selector(bestsellerBtnSelected) forControlEvents:UIControlEventTouchUpInside];
    
    [secondaryTabView addSubview:_newestBtn];
    [secondaryTabView addSubview:_bestSellerBtn];
    [self.view addSubview:secondaryTabView];
}
#pragma -mark button action
- (void)newwestBtnSelected
{
    _newestBtn.selected = YES;
    _bestSellerBtn.selected = NO;
  }

- (void)bestsellerBtnSelected
{
    _newestBtn.selected = NO;
    _bestSellerBtn.selected = YES;
}

- (void)backToPreviousView
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
