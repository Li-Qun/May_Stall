//
//  ProductIDViewController.m
//  Maystall
//
//  Created by Liqun on 01/03/2014.
//  Copyright (c) 2014 huiztech. All rights reserved.
//

#import "ProductIDViewController.h"
#import "CheckString.h"

#import "MayColorValue.h"
#import "MayValue.h"
#import "Config.h"
#import "CutImage.h"

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
    
    webView_Information=[[UIWebView alloc]init];
    array_shape=[[NSArray alloc]init];
    size_color_array=[[NSMutableArray alloc]init];
    label_buy_Num=[[UILabel alloc]init];
    count_label=[[UILabel alloc]init];
    totoal_BackGround=[[UIImageView alloc]init];
    string_Numbers=@"0";
    string_Money_total=@"0.00";
    scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, VIEW_HEIGHT)];
    scrollView.contentSize=CGSizeMake(0, 570);
    scrollView.delegate=self;
    scrollView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:scrollView];
    [self createNavigationBarItem];
    [self getMainArray];
    [self cartView_board];//cart select board
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
         [request setPostValue:ID_Product forKey:kPRODUCT_ID];//ID_Product@"36"
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
- (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
-(void)creatTheProductDetail:(NSDictionary *)dict
{
    NSLog(@"%@",dict);
    array_shape=[dict objectForKey:@"options"];
    UIImageView *image_Product=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 320)];
    NSString *url=[NSString stringWithFormat:@"%@image/%@",webImageURL,[dict objectForKey:@"image"]] ;

    [image_Product setImageWithURL:[NSURL URLWithString: url]
                   placeholderImage:[UIImage imageNamed:@"moren.png"]
                            success:^(UIImage *image) {
                                NSLog(@"产品详细图片显示成功OK ");
                                CGRect rect=[CutImage scaleImage:image toSize:CGRectMake(0.0, 0.0,300,320)];
                                
                                image_Product.frame=CGRectMake((320-rect.size.width)/2, 0, rect.size.width,rect.size.height);
                      
                                return ;
                            }
                            failure:^(NSError *error) {NSLog(@"产品详细图片显示失败NO");}];
    [scrollView addSubview:image_Product];
    UIImageView *imageView_NamePrice=[[UIImageView alloc]initWithFrame:CGRectMake(0, image_Product.frame.size.height, 320, 44)];
    imageView_NamePrice.backgroundColor=[UIColor yellowColor];
    scrollView.contentSize=CGSizeMake(0, image_Product.frame.size.height*2);
    [scrollView addSubview:imageView_NamePrice];
    
    UILabel *label_Name=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 240, 44)];
    label_Name.backgroundColor=[UIColor orangeColor];
    label_Name.font=[UIFont fontWithName:@"Helvetica" size:13.0];
    if([CheckString isBlankString:[dict objectForKey:@"name"] ])
    {
        label_Name.text=@"null";
    }
    else
    label_Name.text=[dict objectForKey:@"name"];
    label_Name.textColor=TAB_COLOR_LIGHT;
    label_Name.textAlignment=NSTextAlignmentCenter;
    [imageView_NamePrice addSubview:label_Name];
    UILabel *label_Price=[[UILabel alloc]initWithFrame:CGRectMake(240, 0,80 , 44)];
    label_Price.backgroundColor=[UIColor clearColor];
    label_Price.textColor=TAB_COLOR_LIGHT;
    label_Price.textAlignment=NSTextAlignmentCenter;
    
 
    NSString *stringMoney=[NSString stringWithFormat:@"%@",[dict objectForKey:@"special"]];
    BOOL isString=[CheckString isBlankString:[dict objectForKey:@"special"]];
    if(isString)//为空 显示price
    {
        if([CheckString isBlankString:[dict objectForKey:@"price"]])
        label_Price.text=@"0";
        else
        label_Price.text=[dict objectForKey:@"price"];
    }
    else//special 不为空 显示 special 
    {
        label_Price.text=stringMoney;
        
    }
    string_Money_Single=label_Price.text;
    [imageView_NamePrice addSubview:label_Price];
    float height=image_Product.frame.size.height+44;
    height_ever=height;
    [self createSecondaryTab:height];//创建下方选择 评价 产品规格选项按钮
    
    NSString *html;
    if([CheckString isBlankString:[dict objectForKey:@"intro"]])
    html=@"null";
    else
    html=[dict objectForKey:@"intro"];

    
    html=[self htmlEntityDecode :html];
    NSString *bodyHTML = [NSString stringWithFormat:@"<html> \n"
                          "<head> \n"
                          "<link href=\"default.css\" rel=\"stylesheet\" type=\"text/css\" /> \n"
                          "</head> \n"
                          "<body\">%@</body> \n"
                          "</html>", html];
    
 
    
   [webView_Information loadHTMLString:bodyHTML  baseURL:[NSURL URLWithString:@"http://www.maystall.com/"]];
    webView_Information.delegate=self;
   [self createBottomBar];
}
-(NSString *)htmlEntityDecode:(NSString *)string
{
    string = [string stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    string = [string stringByReplacingOccurrencesOfString:@"&apos;" withString:@"'"];
    string = [string stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
    string = [string stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    string = [string stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
    return string;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)createSecondaryTab:(float)height//Home页面 最新 最好 的两个选择按钮
{
    UIView *secondaryTabView = [[UIView alloc] initWithFrame:CGRectMake(0, height, 320, 33)];
    secondaryTabView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_btn_wave"]];
    
    CGSize titleSize = [@"Introduction" sizeWithFont:[UIFont fontWithName:@"Helvetica" size:12.0]];
    _newestBtn = [[UIButton alloc] init];
    _newestBtn.titleLabel.Font = [UIFont fontWithName:@"Helvetica" size:12.0];
    _newestBtn.frame = CGRectMake(40, 6, titleSize.width += 10, 21);
    _newestBtn.tag=100;
    [_newestBtn setBackgroundImage:[UIImage imageNamed:@"btn_wave_selected"] forState:UIControlStateSelected];
    [_newestBtn setTitleColor:TAB_COLOR_DARK forState:UIControlStateNormal];
    [_newestBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_newestBtn setTitle:@"Graphic" forState:UIControlStateNormal];
    [_newestBtn addTarget:self action:@selector(BtnSelected:) forControlEvents:UIControlEventTouchUpInside];
    _newestBtn.selected = YES;
    
    _bestSellerBtn = [[UIButton alloc] init];
    int marginRight = 320-40-titleSize.width-10;
    _bestSellerBtn.tag=200;
    _bestSellerBtn.titleLabel.Font = [UIFont fontWithName:@"Helvetica" size:12.0];
    _bestSellerBtn.frame = CGRectMake(marginRight, 6, titleSize.width += 10, 21);
    [_bestSellerBtn setBackgroundImage:[UIImage imageNamed:@"btn_wave_selected"] forState:UIControlStateSelected];
    [_bestSellerBtn setTitleColor:TAB_COLOR_DARK forState:UIControlStateNormal];
    [_bestSellerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_bestSellerBtn setTitle:@"Introduction" forState:UIControlStateNormal];
    [_bestSellerBtn addTarget:self action:@selector(BtnSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [secondaryTabView addSubview:_newestBtn];
    [secondaryTabView addSubview:_bestSellerBtn];
    [scrollView addSubview:secondaryTabView];
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
- (void)createBottomBar
{
    int height = [UIScreen mainScreen].bounds.size.height - [UIApplication sharedApplication].statusBarFrame.size.height -44 -49;
    
    bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, height, 320, 49)];
    //    bottomView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];
    bottomView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_bottom_tab"]];
    
  /*
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
    */
    //收藏按钮
    favoriteBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 70, 49)];
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
    shareBtn = [[UIButton alloc] initWithFrame:CGRectMake(83.3, 0, 70, 49)];
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
    
    //购物车按钮                                         //249.9   166.6
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
-(void)cartView_board
{
    //cart View
    view_Select=[[UIView alloc] init] ;
    view_Select.frame=CGRectMake(0,View_Bottom_Height-49-44-20, 320, 0);
    view_Select.backgroundColor=[UIColor yellowColor];
    
}
#pragma -mark webView Delegate
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
//    NSString *height_str= [webView stringByEvaluatingJavaScriptFromString: @"document.body.offsetHeight"];
//    document.documentElement.innerText;//获取网页内容文字
     webView.frame = CGRectMake(10,height_ever+5+33,300,100);
   //  [scrollView addSubview:webView_Information];
     CGFloat height = [[webView stringByEvaluatingJavaScriptFromString:@"document.height"] floatValue];
    //CGFloat width = [[webView stringByEvaluatingJavaScriptFromString:@"document.width"] floatValue];
    CGRect frame = webView.frame;
    frame.size.height = height;
    frame.size.width = 300;
    webView.frame = frame;
    
    /*
     NSString *stringText= [webView stringByEvaluatingJavaScriptFromString: @"document.documentElement.innerText"];

    // Rounded corners.
    label_text=[[UILabel alloc]init];
    label_text.text=stringText;
    label_text.backgroundColor=[UIColor whiteColor];
    label_text.frame=CGRectMake(15,height_ever+5+33,300,150);
    //自动折行设置
    label_text.textAlignment=NSTextAlignmentLeft;//左顶格
    label_text.lineBreakMode = NSLineBreakByWordWrapping;
    label_text.numberOfLines = 0;
    [label_text sizeToFit];//高度自动适应
    //
    // Rounded corners.
    label_text.layer.cornerRadius =5;
    
    // A thin border.
    label_text.layer.borderColor = TAB_COLOR_LIGHT.CGColor;
    label_text.layer.borderWidth = 0.3;
    
    // Drop shadow.
    label_text.layer.shadowColor = [UIColor blackColor].CGColor;
    label_text.layer.shadowOpacity = 1.0;
    label_text.layer.shadowRadius = 7.0;
    label_text.layer.shadowOffset = CGSizeMake(0, 4);
    
    [scrollView addSubview:label_text];
    */
    
    
}
#pragma -mark button action
-(void)BtnSelected:(id)sender
{
    UIButton *btn=(UIButton *)sender;
    NSLog(@"%d",btn.tag);
    if(btn.tag==100)//左
    {
        _newestBtn.selected = YES;
        _bestSellerBtn.selected = NO;
        
        //[scrollView addSubview:webView_Information];
       [webView_Information removeFromSuperview];
      
      [label_text removeFromSuperview];
    }
    else
    {
        _newestBtn.selected = NO;
        _bestSellerBtn.selected = YES;
        [scrollView addSubview:webView_Information];

    }
}
- (void)backToPreviousView
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)commentBtnSelected
{
//    CommentViewController *view = [[CommentViewController alloc] init];
//    [self.navigationController pushViewController:view animated:YES];
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
    
    
    if (isCarted) {
        isCarted = NO;
        cartBtn.selected = NO;
 
        
//        [UIView animateWithDuration:0.3f animations:^{
//            view_Select.frame=CGRectMake(0,View_Bottom_Height-49-44-20, 320, 0);
//        } completion:^(BOOL finished) {
//            
//            [view_Select removeFromSuperview];
//        }];
        
        
    }else{
        
 
        isCarted = YES;
        cartBtn.selected = YES;
        //NSLog(@"%@",array_shape);
        //取消按钮start
        UIButton *button = [[UIButton alloc] init];
        button.titleLabel.Font = [UIFont fontWithName:@"Helvetica" size:12.0];
        button.frame = CGRectMake(258, 10,60, 30);
        UIImageView *view_buttonBack=[[UIImageView alloc]initWithFrame:button.frame];
        view_buttonBack.image=[UIImage imageNamed:@"search_box_bottom.png"];
        UIImageView *btn_select=[[UIImageView alloc]initWithFrame:button.frame];
        btn_select.image=[UIImage imageNamed:@"btn_add_cart_normal.png"];
        UILabel *label_button=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, 30)];
        label_button.text=@"Cancel";
        label_button.textAlignment=NSTextAlignmentCenter;
        label_button.font=[UIFont fontWithName:@"Helvetica" size:12.0];
        [button addSubview:label_button];
        [button setImage:view_buttonBack.image forState:UIControlStateNormal];
        [button addTarget:self action:@selector(Cancel_theSelcetBoard) forControlEvents:UIControlEventTouchUpInside];
        [view_Select addSubview:button];
        //取消按钮end
        int height=0;
        if(array_shape.count==0)
        {
            height=100;
            
             
        }
        else
        {
            [size_color_array removeAllObjects];
            for(int j=0;j<array_shape.count ;j++)
            {
                UILabel *label_column_first=[[UILabel alloc]initWithFrame:CGRectMake(10, 8+j*50, 50, 15)];
                label_column_first.text=[[array_shape objectAtIndex:j]objectForKey:@"name"];
                label_column_first.Font = [UIFont fontWithName:@"Helvetica" size:13.0];
                [view_Select addSubview:label_column_first];
                
                NSDictionary *dict=[array_shape objectAtIndex:j];
                NSArray *array_column=[[NSArray alloc]init];
                array_column=[dict objectForKey:@"option_value"];
                NSMutableArray *contain=[[NSMutableArray alloc]init];
                for (int i=0;i<array_column.count;i++) {
                    NSDictionary *dict_child=[array_column objectAtIndex:i];
                    UIButton *button = [[UIButton alloc] init];
                    button.titleLabel.Font = [UIFont fontWithName:@"Helvetica" size:12.0];
                    button.frame = CGRectMake(10+70*i, 25+j*50,60, 30);
                    height=MAX(height,25+j*50+30);
                    UIImageView *view_buttonBack=[[UIImageView alloc]initWithFrame:button.frame];
                    view_buttonBack.image=[UIImage imageNamed:@"search_box_bottom.png"];
                    UIImageView *btn_select=[[UIImageView alloc]initWithFrame:button.frame];
                    btn_select.image=[UIImage imageNamed:@"btn_add_cart_normal.png"];
                    UILabel *label_button=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, 30)];
                    label_button.text=[dict_child objectForKey:@"name"];
                    label_button.textAlignment=NSTextAlignmentCenter;
                    label_button.font=[UIFont fontWithName:@"Helvetica" size:12.0];
                    [button addSubview:label_button];
                    button.tag=[[dict_child objectForKey:@"option_value_id"]integerValue];
                    [button setImage:view_buttonBack.image forState:UIControlStateNormal];
                    [button addTarget:self action:@selector(Btn_Sender:) forControlEvents:UIControlEventTouchUpInside];
                   //  button.selected = NO;
                    [contain addObject:button];
                    [view_Select addSubview:button];
                }
                [size_color_array addObject:contain];
            }
            
            
            UILabel *number_label=[[UILabel alloc]init];
            number_label.frame=CGRectMake(10, height+5, 100, 15);
            number_label.text=@"Number";
            number_label.Font = [UIFont fontWithName:@"Helvetica" size:13.0];
            [view_Select addSubview:number_label];
            UIImageView *number_left=[[UIImageView alloc]init];
            number_left.frame=CGRectMake(10, height+30, 40, 35);
            number_left.image=[UIImage imageNamed:@"buy_btn_left.png"];
            UIButton *subtract=[[UIButton alloc]initWithFrame:number_left.frame];
            [subtract setImage: number_left.image forState:UIControlStateNormal];
            [subtract addTarget:self action:@selector(Decrease) forControlEvents:UIControlEventTouchUpInside];
            
            [view_Select addSubview:subtract];
            UIImageView *number_right=[[UIImageView alloc]init];
            number_right.frame=CGRectMake(110, height+30, 40, 35);
            UIButton *add=[[UIButton alloc]initWithFrame:number_right.frame];
            number_right.image=[UIImage imageNamed:@"buy_btn_right.png"];
            [add setImage: number_right.image forState:UIControlStateNormal];
            [add addTarget:self action:@selector(Increase) forControlEvents:UIControlEventTouchUpInside];
            
            [view_Select addSubview:add];
            
            [self.view addSubview:view_Select];
            
            label_buy_Num.text=string_Numbers;

            label_buy_Num.textAlignment=NSTextAlignmentCenter;
            label_buy_Num.Font = [UIFont fontWithName:@"Helvetica" size:14.0];
            label_buy_Num.backgroundColor=[UIColor whiteColor];
            label_buy_Num.frame=CGRectMake(50, height+30, 60, 33);
            [view_Select addSubview:label_buy_Num];
            

        }
        
        
        [UIView animateWithDuration:0.3f animations:^{
            view_Select.frame=CGRectMake(0,View_Bottom_Height-44-20-200-49, 320, 200+49);
        } completion:^(BOOL finished) {
            [bottomView removeFromSuperview];
        }];
        
        totoal_BackGround.frame=CGRectMake(0,view_Select.frame.size.height-49,320,49);
        totoal_BackGround.backgroundColor=[UIColor whiteColor];
        [view_Select addSubview:totoal_BackGround];
        
        UILabel *totalLabel_Word=[[UILabel alloc]initWithFrame:CGRectMake(2, 5, 80, 40)];
        totalLabel_Word.backgroundColor=[UIColor redColor];
        totalLabel_Word.text=@"Total (RM):";
        totalLabel_Word.textAlignment=NSTextAlignmentCenter;
        totalLabel_Word.Font = [UIFont fontWithName:@"Helvetica" size:14.0];
        [totoal_BackGround addSubview:totalLabel_Word];
        
        count_label.frame=CGRectMake(85, 5,110 , 40);
        count_label.backgroundColor=[UIColor grayColor];
        count_label.textColor=TAB_COLOR_DARK ;
        count_label.textAlignment=NSTextAlignmentCenter;
        count_label.Font = [UIFont fontWithName:@"Helvetica" size:16.0];
        count_label.text=string_Money_total;
        [totoal_BackGround addSubview:count_label];

        

    }

}
-(void)Btn_Sender:(id)sender
{
    
    UIButton *btn=(UIButton *)sender;
    NSLog(@"%d",btn.tag);
    UIImageView *view_buttonBack=[[UIImageView alloc]initWithFrame:btn.frame];
    view_buttonBack.image=[UIImage imageNamed:@"search_box_bottom.png"];
    UIImageView *btn_select=[[UIImageView alloc]initWithFrame:btn.frame];
    btn_select.image=[UIImage imageNamed:@"btn_add_cart_normal.png"];
    [btn setImage:btn_select.image forState:UIControlStateNormal];
    int k;
    BOOL flag=NO;
    for(int i=0;i<size_color_array.count;i++)
    {
        NSArray *array_btn=[[NSArray alloc]init];
        array_btn=[size_color_array objectAtIndex:i];
        for(int j=0;j<array_btn.count;j++)
        {
            UIButton *btn_Other=(UIButton *) [array_btn objectAtIndex:j];
            if(btn_Other.tag==btn.tag)
            {
                k=i;
                flag=YES;
                break;
            }
        }
        if(flag)
        break;
    }
    NSArray *array=[size_color_array objectAtIndex:k];
    for(int i=0;i<array.count;i++)
    {
        UIButton *btn_Other=(UIButton *) [array objectAtIndex:i];
         if(btn_Other.tag!=btn.tag)
        [btn_Other setImage:view_buttonBack.image forState:UIControlStateNormal];
    }
}
-(void)Cancel_theSelcetBoard
{
    [UIView animateWithDuration:0.3f animations:^{
        view_Select.frame=CGRectMake(0,View_Bottom_Height-49-44-20, 320, 0);
    } completion:^(BOOL finished) {
        
        [view_Select removeFromSuperview];
        [self.view addSubview:bottomView];
    }];
}
-(void)Decrease
{
    int num=[string_Numbers integerValue];
    num--;
    if(num<=0)
    {
        num=0;
    }
    string_Numbers=[NSString stringWithFormat:@"%d",num];
    label_buy_Num.text=string_Numbers;
    
    float single_money=[string_Money_Single floatValue];
    float total_money=[string_Money_Single floatValue];
    total_money=single_money*num;
    string_Money_total=[NSString stringWithFormat:@"%.2f",total_money];
    
    count_label.text=string_Money_total;
    
    [totoal_BackGround addSubview:count_label];
    [view_Select addSubview:label_buy_Num];
}
-(void)Increase
{
    int num=[string_Numbers integerValue];
    num++;
    string_Numbers=[NSString stringWithFormat:@"%d",num];
    label_buy_Num.text=string_Numbers;
    
    
    float single_money=[string_Money_Single floatValue];
    float total_money=[string_Money_Single floatValue];
    total_money=single_money*num;
    string_Money_total=[NSString stringWithFormat:@"%.2f",total_money];
    
    count_label.text=string_Money_total;
    
    [totoal_BackGround addSubview:count_label];
    [view_Select addSubview:label_buy_Num];
}
- (void)browserMore
{
    
}

@end
