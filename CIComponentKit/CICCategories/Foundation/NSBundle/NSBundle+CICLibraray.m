//
//  NSBundle+CICLibraray.m
//  CICKit
//
//  Created by NEWWORLD on 2019/4/11.
//

#import "NSBundle+CICLibraray.h"

static NSString *const kLocalBundleName = @"CIComponentKit";
static NSString *const kTabbarControllerClassName = @"CICTabBarController";

@implementation NSBundle (CICLibraray)

+ (NSBundle *)cic_localLibrayBundle {
    
    return [self bundleWithURL:[self cic_localLibraryBundleURL]];
}

+ (NSURL *)cic_localLibraryBundleURL {
    
    NSBundle *bundle = [NSBundle bundleForClass:NSClassFromString(kTabbarControllerClassName)];
    return [bundle URLForResource:kLocalBundleName withExtension:@"bundle"];
}

@end
