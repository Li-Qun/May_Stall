//
//  Singleton.h
//  Fish
//
//  Created by DAWEI FAN on 04/01/2014.
//  Copyright (c) 2014 liqun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject
{
    NSMutableArray *lastestBtn;
    NSMutableArray *lastestBtn_height;
//    NSMutableArray *hotestBtn;
//    NSMutableArray *hotestBtn_height;
}

+ (Singleton *) sharedInstance;
@property(nonatomic,retain)     NSMutableArray *lastestBtn;
@property(nonatomic,retain) NSMutableArray *lastestBtn_height;

@end
