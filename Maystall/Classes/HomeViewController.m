//
//  HomeViewController.m
//  Maystall
//
//  Created by ss4346 on 13-10-29.
//  Copyright (c) 2013年 huiztech. All rights reserved.
//

#import "HomeViewController.h"
#import "MayColorValue.h"
#import "Config.h"

#import "SBJson.h"
#import "ASIFormDataRequest.h"
#import <QuartzCore/QuartzCore.h>
#import "CheckNetwork.h"

#import "TMQuiltView.h"
#import "TMPhotoQuiltViewCell.h"

#import "SDImageCache.h"

#import "MayAppDelegate.h"


#import "UIImageView+WebCache.h"
@interface HomeViewController ()


//@property (nonatomic, strong) NSMutableArray *images;
@end

@implementation HomeViewController
@synthesize images=images;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    [super loadView];
}- (void)viewDidLoad
{


    [super viewDidLoad];
    app = (MayAppDelegate *)[[UIApplication sharedApplication] delegate];
    app.arrary_mul=[[NSMutableArray alloc]init];
    app.arrary_height=[[NSMutableArray alloc]init];
    [self setTabNavigationBarTitleWithText:@"home"];
    
    //适配ios7
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
    {
        self.navigationController.navigationBar.translucent = NO;
    }
    [self getMainArray:@"latest"];                                    //VIEW_HEIGHT-178-44
    qtmquitView = [[TMQuiltView alloc] initWithFrame:CGRectMake(0, 178 , 320, VIEW_HEIGHT-178-44)];
    qtmquitView.contentSize=CGSizeMake(0, 480);
   // qtmquitView.contentSize=CGSizeMake(0, 1000);
    
    
    //测试 存取账号密码
    [[Config Instance] saveUserNameAndPwd:@"SongShuo" andPwd:@"1234567890"];
    NSString *name = [Config Instance].getUserName;
    NSString *pwd = [Config Instance].getPwd;
    NSLog(@"name>>%@---- pwd>>%@",name,pwd);
    
//    TestIPay88ViewController *view = [[TestIPay88ViewController alloc] init];
//    [self.navigationController pushViewController:view animated:YES];
//    [self dismissViewControllerAnimated:YES completion:nil];
    
    
//    LoginViewController *view = [[LoginViewController alloc] init];
//    [self.navigationController pushViewController:view animated:YES];
//    [self dismissViewControllerAnimated:YES completion:nil];
    
//    ProductDetailViewController *view = [[ProductDetailViewController alloc] init];
//    [self.navigationController pushViewController:view animated:YES];
    
    [self createBannerView];//创建上方滚动图片
    [self createSecondaryTab];//创建下方最新最棒
    
    //初始化数据
    totalPage = 0;
    currentPage = 1;
    
    self.totalArray = [[NSMutableArray alloc] init];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.navigationController.navigationBarHidden = NO;
    [self setTabNavigationBarTitleWithText:@"Home"];
    [self.view addSubview:qtmquitView];
}
-(void)viewDidDisappear:(BOOL)animated
{
    for (id obj in self.view.subviews) {
        if ([obj isKindOfClass:[TMQuiltView class]] ) {
            [obj removeFromSuperview];
        }
    }
}
#pragma -mark
#pragma  method get data by url
- (void)getMainArray :(NSString *)est_str
{
    //检查网络是否存在 如果不存在 则弹出提示
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
        
        NSString *string=[NSString stringWithFormat:@"%@",kBASEURL];
        NSURL *url = [ NSURL URLWithString :  string ];
        __block ASIFormDataRequest *request = [ ASIFormDataRequest requestWithURL :url];
        [request setRequestMethod:@"POST"];
        [request setPostValue:kPRODCUTS forKey:kACTION];
        [request setPostValue:@"" forKey:@"path"];
        [request setPostValue:est_str forKey:@"type"];
        
        NSLog(@"%d",[request responseStatusCode]);
        [request setCompletionBlock :^{
            NSString * response  =  [request responseString];
            SBJsonParser *parser = [[SBJsonParser alloc] init];
            NSDictionary *array = [parser objectWithString:response];
            NSLog(@"%@",array);
           [self creatWater:[array objectForKey:@"products"]];
            [self.view addSubview:qtmquitView];
            
        }];
        [request setFailedBlock :^{
            NSLog(@"HTTP 响应码：%d",[request responseStatusCode]);
            NSError *error = [request error ];
            NSLog ( @"error:%@" ,[error userInfo ]);
        }];
        [request startAsynchronous ];//异步

    
    }
}
-(void)creatWater:(NSArray *)array
{
 
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for(int i=0;i<array.count;i++)
        {
            [app.arrary_mul addObject:[array objectAtIndex:i]];
        }
        for(int i=0;i<array.count;i++)
        {
            NSDictionary *dict=[[NSDictionary alloc]init];
            dict=[app.arrary_mul objectAtIndex:i];
            
            NSString *url=[NSString stringWithFormat:@"%@image/%@",webImageURL,[dict objectForKey:@"thumb"]] ;
            UIImageView *imageView=[[UIImageView alloc]init];
            //        [imageView setImageWithURL:[NSURL URLWithString: url]];
            //     [app.arrary_height addObject:[NSString stringWithFormat:@"%f",imageView.image.size.height]];
            [imageView setImageWithURL:[NSURL URLWithString: url]
                      placeholderImage:[UIImage imageNamed:@"moren.png"]
                               success:^(UIImage *image) { [app.arrary_height addObject:[NSString stringWithFormat:@"%f",image.size.height]];if(app.arrary_height.count==array.count)
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
        
        
        dispatch_async(dispatch_get_main_queue(), ^{//主线程
            
        
            
//            NSLog(@"%@",app.arrary_height);
//            qtmquitView.delegate = self;
//            qtmquitView.dataSource = self;
//            
//            [self.view addSubview:qtmquitView];
//            [qtmquitView reloadData];
//            [self createHeaderView];
            
        });
    });
    

  
	//[self performSelector:@selector(testFinishedLoadData) withObject:nil afterDelay:0.0f];
}
#pragma -mark button action
- (void)newwestBtnSelected
{
    _newestBtn.selected = YES;
    _bestSellerBtn.selected = NO;
    [self getMainArray:@"latest"];
    [qtmquitView reloadData];
}

- (void)bestsellerBtnSelected
{
    _newestBtn.selected = NO;
    _bestSellerBtn.selected = YES;
    [self getMainArray:@"hot"];
    [qtmquitView reloadData];
}
#pragma -mark add SubView

- (void)createBannerView//上方五个滚动图片请求接口是什么
{
    advList = [[NSMutableArray alloc] init];
    [advList addObject:@"1.jpeg"];
    [advList addObject:@"2.jpeg"];
    [advList addObject:@"3.jpeg"];
    [advList addObject:@"4.jpeg"];
    [advList addObject:@"5.jpeg"];
    
    //添加最后一张图 用于循环
    NSMutableArray *itemArray = [NSMutableArray arrayWithCapacity:advList.count+2];
    if (advList.count > 1)
    {
        SGFocusImageItem *item = [[SGFocusImageItem alloc] initWithTitle:nil image:[advList objectAtIndex:advList.count-1] tag:-1];
        [itemArray addObject:item];
    }
    for (int i = 0; i < advList.count; i++)
    {
        SGFocusImageItem *item = [[SGFocusImageItem alloc] initWithTitle:nil image:[advList objectAtIndex:i] tag:i];
        [itemArray addObject:item];
    }
    //添加第一张图 用于循环kl
    if (advList.count >1)
    {
        SGFocusImageItem *item = [[SGFocusImageItem alloc] initWithTitle:nil image:[advList objectAtIndex:0] tag:advList.count];
        [itemArray addObject:item];
    }
    
    SGFocusImageFrame *bannerView = [[SGFocusImageFrame alloc] initWithFrame:CGRectMake(0, 0, 320, 140) delegate:self imageItems:itemArray isAuto:YES];
    [bannerView scrollToIndex:2];
    
    [self.view addSubview:bannerView];
}

-(void)createSecondaryTab//Home页面 最新 最好 的两个选择按钮
{
    UIView *secondaryTabView = [[UIView alloc] initWithFrame:CGRectMake(0, 140, 320, 33)];
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

-(void)aowClick:(DataInfo *)data//代理方法的作用？？？？
{
    NSLog(@"...testing...  ...testing...");
    NSLog(@" >>>  %@",data.name);

    ProductViewController *view = [[ProductViewController alloc] init];
    [self.navigationController pushViewController:view animated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

///@@@@@@@判断当前是否有网络  判断了吗
//////waterflow  start


//////waterflow  end


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
//	for(int i = 0; i < 5; i++) {
//		[images addObject:[NSString stringWithFormat:@"%d.jpeg", i % 10 + 1]];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (NSMutableArray *)images
//{
//    if (!images)
//	{
//        NSMutableArray *imageNames = [NSMutableArray array];
//        for(int i = 0; i < 10; i++) {
//            [imageNames addObject:[NSString stringWithFormat:@"%d.jpeg", i % 10 + 1]];
//        }
//        images =imageNames  ;
//    }
//    return images;
//}


//- (UIImage *)imageAtIndexPath:(NSIndexPath *)indexPath {
//    return  [UIImage imageNamed:[self.images objectAtIndex:indexPath.row]];
//}

- (NSInteger)quiltViewNumberOfCells:(TMQuiltView *)TMQuiltView {
    return app.arrary_mul.count;
}

- (TMQuiltViewCell *)quiltView:(TMQuiltView *)quiltView cellAtIndexPath:(NSIndexPath *)indexPath {
    
    TMPhotoQuiltViewCell *cell = (TMPhotoQuiltViewCell *)[quiltView dequeueReusableCellWithReuseIdentifier:@"PhotoCell"];
    if (!cell) {
        cell = [[TMPhotoQuiltViewCell alloc] initWithReuseIdentifier:@"PhotoCell"];
    }
    NSDictionary *dict=[[NSDictionary alloc]init];
    dict=[app.arrary_mul objectAtIndex:indexPath.row];
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
    
    
    
    [cell.view addSubview:back];
    
    
    
    return cell;
    
}

#pragma mark - TMQuiltViewDelegate

- (NSInteger)quiltViewNumberOfColumns:(TMQuiltView *)quiltView {
	
    
//    if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft
//        || [[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeRight)
//	{
//        return 2;
//    }
//    else {
//        return 3;
//    }
    return 2;
}

- (CGFloat)quiltView:(TMQuiltView *)quiltView heightForCellAtIndexPath:(NSIndexPath *)indexPath
{
    return [[app.arrary_height objectAtIndex:indexPath.row] integerValue] / [self quiltViewNumberOfColumns:quiltView];
}

- (void)quiltView:(TMQuiltView *)quiltView didSelectCellAtIndexPath:(NSIndexPath *)indexPath
{
	NSLog(@"index:%d",indexPath.row);
}



@end
