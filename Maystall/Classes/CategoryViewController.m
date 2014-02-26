//
//  CategoryViewController.m
//  Maystall
//
//  Created by ss4346 on 13-10-29.
//  Copyright (c) 2013年 huiztech. All rights reserved.
//

#import "CategoryViewController.h"
#import "MayColorValue.h"
#import "CheckNetwork.h"

#import "ASIHTTPRequest.h"
#import "Reachability.h"

#import "SBJson.h"
#import "ASIFormDataRequest.h"
#import <QuartzCore/QuartzCore.h>

#define BUTTON_TAG 10000

@interface CategoryViewController ()

@end

@implementation CategoryViewController

@synthesize categoryArray = _categoryArray;

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
    //数据初始化
    _categoryArray = [[NSMutableArray alloc] init];
    
    [self getCategory];
    [self mainView];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.navigationController.navigationBarHidden = NO;
    [self setTabNavigationBarTitleWithText:@"XX"];
}



#pragma -mark 
#pragma http connection
- (void)getCategory
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
        [request setPostValue:kCATEGORY forKey:kACTION];
    
        NSLog(@"%d",[request responseStatusCode]);
        [request setCompletionBlock :^{
            NSString * response  =  [request responseString];
            SBJsonParser *parser = [[SBJsonParser alloc] init];
            NSArray *array = [parser objectWithString:response];
            NSLog(@"%@",array);

        }];
        [request setFailedBlock :^{
            NSLog(@"HTTP 响应码：%d",[request responseStatusCode]);
            NSError *error = [request error ];
            NSLog ( @"error:%@" ,[error userInfo ]);
        }];
        [request startAsynchronous ];//异步
    }
    /*
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:kCATEGORY,kACTION, nil];
    
    [[AFOSCClient sharedClient] postPath:kBASEURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *response = operation.responseString;
        NSLog(@"response string :%@",response);
        SBJsonParser *parser = [[SBJsonParser alloc] init];
        NSArray *array = [parser objectWithString:response];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error is %@",error);
    }];*/

}

#pragma -mark button action
- (void)btnSelected:(id)sender
{
    UIButton *btn=(UIButton *)sender;
    NSLog(@"%d",btn.tag);
}

#pragma -mark add subview
- (void)mainView
{
    //第一条
    clothView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 120)];
    
    clothTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    clothTitle.backgroundColor = [UIColor clearColor];
    clothTitle.text = @"Cloth";
    
    clothBtn = [[UIButton alloc] initWithFrame:CGRectMake(290, 0, 30, 30)];
    [clothBtn setBackgroundImage:[UIImage imageNamed:@"btn_nav_back"] forState:UIControlStateHighlighted];
    [clothBtn setBackgroundImage:[UIImage imageNamed:@"btn_nav_back"] forState:UIControlStateNormal];
    
    clothScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 30, 320, 90)];
    [clothScroll setContentSize:CGSizeMake(600, 90)];
    
    for (int i = 0; i < 6; i++) {
        UIButton *image = [[UIButton alloc] initWithFrame:CGRectMake(0+i*100, 0, 100, 90)];
        [image setImage:[UIImage imageNamed:@"1.jpeg" ] forState:UIControlStateNormal];
        [image setTag:BUTTON_TAG +i];
        image.backgroundColor = [UIColor yellowColor];
        [image addTarget:self action:@selector(btnSelected:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(60, 70, 40, 20)];
        label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_image_label"]];
        label.text = @"test";
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont fontWithName:@"Helvetica" size:9];
        label.textColor = [UIColor whiteColor];
        [image addSubview:label];
        [clothScroll addSubview:image];
    }
    
    //第二条
    shoesView = [[UIView alloc] initWithFrame:CGRectMake(0, 120, 320, 120)];
    
    shoesTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    shoesTitle.backgroundColor = [UIColor clearColor];
    shoesTitle.text = @"Shoes";
    
    shoesBtn = [[UIButton alloc] initWithFrame:CGRectMake(290, 0, 30, 30)];
    [shoesBtn setBackgroundImage:[UIImage imageNamed:@"btn_nav_back"] forState:UIControlStateHighlighted];
    [shoesBtn setBackgroundImage:[UIImage imageNamed:@"btn_nav_back"] forState:UIControlStateNormal];
    
    shoesScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 30, 320, 90)];
    [shoesScroll setContentSize:CGSizeMake(480, 90)];
    
    for (int i = 0; i < 6; i++) {
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0+i*100, 0, 100, 90)];
        [image setImage:[UIImage imageNamed:@"1.jpeg"]];
        image.backgroundColor = [UIColor yellowColor];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(60, 70, 40, 20)];
        label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_image_label"]];
        label.text = @"test";
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont fontWithName:@"Helvetica" size:9];
        label.textColor = [UIColor whiteColor];
        [image addSubview:label];
        [shoesScroll addSubview:image];
    }
    
    //第三条
    bagView = [[UIView alloc] initWithFrame:CGRectMake(0, 240, 320, 120)];
    
    bagTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    bagTitle.backgroundColor = [UIColor clearColor];
    bagTitle.text = @"Bag";
    
    bagBtn = [[UIButton alloc] initWithFrame:CGRectMake(290, 0, 30, 30)];
    [bagBtn setBackgroundImage:[UIImage imageNamed:@"btn_nav_back"] forState:UIControlStateHighlighted];
    [bagBtn setBackgroundImage:[UIImage imageNamed:@"btn_nav_back"] forState:UIControlStateNormal];
    bagScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 30, 320, 90)];
    [bagScroll setContentSize:CGSizeMake(480, 90)];
    bagScroll.backgroundColor = [UIColor yellowColor];
    
    for (int i = 0; i < 6; i++) {
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0+i*100, 0, 100, 90)];
        [image setImage:[UIImage imageNamed:@"1.jpeg"]];
        image.backgroundColor = [UIColor yellowColor];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(60, 70, 40, 20)];
        label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_image_label"]];
        label.text = @"test";
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont fontWithName:@"Helvetica" size:9];
        label.textColor = [UIColor whiteColor];
        [image addSubview:label];
        [bagScroll addSubview:image];
    }
    
    [clothView addSubview:clothTitle];
    [clothView addSubview:clothBtn];
    [clothView addSubview:clothScroll];
    [self.view addSubview:clothView];
    
    [shoesView addSubview:shoesTitle];
    [shoesView addSubview:shoesBtn];
    [shoesView addSubview:shoesScroll];
    [self.view addSubview:shoesView];
    
    [bagView addSubview:bagTitle];
    [bagView addSubview:bagBtn];
    [bagView addSubview:bagScroll];
    [self.view addSubview:bagView];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
