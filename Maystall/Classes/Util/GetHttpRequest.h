//
//  GetHttpRequest.h
//  Maystall
//
//  Created by 宋硕 on 14-2-9.
//  Copyright (c) 2014年 huiztech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetHttpRequest : ASIFormDataRequest

+ (ASIFormDataRequest *)sharedClient;

@end
