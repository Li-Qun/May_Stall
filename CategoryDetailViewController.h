//
//  CategoryDetailViewController.h
//  Maystall
//
//  Created by DAWEI FAN on 27/02/2014.
//  Copyright (c) 2014 huiztech. All rights reserved.
//

#import "BaseViewController.h"

@interface CategoryDetailViewController : BaseViewController<UIScrollViewDelegate>
{
    NSString *name_CategoryDetail;
}
@property(nonatomic,retain)NSString *name_CategoryDetail;
@end
