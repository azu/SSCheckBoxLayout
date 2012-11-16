# What is this?

SSCheckBoxLayout is a SSCheckBox Manager Class.

* [ardalahmet/SSCheckBoxView](https://github.com/ardalahmet/SSCheckBoxView "ardalahmet/SSCheckBoxView")

![capture](http://i.imgur.com/WHxAb.png)

# Features:

* Auto layout of SSCheckBox.
* Create SSCheckBox form Array.

``` objc
    - (void)makeCheckBoxFromArray:(NSArray *)array InView:(SSCheckBoxLayoutView *)view;
    - (SSCheckBoxLayoutView *)viewInSize:(CGSize)size addingObjectsFromArray:(NSArray *)array;
```

view of results :

    <SSCheckBoxLayoutView>
        <SSCheckBoxView>
        <SSCheckBoxView>
        <SSCheckBoxView>
        ...

* Get `NSIndexSet` of checked item

``` objc
    @property(nonatomic, strong, readonly) NSIndexSet *checkedIndexSet;
```

* Select single or multiple checkbox.

``` objc
    typedef NS_ENUM(NSUInteger, SSCheckBoxModeType){
        MultipleCheckBoxType = 1,
        SingleCheckBoxType
    };
    @property(nonatomic) SSCheckBoxModeType checkBoxMode;
```

* Visual options

``` objc
    @property(nonatomic) NSUInteger numberForLines;// the number of checkbox per line
    @property(nonatomic) UIEdgeInsets marginForCheckbox;// margin
```

# License

 Apache License