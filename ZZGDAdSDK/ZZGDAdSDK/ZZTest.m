//
//  ZZTest.m
//  ZZGDAdSDK
//
//  Created by zhengzhanghai on 2023/7/24.
//

#import "ZZTest.h"
#import <objc/message.h>

@implementation ZZTest

+ (void)showCSJDebugView {
    id CSJMDebugToolsClass = objc_getClass("CSJMDebugTools");
    SEL sel = sel_registerName("startVisualDebug");
    ((void(*)(id, SEL))(void *)objc_msgSend)(CSJMDebugToolsClass, sel);
}

@end
