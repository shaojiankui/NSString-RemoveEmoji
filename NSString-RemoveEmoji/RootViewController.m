//
//  RootViewController.m
//  NSString-RemoveEmoji
//
//  Created by Jakey on 15/5/13.
//  Copyright (c) 2015年 Jakey. All rights reserved.
//

#import "RootViewController.h"
#import "NSString+RemoveEmoji.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // Do any additional setup after loading the view from its nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    NSError*error;
    NSString *origin = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"emojilist"
                                                 ofType:@"txt"]
                                                 encoding:NSUTF8StringEncoding
                                                    error: &error];
    NSLog(@"unicode string:%@",[self utf8ToUnicode:origin]);

    self.text.text = origin;
}
- (IBAction)removingEmoji:(id)sender {
    NSString *string =  [self.text.text removingEmoji];
    self.result.text = string;
    NSLog(@"removingEmoji:%@",string);
}

- (IBAction)stringByRemovingEmoji:(id)sender {
    NSString *string =  [self.text.text stringByRemovingEmoji];
    self.result.text = string;
    NSLog(@"stringByRemovingEmoji:%@",string);
}

- (IBAction)stringByReplaceingEmojiWithString:(id)sender {
    NSString *string =  [self.text.text stringByReplaceingEmojiWithString:@"<emoji>"];
    self.result.text = string;
    NSLog(@"stringByReplaceingEmojiWithString:%@",string);
}

- (IBAction)allEmoji:(id)sender {
    NSLog(@"allEmoji:%@",[self.text.text allEmoji]);
    NSLog(@"allEmojiString:%@",[self.text.text allEmojiString]);
}

- (IBAction)allEmojiRanges:(id)sender {
    NSLog(@"allEmojiRanges:%@",[self.text.text allEmojiRanges]);
}

- (IBAction)allSystemEmoji:(id)sender {
    NSLog(@"allEmoji:%@",[NSString allSystemEmoji]);
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{

    return YES;
}



-(NSString *)utf8ToUnicode:(NSString *)string

{
    NSUInteger length = [string length];
    NSMutableString *unicodeString = [NSMutableString stringWithCapacity:0];
    for (int i = 0;i < length; i++)
        
    {
        unichar _char = [string characterAtIndex:i];
        if (_char <= '9' && _char >='0')
        {
            [unicodeString appendFormat:@"%@",[string substringWithRange:NSMakeRange(i,1)]];
            
        }
        else if(_char >='a' && _char <= 'z')
            
        {
            [unicodeString appendFormat:@"%@",[string substringWithRange:NSMakeRange(i,1)]];
        }
        
        else if(_char >='A' && _char <= 'Z')
            
        {
            [unicodeString appendFormat:@"%@",[string substringWithRange:NSMakeRange(i,1)]];
        }
        else
        {
            [unicodeString appendFormat:@"\\u%x",[string characterAtIndex:i]];
        }
    }
    return unicodeString;
}

+ (NSString*)unicodeToUtf8:(NSString*)aUnicodeString

{
    NSString *tempString1 = [aUnicodeString stringByReplacingOccurrencesOfString:@"\\u"withString:@"\\U"];
    
    NSString *tempString2 = [tempString1 stringByReplacingOccurrencesOfString:@"\""withString:@"\\\""];
    
    NSString *tempString3 = [[@"\""stringByAppendingString:tempString2] stringByAppendingString:@"\""];
    
    NSData *tempData = [tempString3 dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *returnString = [NSPropertyListSerialization propertyListWithData:tempData options:NSPropertyListImmutable format:NULL error:NULL];

    return [returnString stringByReplacingOccurrencesOfString:@"\\r\\n"withString:@"\n"];
}
@end
