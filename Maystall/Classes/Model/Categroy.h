//
//  Categroy.h
//  Maystall
//
//  Created by 宋硕 on 14-2-11.
//  Copyright (c) 2014年 huiztech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Categroy : NSObject{
    NSString *image;
    NSString *category_id;
    NSString *name;
    NSString *data_added;
    NSString *data_modified;
    NSString *description;
}

@property (strong,nonatomic) NSString *image;
@property (strong,nonatomic) NSString *categroy_id;
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *data_added;
@property (strong,nonatomic) NSString *data_modified;
@property (strong,nonatomic) NSString *description;

@end
