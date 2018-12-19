//
//  NSMutableString+WGCommon.m
//  CustomLearn
//
//  Created by wanggang on 2018/10/16.
//  Copyright © 2018 WG. All rights reserved.
//

#import "NSMutableString+WGCommon.h"
#import <CoreText/CoreText.h>

@implementation NSMutableString (WGCommon)

/**
 *  替换字符串
 *
 *  @param searchString 将要被替换的字符串
 *  @param newString    替换后的字符串
 */
- (void)replaceString:(NSString *)searchString withString:(NSString *)newString {
    NSRange range = [self rangeOfString:searchString];
    [self replaceCharactersInRange:range withString:newString];
}

/**
 *  去除空格
 */
- (void)removeSpace {
    [self replaceString:@" " withString:@""];
}

- (void)removeNilAndNull {
    
    if ([self isEqual:[NSNull null]]| (self == nil)) {
        
        [self setString:@""];
    }
}

- (CGFloat)heightWithContainWidth:(CGFloat)width{
    int total_height = 0;
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)self);
    CGRect drawingRect = CGRectMake(0, 0, width, 100000);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, drawingRect);
    CTFrameRef textFrame = CTFramesetterCreateFrame(framesetter,CFRangeMake(0,0), path, NULL);
    CGPathRelease(path);
    CFRelease(framesetter);
    
    NSArray *linesArray = (NSArray *) CTFrameGetLines(textFrame);
    if(linesArray.count == 0)return 0;
    CGPoint origins[[linesArray count]];
    CTFrameGetLineOrigins(textFrame, CFRangeMake(0, 0), origins);
    int line_y = (int) origins[[linesArray count] -1].y;
    CGFloat ascent;
    CGFloat descent;
    CGFloat leading;
    CTLineRef line = (__bridge CTLineRef) [linesArray objectAtIndex:[linesArray count]-1];
    CTLineGetTypographicBounds(line, &ascent, &descent, &leading);
    
    total_height = 100000 - line_y + (int) descent +1;
    CFRelease(textFrame);
    return total_height;
}
@end
