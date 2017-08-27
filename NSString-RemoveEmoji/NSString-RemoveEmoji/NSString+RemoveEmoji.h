//
//  NSString+RemoveEmoji.h
//  NSString+RemoveEmoji
//
//  Created by Jakey on 15/5/13.
//  Copyright (c) 2015年 Jakey. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface NSString (RemoveEmoji)
///移除所有emoji，以“”替换
- (NSString *)removingEmoji;
///移除所有emoji，以“”替换
- (NSString *)stringByRemovingEmoji;
///移除所有emoji，以string替换
- (NSString *)stringByReplaceingEmojiWithString:(NSString*)string;

///字符串是否包含emoji
- (BOOL)containsEmoji;
///字符串中包含的所有emoji unicode格式
- (NSArray<NSString *>*)allEmoji;
///字符串中包含的所有emoji
- (NSString *)allEmojiString;
///字符串中包含的所有emoji rang
- (NSArray<NSString *>*)allEmojiRanges;

///所有emoji表情
+ (NSString*)allSystemEmoji;
@end

@interface NSCharacterSet (EmojiCharacterSet)
+ (NSCharacterSet *)emojiCharacterSet;
@end
