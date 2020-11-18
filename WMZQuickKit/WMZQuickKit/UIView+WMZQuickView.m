//
//  UIView+WMZQuickView.m
//  WMZQuickKit
//
//  Created by wmz on 2020/11/18.
//  Copyright © 2020 wmz. All rights reserved.
//

#import "UIView+WMZQuickView.h"
#import <objc/runtime.h>
static NSString *mz_blockKey = @"mz_blockKey";
@implementation UIView (WMZQuickView)
@dynamic mz_block;
+ (UIView*)mz_view:(nullable QuickCustomView)block{
    UIView *view = [[UIView alloc]init];
    if (block) {block(view);}return view;
}
- (UIView * _Nonnull (^)(QuickConstraint _Nonnull, UIView * _Nonnull))mz_constraints{
    return ^UIView*(QuickConstraint make,UIView *superView){
        if (superView) {[superView addSubview:self];}
        if (make) {[self mas_makeConstraints:make];}return self;
    };
}
- (UIView * _Nonnull (^)(CGRect))mz_frame{
    return ^UIView*(CGRect frame){
        [self setFrame:frame ];return self;};
}
- (UIView * _Nonnull (^)(UIColor * _Nonnull))mz_backgroundColor{
    return ^UIView*(UIColor* backgroundColor){
        self.layer.backgroundColor = backgroundColor.CGColor;return self;};
}
- (UIView * _Nonnull (^)(CGFloat))mz_cornerRadius{
    return ^UIView*(CGFloat cornerRadius){
        self.layer.cornerRadius = cornerRadius;return self;};
}
- (UIView * _Nonnull (^)(UIView * _Nonnull))mz_superView{
    return ^UIView*(UIView *superView){
        if (superView) {[superView addSubview:self];}return self;};
}
- (UIView * _Nonnull (^)(BOOL))mz_userInteractionEnabled{
    return ^UIView*(BOOL userInteractionEnabled){
        [self setUserInteractionEnabled:userInteractionEnabled];return self;};
}

- (UIView * _Nonnull (^)(QuickCustomEvent _Nonnull))mz_event{
    return ^UIView*(QuickCustomEvent block){
      self.mz_block = block;
      self.userInteractionEnabled = YES;
      UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(buttonAction:)];
      [self addGestureRecognizer:tapGesture]; return self;};
}
- (void)buttonAction:(UIView*)sender{
    if (self.mz_block) {self.mz_block(sender);}
}
- (void)setMz_block:(QuickCustomEvent)mz_block{
    objc_setAssociatedObject(self, &mz_blockKey, mz_block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
-(QuickCustomEvent)mz_block{
     return objc_getAssociatedObject(self, &mz_blockKey);
}
@end

@implementation UILabel(WMZQuickView)
+ (UILabel*)mz_view:(nullable QuickCustomLabel)block{
    UILabel *label = [[UILabel alloc]init];
    if (block) {block(label);}
    return label;
}
- (UILabel * _Nonnull (^)(UIColor * _Nonnull))mz_textColor{
    return ^UILabel*(UIColor* textColor){
        [self setTextColor:textColor];return self;};
}
- (UILabel * _Nonnull (^)(UIFont * _Nonnull))mz_font{
    return ^UILabel*(UIFont* font){
        [self setFont:font];return self;};
}
- (UILabel * _Nonnull (^)(NSString * _Nonnull))mz_text{
    return ^UILabel*(NSString* text){
        [self setText:text];return self;};
}
- (UILabel * _Nonnull (^)(NSTextAlignment))mz_textAlignment{
    return ^UILabel*(NSTextAlignment textAlignment){
        [self setTextAlignment:textAlignment];return self;};
}
- (UILabel * _Nonnull (^)(NSAttributedString * _Nonnull))mz_attributedText{
    return ^UILabel*(NSAttributedString* attributedText){
        [self setAttributedText:attributedText];return self;};
}
- (UILabel * _Nonnull (^)(NSInteger))mz_numberOfLines{
    return ^UILabel*(NSInteger numberOfLines){
        [self setNumberOfLines:numberOfLines];return self;};
}
@end
@implementation UIButton (WMZQuickView)
+ (UIButton *)mz_view:(QuickCustomButton)block{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (block) {block(button);}
    return button;
}
- (UIButton * _Nonnull (^)(UIImage * _Nonnull))mz_image{
    return ^UIButton*(UIImage* image){
        [self setImage:image forState:UIControlStateNormal];return self;};
}
- (UIButton * _Nonnull (^)(NSString * _Nonnull))mz_title{
    return ^UIButton*(NSString* title){
        [self setTitle:title forState:UIControlStateNormal];return self;};
}
- (UIButton * _Nonnull (^)(UIColor * _Nonnull))mz_titleColor{
    return ^UIButton*(UIColor* titleColor){
        [self setTitleColor:titleColor forState:UIControlStateNormal];return self;};
}
- (UIButton * _Nonnull (^)(UIImage * _Nonnull, UIControlState))mz_state_image{
    return ^UIButton*(UIImage* image,UIControlState state){
        [self setImage:image forState:state];return self;};
}
- (UIButton * _Nonnull (^)(NSString * _Nonnull, UIControlState))mz_state_title{
    return ^UIButton*(NSString* title,UIControlState state){
        [self setTitle:title forState:state];return self;};
}
- (UIButton * _Nonnull (^)(UIColor * _Nonnull, UIControlState))mz_state_titleColor{
    return ^UIButton*(UIColor* titleColor,UIControlState state){
           [self setTitleColor:titleColor forState:state];return self;};
}
- (UIButton * _Nonnull (^)(UIFont * _Nonnull))mz_font{
    return ^UIButton*(UIFont* font){
        [self.titleLabel setFont:font];return self;};
}
- (UIButton * _Nonnull (^)(QuickCustomEvent _Nonnull))mz_event{
    return ^UIButton*(QuickCustomEvent block){
        self.mz_block = block;
        [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];return self;};
}
@end

@implementation UIImageView(WMZQuickView)
+ (UIImageView *)mz_view:(QuickCustomImageView)block{
    UIImageView *imageView = [[UIImageView alloc] init];
    if (block) {block(imageView);}
    return imageView;
}
- (UIImageView * _Nonnull (^)(CGFloat))mz_cornerRadius{
    return ^UIImageView*(CGFloat cornerRadius){
        [self layoutIfNeeded];
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = self.bounds;
        maskLayer.path = maskPath.CGPath;
        self.layer.mask = maskLayer;return self;};
}
- (UIImageView * _Nonnull (^)(UIImage * _Nonnull))mz_image{
    return ^UIImageView*(UIImage* image){
        [self setImage:image];return self;};
}
- (UIImageView * _Nonnull (^)(UIViewContentMode))mz_contentMode{
    return ^UIImageView*(UIViewContentMode contentMode){
        [self setContentMode:contentMode];return self;};
}
@end

@implementation UISwitch(WMZQuickView)
+ (UISwitch *)mz_view:(QuickCustomSwitch)block{
    UISwitch *switc = [[UISwitch alloc] init];
    if (block) {block(switc);}
    return switc;
}
- (UISwitch * _Nonnull (^)(UIImage * _Nonnull))mz_onImage{
    return ^UISwitch*(UIImage* onImage){
        [self setOnImage:onImage];return self;};
}
- (UISwitch * _Nonnull (^)(UIImage * _Nonnull))mz_offImage{
    return ^UISwitch*(UIImage* offImage){
        [self setOffImage:offImage];return self;};
}
- (UISwitch * _Nonnull (^)(UIColor * _Nonnull))mz_onTintColor{
    return ^UISwitch*(UIColor* onTintColor){
        [self setOnTintColor:onTintColor];return self;};
}
- (UISwitch * _Nonnull (^)(UIColor * _Nonnull))mz_thumbTintColor{
    return ^UISwitch*(UIColor* thumbTintColor){
        [self setThumbTintColor:thumbTintColor];return self;};
}
- (UISwitch * _Nonnull (^)(QuickCustomEvent _Nonnull))mz_event{
    return ^UISwitch*(QuickCustomEvent block){
        self.mz_block = block;
        [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventValueChanged];return self;};
}
@end

@implementation UITextField(WMZQuickView)
+ (UITextField *)mz_view:(QuickCustomTextField)block{
    UITextField *textField = [[UITextField alloc] init];
    if (block) {block(textField);}
    return textField;
}
- (UITextField * _Nullable (^)(id<UITextFieldDelegate> _Nonnull))mz_delegate{
    return ^UITextField*(id<UITextFieldDelegate> delegate){
        [self setDelegate:delegate];return self;};
}
- (UITextField * _Nonnull (^)(UIColor * _Nonnull))mz_textColor{
    return ^UITextField*(UIColor* textColor){
        [self setTextColor:textColor];return self;};
}
- (UITextField * _Nonnull (^)(UIFont * _Nonnull))mz_font{
    return ^UITextField*(UIFont* font){
        [self setFont:font];return self;};
}
- (UITextField * _Nonnull (^)(NSString * _Nonnull))mz_text{
    return ^UITextField*(NSString* text){
        [self setText:text];return self;};
}
- (UITextField * _Nonnull (^)(NSTextAlignment))mz_textAlignment{
    return ^UITextField*(NSTextAlignment textAlignment){
        [self setTextAlignment:textAlignment];return self;};
}
- (UITextField * _Nonnull (^)(NSString * _Nonnull))mz_placeholder{
    return ^UITextField*(NSString* placeholder){
        [self setPlaceholder:placeholder];return self;};
}
- (UITextField * _Nonnull (^)(UIKeyboardType))mz_keyboardType{
    return ^UITextField*(UIKeyboardType keyboardType){
        [self setKeyboardType:keyboardType];return self;};
}
@end

@implementation UITextView(WMZQuickView)
+ (UITextView *)mz_view:(QuickCustomTextView)block{
    UITextView *textView = [[UITextView alloc] init];
    if (block) {block(textView);}
    return textView;
}
- (UITextView * _Nullable (^)(id<UITextViewDelegate> _Nonnull))mz_delegate{
    return ^UITextView*(id<UITextViewDelegate> delegate){
        [self setDelegate:delegate];return self;};
}
- (UITextView * _Nonnull (^)(UIColor * _Nonnull))mz_textColor{
    return ^UITextView*(UIColor* textColor){
        [self setTextColor:textColor];return self;};
}
- (UITextView * _Nonnull (^)(UIFont * _Nonnull))mz_font{
    return ^UITextView*(UIFont* font){
        [self setFont:font];return self;};
}
- (UITextView * _Nonnull (^)(NSString * _Nonnull))mz_text{
    return ^UITextView*(NSString* text){
        [self setText:text];return self;};
}
- (UITextView * _Nonnull (^)(NSTextAlignment))mz_textAlignment{
    return ^UITextView*(NSTextAlignment textAlignment){
        [self setTextAlignment:textAlignment];return self;};
}
- (UITextView * _Nonnull (^)(UIKeyboardType))mz_keyboardType{
    return ^UITextView*(UIKeyboardType keyboardType){
        [self setKeyboardType:keyboardType];return self;};
}
@end

@implementation UISlider(WMZQuickView)
+ (UISlider*)mz_view:(nullable QuickCustomSlider)block{
    UISlider *slider = [[UISlider alloc] init];
    if (block) {block(slider);}
    return slider;
}
- (UISlider * _Nonnull (^)(float))mz_value{
    return ^UISlider*(float value){
        [self setValue:value];return self;};
}
- (UISlider * _Nonnull (^)(float))mz_minimumValue{
    return ^UISlider*(float value){
        [self setMinimumValue:value];return self;};
}
- (UISlider * _Nonnull (^)(float))mz_maximumValue{
    return ^UISlider*(float maximumValue){
        [self setMaximumValue:maximumValue];return self;};
}
- (UISlider * _Nonnull (^)(UIColor*))mz_minimumTrackTintColor{
    return ^UISlider*(UIColor* minimumTrackTintColor){
        [self setMinimumTrackTintColor:minimumTrackTintColor];return self;};
}
- (UISlider * _Nonnull (^)(UIColor*))mz_thumbTintColor{
    return ^UISlider*(UIColor* thumbTintColor){
        [self setThumbTintColor:thumbTintColor];return self;};
}
- (UISlider * _Nonnull (^)(UIColor*))mz_maximumTrackTintColor{
    return ^UISlider*(UIColor* maximumTrackTintColor){
        [self setMaximumTrackTintColor:maximumTrackTintColor];return self;};
}
- (UISlider * _Nonnull (^)(QuickCustomEvent))mz_event{
    return ^UISlider*(QuickCustomEvent block){
        self.mz_block = block;
        [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventValueChanged];return self;};
}
@end

@implementation UIProgressView(WMZQuickView)
+ (UIProgressView*)mz_view:(nullable QuickCustomProgressView)block{
    UIProgressView *progress = [[UIProgressView alloc] init];
    if (block) {block(progress);}
    return progress;
}
- (UIProgressView * _Nonnull (^)(float))mz_progress{
    return ^UIProgressView*(float progress){
        [self setProgress:progress];return self;};
}
- (UIProgressView * _Nonnull (^)(UIProgressViewStyle))mz_progressViewStyle{
    return ^UIProgressView*(UIProgressViewStyle progressViewStyle){
        [self setProgressViewStyle:progressViewStyle];return self;};
}
- (UIProgressView * _Nonnull (^)(UIColor*))mz_progressTintColor{
    return ^UIProgressView*(UIColor* progressTintColor){
        [self setProgressTintColor:progressTintColor];return self;};
}
- (UIProgressView * _Nonnull (^)(UIColor*))mz_trackTintColor{
    return ^UIProgressView*(UIColor* trackTintColor){
        [self setTrackTintColor:trackTintColor];return self;};
}
@end

@implementation UITableView(WMZQuickView)
+ (UITableView*)mz_view:(nullable QuickCustomTableView)block style:(UITableViewStyle)style{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:style];
    tableView.estimatedRowHeight = 100;
    if (@available(iOS 11.0, *)) {
        tableView.estimatedSectionHeaderHeight = 0.01;
        tableView.estimatedSectionFooterHeight = 0.01;
        tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    if (block) {
        block(tableView);
    }
    return tableView;
}
- (UITableView * _Nonnull (^)(id<UITableViewDelegate> _Nonnull))mz_delegate{
    return ^UITableView*(id<UITableViewDelegate> delegate){
        [self setDelegate:delegate];return self;};
}
- (UITableView * _Nonnull (^)(id<UITableViewDataSource> _Nonnull))mz_dataSource{
    return ^UITableView*(id<UITableViewDataSource> delegate){
        [self setDataSource:delegate];return self;};
}
- (UITableView * _Nonnull (^)(UIScrollViewKeyboardDismissMode))mz_keyboardDismissMode{
    return ^UITableView*(UIScrollViewKeyboardDismissMode keyboardDismissMode){
        [self setKeyboardDismissMode:keyboardDismissMode];return self;};
}
- (UITableView * _Nonnull (^)(UITableViewCellSeparatorStyle))mz_separatorStyle{
    return ^UITableView*(UITableViewCellSeparatorStyle separatorStyle){
        [self setSeparatorStyle:separatorStyle];return self;};
}
- (UITableView * _Nonnull (^)(NSArray<NSString*> * _Nonnull))mz_registerCellClass{
    return ^UITableView*(NSArray<NSString*>* CellClassArr){
        if (CellClassArr&&
            [CellClassArr isKindOfClass:[NSArray class]]) {
           for (NSString *className in CellClassArr) {
               if ([className isKindOfClass:[NSString class]]) {
                    [self registerClass:NSClassFromString(className) forCellReuseIdentifier:className];
               }
           }
        }
        return self;};
}
- (UITableView * _Nonnull (^)(NSArray<NSString *> * _Nonnull))mz_registerHeaderFooterClass{
    return ^UITableView*(NSArray<NSString*>* CellClassArr){
        if (CellClassArr&&
            [CellClassArr isKindOfClass:[NSArray class]]) {
           for (NSString *className in CellClassArr) {
               if ([className isKindOfClass:[NSString class]]) {
                    [self registerClass:NSClassFromString(className) forHeaderFooterViewReuseIdentifier:className];
               }
           }
        }
        return self;};
}
- (UITableView * _Nonnull (^)(BOOL))mz_showsVerticalScrollIndicator{
    return ^UITableView*(BOOL showsVerticalScrollIndicator){
        [self setShowsVerticalScrollIndicator:showsVerticalScrollIndicator];return self;};
}
- (UITableView * _Nonnull (^)(BOOL))mz_showsHorizontalScrollIndicator{
    return ^UITableView*(BOOL showsHorizontalScrollIndicator){
        [self setShowsHorizontalScrollIndicator:showsHorizontalScrollIndicator];return self;};
}
@end


@implementation UICollectionView(WMZQuickView)
+ (UICollectionView*)mz_view:(nullable QuickCustomCollectionView)block layout:(UICollectionViewFlowLayout*)layout{
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    if (@available(iOS 11.0, *)) {
        collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    if (block) {
        block(collectionView);
    }
    return collectionView;
}
- (UICollectionView * _Nonnull (^)(id<UICollectionViewDelegate> _Nonnull))mz_delegate{
    return ^UICollectionView*(id<UICollectionViewDelegate> delegate){
        [self setDelegate:delegate];return self;};
}
- (UICollectionView * _Nonnull (^)(id<UICollectionViewDataSource> _Nonnull))mz_dataSource{
    return ^UICollectionView*(id<UICollectionViewDataSource> delegate){
        [self setDataSource:delegate];return self;};
}
- (UICollectionView * _Nonnull (^)(UIScrollViewKeyboardDismissMode))mz_keyboardDismissMode{
    return ^UICollectionView*(UIScrollViewKeyboardDismissMode keyboardDismissMode){
        [self setKeyboardDismissMode:keyboardDismissMode];return self;};
}
- (UICollectionView * _Nonnull (^)(NSArray<NSString*> * _Nonnull))mz_registerCellClass{
    return ^UICollectionView*(NSArray<NSString*>* CellClassArr){
        if (CellClassArr&&
            [CellClassArr isKindOfClass:[NSArray class]]) {
           for (NSString *className in CellClassArr) {
               if ([className isKindOfClass:[NSString class]]) {
                    [self registerClass:NSClassFromString(className) forCellWithReuseIdentifier:className];
               }
           }
        }
        return self;};
}
- (UICollectionView * _Nonnull (^)(NSArray<NSString *> * _Nonnull))mz_registerHeaderClass{
    return ^UICollectionView*(NSArray<NSString*>* CellClassArr){
        if (CellClassArr&&
            [CellClassArr isKindOfClass:[NSArray class]]) {
           for (NSString *className in CellClassArr) {
               if ([className isKindOfClass:[NSString class]]) {
                    [self registerClass:NSClassFromString(className) forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:className];
               }
           }
        }
        return self;};
}
- (UICollectionView * _Nonnull (^)(NSArray<NSString *> * _Nonnull))mz_registerFooterClass{
    return ^UICollectionView*(NSArray<NSString*>* CellClassArr){
        if (CellClassArr&&
            [CellClassArr isKindOfClass:[NSArray class]]) {
           for (NSString *className in CellClassArr) {
               if ([className isKindOfClass:[NSString class]]) {
                    [self registerClass:NSClassFromString(className) forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:className];
               }
           }
        }
        return self;};
}
- (UICollectionView * _Nonnull (^)(BOOL))mz_showsVerticalScrollIndicator{
    return ^UICollectionView*(BOOL showsVerticalScrollIndicator){
        [self setShowsVerticalScrollIndicator:showsVerticalScrollIndicator];return self;};
}
- (UICollectionView * _Nonnull (^)(BOOL))mz_showsHorizontalScrollIndicator{
    return ^UICollectionView*(BOOL showsHorizontalScrollIndicator){
        [self setShowsHorizontalScrollIndicator:showsHorizontalScrollIndicator];return self;};
}
@end

@implementation UICollectionViewFlowLayout(WMZQuickView)
+ (UICollectionViewFlowLayout*)mz_flowLayout:(CGFloat)minimumLineSpacing
                     minimumInteritemSpacing:(CGFloat)minimumInteritemSpacing
                                sectionInset:(UIEdgeInsets)sectionInset
                                       block:(nullable QuickCollectionViewFlowLayout)block{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumLineSpacing = minimumLineSpacing;
    flowLayout.minimumInteritemSpacing = minimumInteritemSpacing;
    flowLayout.sectionInset =sectionInset;
    if (block) {
        block(flowLayout);
    }
    return flowLayout;
}
@end

@implementation UIScrollView(WMZQuickView)
+ (UIScrollView *)mz_view:(QuickCustomScrollView)block{
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    if (block) {
        block(scrollView);
    }
    return scrollView;
}
- (UIScrollView * _Nonnull (^)(BOOL))mz_showsVerticalScrollIndicator{
    return ^UIScrollView*(BOOL showsVerticalScrollIndicator){
        [self setShowsVerticalScrollIndicator:showsVerticalScrollIndicator];return self;};
}
- (UIScrollView * _Nonnull (^)(BOOL))mz_showsHorizontalScrollIndicator{
    return ^UIScrollView*(BOOL showsHorizontalScrollIndicator){
        [self setShowsHorizontalScrollIndicator:showsHorizontalScrollIndicator];return self;};
}
- (UIScrollView * _Nonnull (^)(id<UIScrollViewDelegate> _Nonnull))mz_delegate{
    return ^UIScrollView*(id<UIScrollViewDelegate> delegate){
        [self setDelegate:delegate];return self;};
}
- (UIScrollView * _Nonnull (^)(CGSize))mz_contentSize{
    return ^UIScrollView*(CGSize contentSize){
        [self setContentSize:contentSize];return self;};
}
- (UIScrollView * _Nonnull (^)(CGPoint))mz_contentOffset{
    return ^UIScrollView*(CGPoint contentOffset){
        [self setContentOffset:contentOffset];return self;};
}
@end
