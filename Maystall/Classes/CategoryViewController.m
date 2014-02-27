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

#import "Categroy.h"
#import "MayValue.h"
#import "UIImageView+WebCache.h"
#import "CategoryDetailViewController.h"
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
  //  [self mainView];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.navigationController.navigationBarHidden = NO;
    [self setTabNavigationBarTitleWithText:@"Category"];
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
        [request setPostValue:@"allcategory" forKey:kACTION];
    
        NSLog(@"%d",[request responseStatusCode]);
        [request setCompletionBlock :^{
            NSString * response  =  [request responseString];
            SBJsonParser *parser = [[SBJsonParser alloc] init];
            NSArray *array = [parser objectWithString:response];
            NSLog(@"%@",array);
            [self mainView:array];
        }];
        [request setFailedBlock :^{
//            NSLog(@"HTTP 响应码：%d",[request responseStatusCode]);
//            NSError *error = [request error ];
//            NSLog ( @"error:%@" ,[error userInfo ]);
        }];
        [request startAsynchronous ];//异步
    }
 
}


#pragma -mark button action
- (void)btnSelected:(id)sender
{
    UIButton *btn=(UIButton *)sender;
    NSLog(@"%d",btn.tag-BUTTON_TAG);
    CategoryDetailViewController *view = [[CategoryDetailViewController alloc] init];
    BOOL Flag=NO;
    for(int i=0;i<name_CategotyDetail.count;i++)
    {
         NSDictionary *dict=[name_CategotyDetail objectAtIndex:i];
          NSArray *dict_child=[dict objectForKey:@"children"];
        for(int j=0;j<dict_child.count;j++)
        {
            if([[[dict_child objectAtIndex:j]objectForKey:@"category_id"]integerValue ]==btn.tag-BUTTON_TAG)
            {
                view.name_CategoryDetail=[[dict_child objectAtIndex:j]objectForKey:@"name"];
                Flag=YES;
                break;
            }
        }
        if(Flag)
            break;
    }
    [self.navigationController pushViewController:view animated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma -mark add subview
- (void)mainView:(NSArray*)array
{   name_CategotyDetail=array;
    UIScrollView *scrollView_back=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, VIEW_HEIGHT-44)];
    scrollView_back.backgroundColor=[UIColor clearColor];
    scrollView_back.contentSize=CGSizeMake(0,750);
    [self.view addSubview:scrollView_back];
    for(int j=0;j<array.count;j++)
    {
        
        NSDictionary *dict=[array objectAtIndex:j];
        category.name=[dict objectForKey:@"name"];
        category.categroy_id=[dict objectForKey:@"category_id"];
        NSArray *dict_child=[dict objectForKey:@"children"];

        clothView = [[UIView alloc] initWithFrame:CGRectMake(0, 120*j, 320, 120)];
        
        clothTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 250, 30)];
        clothTitle.backgroundColor = [UIColor clearColor];
        clothTitle.text =[dict objectForKey:@"name"];
        
        clothBtn = [[UIButton alloc] initWithFrame:CGRectMake(290, 0, 30, 30)];
        [clothBtn setBackgroundImage:[UIImage imageNamed:@"btn_nav_back"] forState:UIControlStateHighlighted];
        [clothBtn setBackgroundImage:[UIImage imageNamed:@"btn_nav_back"] forState:UIControlStateNormal];
        
        clothScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 30, 320, 90)];
        [clothScroll setContentSize:CGSizeMake(600, 90)];
        for (int i = 0; i < dict_child.count; i++) {
            
            UIButton *image = [[UIButton alloc] initWithFrame:CGRectMake(0+i*100, 0, 100, 90)];
            
            UIImageView *imageView_btn=[[UIImageView alloc]initWithFrame:image.frame];
            imageView_btn.image=[UIImage imageNamed:@"Ocupy.png"];
//             NSString *url=[NSString stringWithFormat:@"%@image/%@",webImageURL, [[dict_child objectAtIndex:i]objectForKey:@"children"]] ;
//            [imageView_btn setImageWithURL:[NSURL URLWithString: url]
//                           placeholderImage:[UIImage imageNamed:@"moren.png"]
//                                    success:^(UIImage *image) { NSLog(@" 图片显示失败YES");}
//                                    failure:^(NSError *error) {NSLog(@" 图片显示失败NO");}];
            
            [image setImage:imageView_btn.image forState:UIControlStateNormal];
            
            [image setTag:BUTTON_TAG +[[[dict_child objectAtIndex:i]objectForKey:@"category_id"]integerValue ]];
            
            
            image.backgroundColor = [UIColor clearColor];
            [image addTarget:self action:@selector(btnSelected:) forControlEvents:UIControlEventTouchUpInside];
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(60, 70, 40, 20)];
            label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_image_label"]];
            label.text =[[dict_child objectAtIndex:i]objectForKey:@"name"];
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont fontWithName:@"Helvetica" size:9];
            label.textColor = [UIColor whiteColor];
            [image addSubview:label];
            [clothScroll addSubview:image];
        }
        [clothView addSubview:clothTitle];
        [clothView addSubview:clothBtn];
        [clothView addSubview:clothScroll];
        [scrollView_back addSubview:clothView];
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
