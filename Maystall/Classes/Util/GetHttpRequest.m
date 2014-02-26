//
//  GetHttpRequest.m
//  Maystall
//
//  Created by 宋硕 on 14-2-9.
//  Copyright (c) 2014年 huiztech. All rights reserved.
//

#import "GetHttpRequest.h"
#import "ASIFormDataRequest.h"


@implementation GetHttpRequest

+ (ASIFormDataRequest *)sharedClient {
    static ASIFormDataRequest *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        _sharedClient = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:kMAY_BASE_URL(kGET_ALL_CATEGORY)]];
        _sharedClient = [[ASIFormDataRequest alloc] init];

    });
    
    return _sharedClient;
}


- (id) initWithURL:(NSURL *)newURL
{
    self = [super initWithURL:url];
    if (!self) {
        return nil;
    }
    
    
    
    return self;
}

@end
