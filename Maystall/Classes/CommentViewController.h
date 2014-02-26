//
//  CommentViewController.h
//  Maystall
//
//  Created by ss4346 on 13-11-1.
//  Copyright (c) 2013年 huiztech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface CommentViewController : BaseViewController
{
    UITableView *myTableView;

    //数据
    NSMutableArray *commentArray;
}

@end
