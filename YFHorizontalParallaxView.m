//
//  YFHorizontalParallaxView.m
//  YFHorizontalParallaxView
//
//  Created by Yang Fei on 13-2-21.
//  Copyright (c) 2013年 Yang Fei. All rights reserved.
//

#import "YFHorizontalParallaxView.h"

@interface YFHorizontalParallaxView () <UIScrollViewDelegate>
@property (nonatomic, strong) NSMutableArray *scrollViewArray;
@end

@implementation YFHorizontalParallaxView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)dealloc{
    [[_scrollViewArray lastObject] removeObserver:self forKeyPath:@"contentOffset"];
}

- (id)initWithFrame:(CGRect)frame views:(NSArray *)views
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _scrollViewArray = [NSMutableArray array];
        for (UIView *view in views) {
            UIScrollView *sv = [[UIScrollView alloc] initWithFrame:self.bounds];
            sv.delegate = self;
            sv.contentSize = view.frame.size;
            [sv addSubview:view];
            [self addSubview:sv];
            [_scrollViewArray addObject:sv];
        }
        [[_scrollViewArray lastObject] addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (void)updateViewsContentOffsetByPercent:(float)percent{
    for (int i=0; i<[_scrollViewArray count]-1; i++) {
        UIScrollView *sv = [_scrollViewArray objectAtIndex:i];
        sv.contentOffset = CGPointMake(percent*(sv.contentSize.width-sv.frame.size.width), sv.contentOffset.y);
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if(![keyPath isEqualToString:@"contentOffset"]) return;
    CGPoint offset = [[change objectForKey:@"new"] CGPointValue];
    UIScrollView *foregroundScrollView = [_scrollViewArray lastObject];
    float percent = offset.x/(foregroundScrollView.contentSize.width-foregroundScrollView.frame.size.width);
    [self updateViewsContentOffsetByPercent:percent];
}

@end
