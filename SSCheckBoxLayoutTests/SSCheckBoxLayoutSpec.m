//
//  SSCheckBoxLayoutSpec.m
//
//  Created by azu on 12/11/16
//  Copyright 2012年 azu All rights reserved.
//

#import "Kiwi.h"
#import "SSCheckBoxLayout.h"
#import "SSCheckBoxLayoutView.h"

@interface SSCheckBoxLayoutSpec : KWSpec

@end

@implementation SSCheckBoxLayoutSpec

+ (void)buildExampleGroups {
    describe(@"CheckBoxLayout", ^{
        __block SSCheckBoxLayout *checkBoxLayout;
        beforeEach(^{
            checkBoxLayout = [[SSCheckBoxLayout alloc] init];
        });
        afterEach(^{
            checkBoxLayout = nil;
        });
        context(@"init", ^{
        });
    });
}

@end