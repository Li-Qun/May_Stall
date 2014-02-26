//
//  Config.h
//  Maystall美容
//
//  Created by 宋硕 on 14-2-7.
//  Copyright (c) 2014年 huiztech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Config : NSObject

//是否具备网络链接
@property BOOL isNetworkRunning;

//是否已经登录
@property BOOL isLogin;

//保存登录用户名以及密码
-(void)saveUserNameAndPwd:(NSString *)userName andPwd:(NSString *)pwd;
-(NSString *)getUserName;
-(NSString *)getPwd;

+(Config *) Instance;
@end
