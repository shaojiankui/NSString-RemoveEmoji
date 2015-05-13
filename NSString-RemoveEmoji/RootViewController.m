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
    self.text.text = origin;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{

    return YES;
}

- (IBAction)filterTouched:(id)sender {
    NSString *string = self.text.text;
    NSLog(@"unicode test:%@",[self utf8ToUnicode:string]);
    
    string = [string removedEmojiString];
    self.result.text = string;
    NSLog(@"string:%@",string);
}




- (IBAction)fuckTouched:(id)sender {
   //NSString *test = @"⭐⭐️㊙️㊗️⬅️⬆️⬇️⤴️⤵️#️⃣0️⃣1️⃣2️⃣3️⃣4️⃣5️⃣6️⃣7️⃣8️⃣9️⃣〰©®〽️‼️⁉️⭕️⬛️⬜️⭕⭐⬆⬇⬅㊙㊗⭕©®⤴⤵〰†⟹ツღ";
    NSString *test = @"⭐1344234⭐⭐️";
    NSLog(@"unicode fuck text:%@",[self utf8ToUnicode:test]);
    NSString *result = [test removedEmojiString];
    self.result.text = result;
    
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


@end
