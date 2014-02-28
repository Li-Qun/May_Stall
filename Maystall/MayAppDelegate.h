//
//  MayAppDelegate.h
//  Maystall
//
//  Created by ss4346 on 13-10-28.
//  Copyright (c) 2013年 huiztech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MayAppDelegate : NSObject <UIApplicationDelegate,UINavigationControllerDelegate>{
    UIWindow *window;
    UINavigationController *navigationController;
    NSMutableArray *arrary_mul;
    NSMutableArray *arrary_height;
    
//    NSMutableArray *lastestBtn;
//    NSMutableArray *lastestBtn_height;
//    NSMutableArray *hotestBtn;
//    NSMutableArray *hotestBtn_height;

}

@property (retain, nonatomic) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic,retain)NSMutableArray *arrary_mul;
@property (nonatomic,retain)NSMutableArray *arrary_height;

@property (nonatomic,retain)NSMutableArray *lastestBtn;
@property (nonatomic,retain) NSMutableArray *lastestBtn_height;
@property (nonatomic,retain) NSMutableArray *hotestBtn;
@property (nonatomic,retain)NSMutableArray *hotestBtn_height;

@end
