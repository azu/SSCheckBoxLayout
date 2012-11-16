//
//  Created by azu on 12/11/16.
//


#import "SSCheckBoxLayoutView.h"
#import "SSCheckBoxView.h"


@implementation SSCheckBoxLayoutView {

}


@synthesize checkboxViews = _checkboxViews;
@synthesize numberForLines = _numberForLines;
@synthesize marginForCheckbox = _marginForCheckbox;
@synthesize checkBoxMode = _checkBoxMode;


- (id)init {
    self = [super init];
    if (!self){
        return nil;
    }

    _checkboxViews = [NSMutableArray array];
    _numberForLines = 2;// 1行に配置するチェックボックス数
    _marginForCheckbox = UIEdgeInsetsMake(5, 0, 5, 0);// マージン
    _checkBoxMode = MultipleCheckBoxType;// 複数選択
    self.userInteractionEnabled = YES;

    return self;
}


/* 基本系
width = size.width / 1列の個数
height = size.height / (チェックボックスの総数 / 1列の個数)
*/
- (void)makeCheckBoxFromArray:(NSArray *)array {
    // 一度データは捨てる
    [self.checkboxViews removeAllObjects];

    // それぞれmarginを追加した大きさを作る
    CGSize size = self.frame.size;
    CGFloat checkboxWidth = (size.width / self.numberForLines);
    CGFloat checkboxHeight = (size.width / ([array count] * self.numberForLines)) + (self.marginForCheckbox.top + self.marginForCheckbox.bottom);

    CGPoint point = CGPointMake(0, 0);
    NSInteger currentXItem = 0;
    NSInteger currentYItem = 0;
    for (int i = 0 ;i < [array count] ;i++){

        // origin {x,y}の移動用
        point.x = checkboxWidth * currentXItem;
        point.y = checkboxHeight * currentYItem;
        // チェックボックスのサイズ
        CGRect rect = CGRectMake(point.x,
            point.y,
            checkboxWidth - (self.marginForCheckbox.left + self.marginForCheckbox.right),
            checkboxHeight);
        SSCheckBoxView *checkBoxView;
        checkBoxView = [[SSCheckBoxView alloc] initWithFrame:rect
            style:kSSCheckBoxViewStyleMono
            checked:NO];
        [checkBoxView setStateChangedTarget:self selector:@selector(handlePutCheck:)];
        [checkBoxView setText:array[i]];
        [self addSubview:checkBoxView];
        [self.checkboxViews addObject:checkBoxView];

        // 段組
        if (currentXItem < (self.numberForLines - 1)){
            currentXItem++;
        } else {
            currentXItem = 0;
            currentYItem++;
        }
    }
}

- (UIView *)viewInSize:(CGSize)size addingObjectsFromArray:(NSArray *)array {

    NSAssert(size.width > 0, @"width > 0");
    NSAssert(size.height > 0, @"height > 0");
    self.frame = CGRectMake(0, 0, size.width, size.height);
    [self makeCheckBoxFromArray:array];
    return self;
}

- (void)handlePutCheck:(SSCheckBoxView *)checkBoxView {
    if (self.checkBoxMode == SingleCheckBoxType){
        [self clearAllCheckWithout:checkBoxView];
    }
}

- (void)clearAllCheckWithout:(SSCheckBoxView *)checkBoxView {
    for (SSCheckBoxView *target in self.checkboxViews){
        if (![target isEqual:checkBoxView]){
            [target setChecked:NO];
        }
    }
}
@end