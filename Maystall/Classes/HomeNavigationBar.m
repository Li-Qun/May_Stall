//
//  HomeNavigationBar.m
//  Maystall
//
//  Created by ss4346 on 13-10-28.
//  Copyright (c) 2013年 huiztech. All rights reserved.
//

#import "HomeNavigationBar.h"

@implementation HomeNavigationBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    UIImage *backImage = [UIImage imageNamed:@"bg_home_nav"];
    [backImage drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}


@end
