//
//  Created by azu on 12/11/16.
//


#import "SSCheckBoxLayout.h"
#import "SSCheckBoxView.h"
#import "SSCheckBoxLayoutView.h"


@interface SSCheckBoxLayout ()

@property(nonatomic, strong, readwrite) NSIndexSet *checkedIndexSet;


@end

@implementation SSCheckBoxLayout {
    NSUInteger _numberForLines;
    UIEdgeInsets _marginForCheckbox;
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

    return self;
}


/* 基本系
width = size.width / 1列の個数
height = size.height / (チェックボックスの総数 / 1列の個数)
*/
- (void)makeCheckBoxFromArray:(NSArray *)array InView:(SSCheckBoxLayoutView *)view {
    // 一度データは捨てる
    [self.checkboxViews removeAllObjects];
    // それぞれmarginを追加した大きさを作る
    CGSize size = view.frame.size;
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
        [view addSubview:checkBoxView];
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


    SSCheckBoxLayoutView *view = [[SSCheckBoxLayoutView alloc] init];
    view.frame = CGRectMake(0, 0, size.width, size.height);
    [self makeCheckBoxFromArray:array InView:view];
    return view;
}

- (void)handlePutCheck:(SSCheckBoxView *)checkBoxView {
    if (self.checkBoxMode == SingleCheckBoxType){
        [self clearAllCheckWithout:checkBoxView];
    }

    NSLog(@"[self checkedIndexSet] = %@", [self checkedIndexSet]);
}

- (void)clearAllCheckWithout:(SSCheckBoxView *)checkBoxView {
    for (SSCheckBoxView *target in self.checkboxViews){
        if (![target isEqual:checkBoxView]){
            [target setChecked:NO];
        }
    }
}

- (NSIndexSet *)checkedIndexSet {
    NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSet];
    for (int i = 0 ;i < [self.checkboxViews count] ;i++){
        SSCheckBoxView *checkBoxView = self.checkboxViews[i];
        if (checkBoxView.checked){
            [indexSet addIndex:i];
        }
    }
    return indexSet;
}




@end