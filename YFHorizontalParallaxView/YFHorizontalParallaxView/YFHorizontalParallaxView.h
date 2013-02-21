//
//  YFHorizontalParallaxView.h
//  YFHorizontalParallaxView
//
//  Created by Yang Fei on 13-2-21.
//  Copyright (c) 2013年 Yang Fei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFHorizontalParallaxView : UIView
/**
 *  @param views The views for display, from inside to outside
 */
- (id)initWithFrame:(CGRect)frame views:(NSArray *)views;
@end
