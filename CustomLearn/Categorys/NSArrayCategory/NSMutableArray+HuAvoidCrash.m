//
//  NSMutableArray+HuAvoidCrash.m
//  HuCategoryKit
//
//  Created by wanggang on 2019/5/7.
//

#import "NSMutableArray+HuAvoidCrash.h"
#import <objc/message.h>

@implementation NSMutableArray (HuAvoidCrash)

+(void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class class = NSClassFromString(@"__NSArrayM");
        Method old = class_getInstanceMethod(class, @selector(replaceObjectAtIndex:withObject:));
        Method new = class_getInstanceMethod(class, @selector(hu_replaceObjectAtIndex:withObject:));

        if (old && new) {
            method_exchangeImplementations(old, new);
        }
        
    });
}

-(void)hu_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject{
    
    if (self.count > index && anObject) {
        
        [self hu_replaceObjectAtIndex:index withObject:anObject];
    }else{
    }
}

@end
