//
//  WGXibViewController.m
//  CustomLearn
//
//  Created by wanggang on 2019/2/13.
//  Copyright © 2019 WG. All rights reserved.
//

#import "WGXibViewController.h"

@interface WGXibViewController ()

@property (nonatomic, assign) NSInteger age;

@end

@implementation WGXibViewController

-(instancetype)initWithAge:(NSInteger)age{
    
    self = [super init];
    if (self) {
        self.age = age;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"WGControllerPush支持xib";
    NSLog(@"age:%ld---->name:%@", self.age, self.name);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
