//
//  ViewController.m
//  SSCheckBoxLayout
//
//  Created by azu on 11/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "SSCheckBoxLayout.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    SSCheckBoxLayout *checkBoxLayout = [[SSCheckBoxLayout alloc] init];
    checkBoxLayout.delegate = self;
    checkBoxLayout.numberForLines = 3;
    checkBoxLayout.checkBoxMode = SingleCheckBoxType;
    checkBoxLayout.marginForCheckbox = UIEdgeInsetsMake(10, 0, 10, 0);
    NSArray *array = @[@"Hello", @"you", @"こんばんわ",
    @"<xss>", @"TOPIC", @"vasaaaaaaaaaaaaaadav",
    @"asdasa", @"bdsa??", @"vasdav",
    @"vasdav"];
    [checkBoxLayout makeCheckBoxFromArray:array InView:self.checkboxesView];
}

- (void)checkboxDidUpdate:(NSIndexSet *)indexSet {
    NSLog(@"indexSet = %@", indexSet);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end