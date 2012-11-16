//
//  ViewController.h
//  SSCheckBoxLayout
//
//  Created by azu on 11/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSCheckBoxLayoutProtocol.h"

@class SSCheckBoxLayoutView;

@interface ViewController : UIViewController <SSCheckBoxLayoutProtocol> {}

@property (weak, nonatomic) IBOutlet SSCheckBoxLayoutView *checkboxesView;

@end