//
//  UrlValue.h
//  Maystall
//
//  Created by ss4346 on 14-1-3.
//  Copyright (c) 2014年 huiztech. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kBASEURL    @"http://www.maystall.com/index.php?route=mobile/ajax/"
#define webImageURL                    @"http://www.maystall.com/"

#define kACTION         @"action"
#define kCATEGORY       @"categorys"


#define kADDLIKE        @"addLike"
#define KDELLIKE        @"delLike"
#define kADDCUSTOMER    @"addCustomer"
#define kPRODCUT        @"product"
#define kPRODCUTS       @"products"


#define kPRODUCT_ID     @"product_id"
#define kCUSTOMER_ID    @"customer_id"
#define kPAGE           @"page"
#define kLIMIT          @"limit"
#define kFILETER_PRICE  @"fileter_price"
#define kFIRStNAME      @"firstname"
#define kLASTNAME       @"lastname"
#define kEMAIL          @"email"
#define KPASSWORD       @"password"
#define kPATH           @"path"

//==========//阅钓测试
#define Root @"http://42.96.192.186/app/mgz/"
#define Image_Head @"http://42.96.192.186/upload/"

//==========//阅钓测试

//===================//===================//===================//===================//===================//===================//===================
//===================gougou项目的api 测试用
#define BASE_URL      @"http://42.96.192.186/gogou/common/index.php?route="

#define BASE_UPLOAD(path)    [NSString stringWithFormat:@"http://42.96.192.186/gogou/common/upload/%@",path]

//data/xx/.... 的地址，基地址为
#define BASE_IMAGE(path)     [NSString stringWithFormat:@"http://42.96.192.186/gogou/common/image/%@",path]

//【用户】注册
#define REGISTER      @"http://42.96.192.186/gogou/common/index.php?route=app/customer/customer/register"

//【用户】登录
#define LOGIN      @"http://42.96.192.186/gogou/common/index.php?route=app/customer/customer/login"

//用户】绑定第三方帐户
#define LOGIN_THIRD      @"http://42.96.192.186/gogou/common/index.php?route=app/customer/customer/binding_third_party_account"

//【用户】修改
#define EDIT_USER      @"http://42.96.192.186/gogou/common/index.php?route=app/customer/customer/edit"

//【用户】查询 - 详细
#define RETRIEVE_DETAIL      @"http://42.96.192.186/gogou/common/index.php?route=app/customer/customer/retrieve_detail"

//【用户】留言
#define LEAVE_NOTE      @"http://42.96.192.186/gogou/common/index.php?route=app/customer/customer/contact"

//【用户收藏】添加
#define USER_FAVOVITE_ADD      @"http://42.96.192.186/gogou/common/index.php?route=app/customer/favorite/add"

//【用户收藏】删除
#define USER_FAVOVITE_DELETE      @"http://42.96.192.186/gogou/common/index.php?route=app/customer/favorite/delete"

//【用户收藏】查询 - 列表 - 个人
#define USER_FOLLOW_RETRIEVE_LIST      @"http://42.96.192.186/gogou/common/index.php?route=app/customer/favorite/retrieve_list"

//【用户关注】添加
#define USER_ADD_ATTENTION      @"http://42.96.192.186/gogou/common/index.php?route=app/customer/follow/add"

//【用户关注】删除
#define USER_DEL_ATTENTION      @"http://42.96.192.186/gogou/common/index.php?route=app/customer/follow/delete"

//【用户关注】查询 - 列表 - 个人
#define USER_ALL_ATTENTION      @"http://42.96.192.186/gogou/common/index.php?route=app/customer/follow/retrieve_list"

//【商场】查询 - 列表
#define STRORE_RETRIEVE_LIST      @"http://42.96.192.186/gogou/common/index.php?route=app/market/market/retrieve_list"

//【商家】查询 - 详细
#define MANUFACTURER_RETRIEVE_DETAIL      @"http://42.96.192.186/gogou/common/index.php?route=app/manufacturer/retrieve_detail"

//【商家】查询 - 列表
#define SEARCH_MANUFACTURER      @"http://42.96.192.186/gogou/common/index.php?route=app/manufacturer/retrieve_list"

//【商家】查询 - 详细 - 图片
#define MARKET_FLOORS_IMAGES      @"http://42.96.192.186/gogou/common/index.php?route=app/market/image/retrieve_list"

//分类
#define CATEGORY      @"http://42.96.192.186/gogou/common/index.php?route=app/product/category/retrieve_list"

//【商品】查询 - 列表
#define PRODUCT_LIST      @"http://42.96.192.186/gogou/common/index.php?route=app/product/product/retrieve_list"

//【商家】查询 - 详细
#define PRODUCT_DETAIL      @"http://42.96.192.186/gogou/common/index.php?route=app/product/product/retrieve_detail"

//【商品图片】查询 - 列表
#define IMAGE_RETRIEVE_LIST      @"http://42.96.192.186/gogou/common/index.php?route=app/product/image/retrieve_list"

//【商品评论】添加
#define REVIEW_ADD      @"http://42.96.192.186/gogou/common/index.php?route=app/product/review/add"

//【商品评论】查询 - 列表
#define REVIEW_RETRIEVE_LIST   @"http://42.96.192.186/gogou/common/index.php?route=app/product/review/retrieve_list"

//【优惠活动】查询 - 详细
#define PROMOTION_RETRIEVE_LIST      @"http://42.96.192.186/gogou/common/index.php?route=app/promotion/retrieve_list"

//【优惠活动】查询 - 详细
#define PROMOTION_RETRIEVE_DETAIL      @"http://42.96.192.186/gogou/common/index.php?route=app/promotion/retrieve_detail"



//====================================================================================================================================
//链接参数
//====================================================================================================================================

#define TELEPHONE       @"telephone"
#define PASSWORD        @"password"
#define ACCOUNT_TYPE    @"account_type"
#define FOR_LOGIN       @"for_login"
#define OLD_PASSWORD    @"old_password"
#define NES_PASSWORD    @"new_password"
#define NICKNAME        @"nickname"
#define FILE            @"file"

#define NAME            @"name"
#define EMAIL           @"eamil"
#define QQ              @"qq"
#define ADDRESS         @"address"
#define MESSAGE         @"message"

#define FILTER_MARKET_ID        @"filter_market_id"
#define FILTER_MANUFACTURER_ID  @"filter_manufacturer_id"
#define FILTER_NAME             @"filter_name"
#define FILTER_CATEGORY_ID      @"filter_category_id"
#define FILTER_SPECIAL          @"filter_special"
#define FILTER_SPECIAL_PRO      @"filter_special_pro"
#define PAGE                    @"page"

#define FOR_IS_LOGIN            @"for_is_login"
#define MARKET_ID               @"market_id"
#define MANUFACTURER_ID         @"manufacturer_id"

#define PRODUCT_ID              @"product_id"

#define CONTENT_ID              @"content_id"
#define CONTENT_TYPE            @"content_type"
#define CONTENT_EXTRA           @"content_extra"
#define TEXT                    @"text"

#define PROMOTION_ID               @"promotion_id"

@interface UrlValue : NSObject

@end
