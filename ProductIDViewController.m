//
//  ProductIDViewController.m
//  Maystall
//
//  Created by Liqun on 01/03/2014.
//  Copyright (c) 2014 huiztech. All rights reserved.
//

#import "ProductIDViewController.h"

#import "MayColorValue.h"
#import "MayValue.h"
#import "Config.h"

#import "UIImageView+WebCache.h"
#import "SBJson.h"
#import "ASIFormDataRequest.h"
#import <QuartzCore/QuartzCore.h>
#import "CheckNetwork.h"
@interface ProductIDViewController ()

@end

@implementation ProductIDViewController
@synthesize ID_Product=ID_Product;
@synthesize Name_Product=Name_Product;
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
    [self getMainArray];
   
}
-(void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.navigationController.navigationBarHidden = NO;
    self.navigationItem.title =@"Product Detail";
    self. navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];//更改导航栏标题颜色 为白色
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
    //http://www.maystall.com/index.php?route=mobile/ajax&action=product&product_id=283&debug=1
        NSString *string=[NSString stringWithFormat:@"%@",kBASEURL];
        NSURL *url = [ NSURL URLWithString :  string ];
        __block ASIFormDataRequest *request = [ ASIFormDataRequest requestWithURL :url];
        [request setRequestMethod:@"POST"];
        [request setPostValue:kPRODCUT forKey:kACTION];
         [request setPostValue:ID_Product forKey:kPRODUCT_ID];
         //NSLog(@"%d",[request responseStatusCode]);
        [request setCompletionBlock :^{
            NSString * response  =  [request responseString];
            SBJsonParser *parser = [[SBJsonParser alloc] init];
            NSDictionary *dict = [parser objectWithString:response];
            [self creatTheProductDetail:dict];
        }];
        [request setFailedBlock :^{
            
        }];
        [request startAsynchronous ];//异步
    }
}
-(void)creatTheProductDetail:(NSDictionary *)dict
{
    NSLog(@"%@",dict);
    UIImageView *image_Product=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 140)];
    NSString *url=[NSString stringWithFormat:@"%@image/%@",webImageURL,[dict objectForKey:@"image"]] ;

    [image_Product setImageWithURL:[NSURL URLWithString: url]
                   placeholderImage:[UIImage imageNamed:@"moren.png"]
                            success:^(UIImage *image) { NSLog(@"产品详细图片显示成功OK ");}
                            failure:^(NSError *error) {NSLog(@"产品详细图片显示失败NO");}];
    image_Product.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:image_Product];
    
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
#pragma -mark button action
- (void)backToPreviousView
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
