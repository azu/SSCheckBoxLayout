//
//  Created by azu on 12/11/16.
//


#import <Foundation/Foundation.h>

@class SSCheckBoxLayoutView;


typedef NS_ENUM(NSUInteger, SSCheckBoxModeType){
    MultipleCheckBoxType = 1,
    SingleCheckBoxType
};

@interface SSCheckBoxLayout : NSObject {
}

// SSCheckBoxViewの配列
@property(nonatomic, strong) NSMutableArray *checkboxViews;
// ラジオボタンのように単一のチェックするモード
@property(nonatomic) SSCheckBoxModeType checkBoxMode;// デフォルトは複数選択モード
@property(nonatomic) NSUInteger numberForLines;
@property(nonatomic) UIEdgeInsets marginForCheckbox;
@property(nonatomic, strong, readonly) NSIndexSet *checkedIndexSet;


// Viewの中にチェックボックスを作って入れる
- (void)makeCheckBoxFromArray:(NSArray *)array InView:(SSCheckBoxLayoutView *)view;

// 配列を渡してUIViewを返すメソッド - 自動レイアウト
- (UIView *)viewInSize:(CGSize)size addingObjectsFromArray:(NSArray *)array;


@end