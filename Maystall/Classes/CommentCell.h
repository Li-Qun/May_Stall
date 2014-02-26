//
//  CommentCell.h
//  Maystall
//
//  Created by ss4346 on 13-11-1.
//  Copyright (c) 2013年 huiztech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentCell : UITableViewCell

@property (strong,nonatomic) IBOutlet UILabel *userLabel;
@property (strong,nonatomic) IBOutlet UILabel *titleLabel;
@property (strong,nonatomic) IBOutlet UILabel *description;

@end
