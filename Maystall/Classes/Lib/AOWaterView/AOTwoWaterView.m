//
//  AOWaterView.m
//  AOWaterView
//
//  Created by akria.king on 13-4-10.
//  Copyright (c) 2013年 akria.king. All rights reserved.
//

#import "AOTwoWaterView.h"

#define WIDTH 320/2
@implementation AOTwoWaterView
//@synthesize adelegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

//初始化视图
-(id)initWithDataArray:(NSMutableArray *)array{
    
    self=[super initWithFrame:CGRectMake(0, 0, 320, 416)];
    if (self) {
        [self initProperty];//初始化参数
        for (int i=0; i<array.count; i++) {
            if (i/2>0&&i%2==0) {
                row++;
            }
            DataInfo *data = (DataInfo*)[array objectAtIndex:i];
           
            //如果是第一行
            if (row==1) {
                switch (i%2) {
                    case 0:
                        
                        [self addMessView:lower DataInfo:data];
                      
                        break;
                    case 1:
                        
                        [self addMessView:lower DataInfo:data];

                        break;
                    default:
                        break;
                }

            }else{
                
                [self addMessView:lower DataInfo:data];
                
            }
            //重新判断最高和最低view
            [self getHViewAndLView];


        }
        //添加scrollView
        [self setContentSize:CGSizeMake(320, highValue)];
        [self addSubview:v1];
        [self addSubview:v2];
        
    }
    return self;
}
//初始化参数
-(void)initProperty{
    row =1;
    //初始化第一列视图
    v1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 0)];
    //初始化第二列视图
    v2 = [[UIView alloc]initWithFrame:CGRectMake(WIDTH, 0, WIDTH, 0)];
   
 //初始化最高视图
    higher =1;
    //初始化最低视图
    lower=1;
    highValue=1;
 

}

//向视图添加MessView
-(void)addMessView:(int)lValue DataInfo:(DataInfo *)data{
    MessTwoView *mView=nil;
    float hValue=0;
    switch (lValue) {
        case 1:
            // 创建内容视图
            mView= [[MessTwoView alloc]initWithData:data yPoint:v1.frame.size.height];
            [mView setIdelegate:self];
            hValue=mView.frame.size.height;
            v1.frame=CGRectMake(v1.frame.origin.x, v1.frame.origin.y, WIDTH, v1.frame.size.height+hValue);
            [v1 addSubview:mView];
           
            break;
        case 2:
            // 创建内容视图
            mView= [[MessTwoView alloc]initWithData:data yPoint:v2.frame.size.height];
            [mView setIdelegate:self];
            hValue=mView.frame.size.height;
            v2.frame=CGRectMake(v2.frame.origin.x, v2.frame.origin.y, WIDTH, v2.frame.size.height+hValue);
            [v2 addSubview:mView];
         
            break;
            
        default:
            break;
    }
   
    
}
-(void)getHViewAndLView{
   

    if (v1.frame.size.height>highValue) {
        highValue=v1.frame.size.height;
        higher=1;
    }else if(v2.frame.size.height>highValue) {
        highValue=v2.frame.size.height;
        higher=2;
    }
    
    float v1Height=v1.frame.size.height;
    float v2Height=v2.frame.size.height;
    
    if (v1Height<v2Height) {
        lower=1;
    }else{
        lower=2;
    }
    
      }

//加载数据
-(void)getNextPage:(NSMutableArray *)array
{
    for (int i=0; i<array.count; i++) {
        if (i/2>0&&i%2==0) {
            row++;
        }
        DataInfo *data = (DataInfo*)[array objectAtIndex:i];
        
        [self addMessView:lower DataInfo:data];
       
        //重新判断最高和最低view
        [self getHViewAndLView];
    }
    //添加scrollView
    [self setContentSize:CGSizeMake(320, highValue)];
}

-(void)refreshView:(NSMutableArray *)array{
    [v1 removeFromSuperview];
    [v2 removeFromSuperview];
   
    v1=nil;
    v2=nil;

    row =1;
    [self initProperty];//初始化参数
    for (int i=0; i<array.count; i++) {
        if (i/2>0&&i%2==0) {
            row++;
        }
        DataInfo *data = (DataInfo*)[array objectAtIndex:i];
        
        //如果是第一行
        if (row==1) {
            switch (i%3) {
                case 0:
                    
                    [self addMessView:lower DataInfo:data];
                    
                    break;
                case 1:
                    
                    [self addMessView:lower DataInfo:data];
                    
                    break;
            
                default:
                    break;
            }
            
        }else{
            
            [self addMessView:lower DataInfo:data];
            
        }
        //重新判断最高和最低view
        [self getHViewAndLView];
        
        
    }

    //添加scrollView
    [self setContentSize:CGSizeMake(320, highValue)];
    [self addSubview:v1];
    [self addSubview:v2];

}

-(void)click:(DataInfo *)data
{
    [self.adelegate aowClick:data];
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


@end
