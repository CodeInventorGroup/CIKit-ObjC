//
//  UIView+CICConstructor.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/13.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import "UIView+CICConstructor.h"

@interface CICUIViewConstructor ()
    
@property (nonatomic, weak) UIView *component;
    
@end

@implementation CICUIViewConstructor
    
- (instancetype)initWithComponent:(UIView *)component {
    self = [super init];
    if (self) {
        self.component = component;
        [self buildConstructor];
    }
    return self;
}
    
- (void)buildConstructor {
    __weak typeof(&*self) weakSelf = self;
    
    NSLog(@"CICUIViewConstructor %@", [self description]);

    self.x = ^CICUIViewConstructor *(CGFloat x) {
        weakSelf.component.frame = CGRectSetX(weakSelf.component.frame, x);
        return weakSelf;
    };
    
    _y = ^CICUIViewConstructor *(CGFloat y) {
        weakSelf.component.frame = CGRectSetY(weakSelf.component.frame, y);
        return weakSelf;
    };
    
    _width = ^CICUIViewConstructor *(CGFloat width) {
        weakSelf.component.frame = CGRectSetWidth(weakSelf.component.frame, width);
        return weakSelf;
    };
    
    _height = ^CICUIViewConstructor *(CGFloat height) {
        weakSelf.component.frame = CGRectSetHeight(weakSelf.component.frame, height);
        return weakSelf;
    };
    
    _size = ^CICUIViewConstructor *(CGSize size) {
        weakSelf.component.frame = CGRectSetSize(weakSelf.component.frame, size);
        return weakSelf;
    };
    
    _centerX = ^CICUIViewConstructor *(CGFloat centerX) {
        weakSelf.component.center = CGPointMake(centerX, weakSelf.component.center.y);
        return weakSelf;
    };
    
    _centerY = ^CICUIViewConstructor *(CGFloat centerY) {
        weakSelf.component.center = CGPointMake(weakSelf.component.center.x, centerY);
        return weakSelf;
    };
    
    _center = ^CICUIViewConstructor *(CGPoint center) {
        weakSelf.component.center = center;
        return weakSelf;
    };
    
    _frame = ^CICUIViewConstructor *(CGRect rect) {
        weakSelf.component.frame = rect;
        return weakSelf;
    };
    //MARK: - Render
    _backgroundColor = ^CICUIViewConstructor *(UIColor *color) {
        weakSelf.component.backgroundColor = color;
        return weakSelf;
    };
    
    _tag = ^CICUIViewConstructor *(NSInteger tag) {
        weakSelf.component.tag = tag;
        return weakSelf;
    };
    
    self.hidden = ^CICUIViewConstructor *(BOOL hidden) {
        weakSelf.component.hidden = hidden;
        return weakSelf;
    };
    
    self.cornerRadius = ^CICUIViewConstructor *(CGFloat cornerRadius) {
        weakSelf.component.layer.cornerRadius = cornerRadius;
        return weakSelf;
    };
    
    self.masksToBounds = ^CICUIViewConstructor *(BOOL masksToBounds) {
        weakSelf.component.layer.masksToBounds = masksToBounds;
        return weakSelf;
    };
    
    self.borderWidth = ^CICUIViewConstructor *(CGFloat borderWidth) {
        weakSelf.component.layer.borderWidth = borderWidth;
        return weakSelf;
    };
    
    self.borderColor = ^CICUIViewConstructor *(UIColor *borderColor) {
        weakSelf.component.layer.borderColor = borderColor.CGColor;
        return weakSelf;
    };
    
    self.clipToBounds = ^CICUIViewConstructor *(BOOL clipToBounds) {
        weakSelf.component.clipsToBounds = clipToBounds;
        return weakSelf;
    };
    
    self.addTo = ^CICUIViewConstructor *(UIView *toView) {
        [toView addSubview:weakSelf.component];
        return weakSelf;
    };
}
    
- (void)dealloc {
    NSLog(@"CICUIViewConstructor dealloc");
}

@end

@implementation UIView (CICConstructor)
    
- (CICUIViewConstructor *)cic {

    return [[CICUIViewConstructor alloc] initWithComponent:self];
}

@end
