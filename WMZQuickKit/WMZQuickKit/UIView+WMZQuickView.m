//
//  UIView+WMZQuickView.m
//  WMZQuickKit
//
//  Created by wmz on 2020/11/18.
//  Copyright © 2020 wmz. All rights reserved.
//

#import "UIView+WMZQuickView.h"
#import <objc/runtime.h>
static NSString *add_blockKey = @"add_blockKey";
@implementation UIView (WMZQuickView)
@dynamic add_block;
UIView* Add_View(QuickCustomView block){
   return [UIView add_view:block];
}
+ (UIView*)add_view:(nullable QuickCustomView)block{
    UIView *view = [[UIView alloc]init];
    if (block) {block(view);}return view;
}
- (UIView * _Nonnull (^)(QuickConstraint _Nonnull, UIView * _Nonnull))add_constraints{
    return ^UIView*(QuickConstraint make,UIView *superView){
        if (superView) {[superView addSubview:self];}
        if (make) {[self mas_makeConstraints:make];}return self;
    };
}
- (UIView * _Nonnull (^)(CGRect))add_frame{
    return ^UIView*(CGRect frame){
        [self setFrame:frame ];return self;};
}
- (UIView * _Nonnull (^)(UIColor * _Nonnull))add_backgroundColor{
    return ^UIView*(UIColor* backgroundColor){
        self.layer.backgroundColor = backgroundColor.CGColor;return self;};
}
- (UIView * _Nonnull (^)(CGFloat))add_cornerRadius{
    return ^UIView*(CGFloat cornerRadius){
        self.layer.cornerRadius = cornerRadius;return self;};
}
- (UIView * _Nonnull (^)(UIView * _Nonnull))add_superView{
    return ^UIView*(UIView *superView){
        if (superView) {[superView addSubview:self];}return self;};
}
- (UIView * _Nonnull (^)(BOOL))add_userInteractionEnabled{
    return ^UIView*(BOOL userInteractionEnabled){
        [self setUserInteractionEnabled:userInteractionEnabled];return self;};
}

- (UIView * _Nonnull (^)(QuickCustomEvent _Nonnull))add_event{
    return ^UIView*(QuickCustomEvent block){
      self.add_block = block;
      self.userInteractionEnabled = YES;
      UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(buttonAction:)];
      [self addGestureRecognizer:tapGesture]; return self;};
}
- (void)buttonAction:(UIView*)sender{
    if (self.add_block) {self.add_block(sender);}
}
- (void)setAdd_block:(QuickCustomEvent)add_block{
    objc_setAssociatedObject(self, &add_blockKey, add_block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
-(QuickCustomEvent)add_block{
     return objc_getAssociatedObject(self, &add_blockKey);
}
@end

@implementation UILabel(WMZQuickView)
UILabel* Add_Label(QuickCustomLabel block){
    return [UILabel add_view:block];
}
+ (UILabel*)add_view:(nullable QuickCustomLabel)block{
    UILabel *label = [[UILabel alloc]init];
    if (block) {block(label);}
    return label;
}
- (UILabel * _Nonnull (^)(UIColor * _Nonnull))add_textColor{
    return ^UILabel*(UIColor* textColor){
        [self setTextColor:textColor];return self;};
}
- (UILabel * _Nonnull (^)(UIFont * _Nonnull))add_font{
    return ^UILabel*(UIFont* font){
        [self setFont:font];return self;};
}
- (UILabel * _Nonnull (^)(NSString * _Nonnull))add_text{
    return ^UILabel*(NSString* text){
        [self setText:text];return self;};
}
- (UILabel * _Nonnull (^)(NSTextAlignment))add_textAlignment{
    return ^UILabel*(NSTextAlignment textAlignment){
        [self setTextAlignment:textAlignment];return self;};
}
- (UILabel * _Nonnull (^)(NSAttributedString * _Nonnull))add_attributedText{
    return ^UILabel*(NSAttributedString* attributedText){
        [self setAttributedText:attributedText];return self;};
}
- (UILabel * _Nonnull (^)(NSInteger))add_numberOfLines{
    return ^UILabel*(NSInteger numberOfLines){
        [self setNumberOfLines:numberOfLines];return self;};
}
@end
@implementation UIButton (WMZQuickView)
UIButton* Add_Button(QuickCustomButton block){
    return [UIButton add_view:block];
}
+ (UIButton *)add_view:(QuickCustomButton)block{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (block) {block(button);}
    return button;
}
- (UIButton * _Nonnull (^)(UIImage * _Nonnull))add_image{
    return ^UIButton*(UIImage* image){
        [self setImage:image forState:UIControlStateNormal];return self;};
}
- (UIButton * _Nonnull (^)(NSString * _Nonnull))add_title{
    return ^UIButton*(NSString* title){
        [self setTitle:title forState:UIControlStateNormal];return self;};
}
- (UIButton * _Nonnull (^)(UIColor * _Nonnull))add_titleColor{
    return ^UIButton*(UIColor* titleColor){
        [self setTitleColor:titleColor forState:UIControlStateNormal];return self;};
}
- (UIButton * _Nonnull (^)(UIImage * _Nonnull, UIControlState))add_state_image{
    return ^UIButton*(UIImage* image,UIControlState state){
        [self setImage:image forState:state];return self;};
}
- (UIButton * _Nonnull (^)(NSString * _Nonnull, UIControlState))add_state_title{
    return ^UIButton*(NSString* title,UIControlState state){
        [self setTitle:title forState:state];return self;};
}
- (UIButton * _Nonnull (^)(UIColor * _Nonnull, UIControlState))add_state_titleColor{
    return ^UIButton*(UIColor* titleColor,UIControlState state){
           [self setTitleColor:titleColor forState:state];return self;};
}
- (UIButton * _Nonnull (^)(UIFont * _Nonnull))add_font{
    return ^UIButton*(UIFont* font){
        [self.titleLabel setFont:font];return self;};
}
- (UIButton * _Nonnull (^)(QuickCustomEvent _Nonnull))add_event{
    return ^UIButton*(QuickCustomEvent block){
        self.add_block = block;
        [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];return self;};
}
@end

@implementation UIImageView(WMZQuickView)
UIImageView* Add_ImageView(QuickCustomImageView block){
    return [UIImageView add_view:block];
}
+ (UIImageView *)add_view:(QuickCustomImageView)block{
    UIImageView *imageView = [[UIImageView alloc] init];
    if (block) {block(imageView);}
    return imageView;
}
- (UIImageView * _Nonnull (^)(CGFloat))add_cornerRadius{
    return ^UIImageView*(CGFloat cornerRadius){
        [self layoutIfNeeded];
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = self.bounds;
        maskLayer.path = maskPath.CGPath;
        self.layer.mask = maskLayer;return self;};
}
- (UIImageView * _Nonnull (^)(UIImage * _Nonnull))add_image{
    return ^UIImageView*(UIImage* image){
        [self setImage:image];return self;};
}
- (UIImageView * _Nonnull (^)(UIViewContentMode))add_contentMode{
    return ^UIImageView*(UIViewContentMode contentMode){
        [self setContentMode:contentMode];return self;};
}
@end

@implementation UISwitch(WMZQuickView)
UITextField* Add_TextField(QuickCustomTextField block){
    return [UITextField add_view:block];
}
+ (UISwitch *)add_view:(QuickCustomSwitch)block{
    UISwitch *switc = [[UISwitch alloc] init];
    if (block) {block(switc);}
    return switc;
}
- (UISwitch * _Nonnull (^)(UIImage * _Nonnull))add_onImage{
    return ^UISwitch*(UIImage* onImage){
        [self setOnImage:onImage];return self;};
}
- (UISwitch * _Nonnull (^)(UIImage * _Nonnull))add_offImage{
    return ^UISwitch*(UIImage* offImage){
        [self setOffImage:offImage];return self;};
}
- (UISwitch * _Nonnull (^)(UIColor * _Nonnull))add_onTintColor{
    return ^UISwitch*(UIColor* onTintColor){
        [self setOnTintColor:onTintColor];return self;};
}
- (UISwitch * _Nonnull (^)(UIColor * _Nonnull))add_thumbTintColor{
    return ^UISwitch*(UIColor* thumbTintColor){
        [self setThumbTintColor:thumbTintColor];return self;};
}
- (UISwitch * _Nonnull (^)(QuickCustomEvent _Nonnull))add_event{
    return ^UISwitch*(QuickCustomEvent block){
        self.add_block = block;
        [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventValueChanged];return self;};
}
@end

@implementation UITextField(WMZQuickView)
UITextView* Add_TextView(QuickCustomTextView block){
    return [UITextView add_view:block];
}
+ (UITextField *)add_view:(QuickCustomTextField)block{
    UITextField *textField = [[UITextField alloc] init];
    if (block) {block(textField);}
    return textField;
}
- (UITextField * _Nullable (^)(id<UITextFieldDelegate> _Nonnull))add_delegate{
    return ^UITextField*(id<UITextFieldDelegate> delegate){
        [self setDelegate:delegate];return self;};
}
- (UITextField * _Nonnull (^)(UIColor * _Nonnull))add_textColor{
    return ^UITextField*(UIColor* textColor){
        [self setTextColor:textColor];return self;};
}
- (UITextField * _Nonnull (^)(UIFont * _Nonnull))add_font{
    return ^UITextField*(UIFont* font){
        [self setFont:font];return self;};
}
- (UITextField * _Nonnull (^)(NSString * _Nonnull))add_text{
    return ^UITextField*(NSString* text){
        [self setText:text];return self;};
}
- (UITextField * _Nonnull (^)(NSTextAlignment))add_textAlignment{
    return ^UITextField*(NSTextAlignment textAlignment){
        [self setTextAlignment:textAlignment];return self;};
}
- (UITextField * _Nonnull (^)(NSString * _Nonnull))add_placeholder{
    return ^UITextField*(NSString* placeholder){
        [self setPlaceholder:placeholder];return self;};
}
- (UITextField * _Nonnull (^)(UIKeyboardType))add_keyboardType{
    return ^UITextField*(UIKeyboardType keyboardType){
        [self setKeyboardType:keyboardType];return self;};
}
@end

@implementation UITextView(WMZQuickView)
UISwitch* Add_Switch(QuickCustomSwitch block){
    return [UISwitch add_view:block];
}
+ (UITextView *)add_view:(QuickCustomTextView)block{
    UITextView *textView = [[UITextView alloc] init];
    if (block) {block(textView);}
    return textView;
}
- (UITextView * _Nullable (^)(id<UITextViewDelegate> _Nonnull))add_delegate{
    return ^UITextView*(id<UITextViewDelegate> delegate){
        [self setDelegate:delegate];return self;};
}
- (UITextView * _Nonnull (^)(UIColor * _Nonnull))add_textColor{
    return ^UITextView*(UIColor* textColor){
        [self setTextColor:textColor];return self;};
}
- (UITextView * _Nonnull (^)(UIFont * _Nonnull))add_font{
    return ^UITextView*(UIFont* font){
        [self setFont:font];return self;};
}
- (UITextView * _Nonnull (^)(NSString * _Nonnull))add_text{
    return ^UITextView*(NSString* text){
        [self setText:text];return self;};
}
- (UITextView * _Nonnull (^)(NSTextAlignment))add_textAlignment{
    return ^UITextView*(NSTextAlignment textAlignment){
        [self setTextAlignment:textAlignment];return self;};
}
- (UITextView * _Nonnull (^)(UIKeyboardType))add_keyboardType{
    return ^UITextView*(UIKeyboardType keyboardType){
        [self setKeyboardType:keyboardType];return self;};
}
@end

@implementation UISlider(WMZQuickView)
UISlider* Add_Slider(QuickCustomSlider block){
    return [UISlider add_view:block];
}
+ (UISlider*)add_view:(nullable QuickCustomSlider)block{
    UISlider *slider = [[UISlider alloc] init];
    if (block) {block(slider);}
    return slider;
}
- (UISlider * _Nonnull (^)(float))add_value{
    return ^UISlider*(float value){
        [self setValue:value];return self;};
}
- (UISlider * _Nonnull (^)(float))add_minimumValue{
    return ^UISlider*(float value){
        [self setMinimumValue:value];return self;};
}
- (UISlider * _Nonnull (^)(float))add_maximumValue{
    return ^UISlider*(float maximumValue){
        [self setMaximumValue:maximumValue];return self;};
}
- (UISlider * _Nonnull (^)(UIColor*))add_minimumTrackTintColor{
    return ^UISlider*(UIColor* minimumTrackTintColor){
        [self setMinimumTrackTintColor:minimumTrackTintColor];return self;};
}
- (UISlider * _Nonnull (^)(UIColor*))add_thumbTintColor{
    return ^UISlider*(UIColor* thumbTintColor){
        [self setThumbTintColor:thumbTintColor];return self;};
}
- (UISlider * _Nonnull (^)(UIColor*))add_maximumTrackTintColor{
    return ^UISlider*(UIColor* maximumTrackTintColor){
        [self setMaximumTrackTintColor:maximumTrackTintColor];return self;};
}
- (UISlider * _Nonnull (^)(QuickCustomEvent))add_event{
    return ^UISlider*(QuickCustomEvent block){
        self.add_block = block;
        [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventValueChanged];return self;};
}
@end

@implementation UIProgressView(WMZQuickView)
UIProgressView* Add_ProgressView(QuickCustomProgressView block){
    return [UIProgressView add_view:block];
}
+ (UIProgressView*)add_view:(nullable QuickCustomProgressView)block{
    UIProgressView *progress = [[UIProgressView alloc] init];
    if (block) {block(progress);}
    return progress;
}
- (UIProgressView * _Nonnull (^)(float))add_progress{
    return ^UIProgressView*(float progress){
        [self setProgress:progress];return self;};
}
- (UIProgressView * _Nonnull (^)(UIProgressViewStyle))add_progressViewStyle{
    return ^UIProgressView*(UIProgressViewStyle progressViewStyle){
        [self setProgressViewStyle:progressViewStyle];return self;};
}
- (UIProgressView * _Nonnull (^)(UIColor*))add_progressTintColor{
    return ^UIProgressView*(UIColor* progressTintColor){
        [self setProgressTintColor:progressTintColor];return self;};
}
- (UIProgressView * _Nonnull (^)(UIColor*))add_trackTintColor{
    return ^UIProgressView*(UIColor* trackTintColor){
        [self setTrackTintColor:trackTintColor];return self;};
}
@end

@implementation UITableView(WMZQuickView)
UITableView* Add_TableView(QuickCustomTableView block,UITableViewStyle style){
    return [UITableView add_view:block style:style];
}
+ (UITableView*)add_view:(nullable QuickCustomTableView)block style:(UITableViewStyle)style{
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
- (UITableView * _Nonnull (^)(id<UITableViewDelegate> _Nonnull))add_delegate{
    return ^UITableView*(id<UITableViewDelegate> delegate){
        [self setDelegate:delegate];return self;};
}
- (UITableView * _Nonnull (^)(id<UITableViewDataSource> _Nonnull))add_dataSource{
    return ^UITableView*(id<UITableViewDataSource> delegate){
        [self setDataSource:delegate];return self;};
}
- (UITableView * _Nonnull (^)(UIScrollViewKeyboardDismissMode))add_keyboardDismissMode{
    return ^UITableView*(UIScrollViewKeyboardDismissMode keyboardDismissMode){
        [self setKeyboardDismissMode:keyboardDismissMode];return self;};
}
- (UITableView * _Nonnull (^)(UITableViewCellSeparatorStyle))add_separatorStyle{
    return ^UITableView*(UITableViewCellSeparatorStyle separatorStyle){
        [self setSeparatorStyle:separatorStyle];return self;};
}
- (UITableView * _Nonnull (^)(NSArray<NSString*> * _Nonnull))add_registerCellClass{
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
- (UITableView * _Nonnull (^)(NSArray<NSString *> * _Nonnull))add_registerHeaderFooterClass{
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
- (UITableView * _Nonnull (^)(BOOL))add_showsVerticalScrollIndicator{
    return ^UITableView*(BOOL showsVerticalScrollIndicator){
        [self setShowsVerticalScrollIndicator:showsVerticalScrollIndicator];return self;};
}
- (UITableView * _Nonnull (^)(BOOL))add_showsHorizontalScrollIndicator{
    return ^UITableView*(BOOL showsHorizontalScrollIndicator){
        [self setShowsHorizontalScrollIndicator:showsHorizontalScrollIndicator];return self;};
}
@end


@implementation UICollectionView(WMZQuickView)
UICollectionView* Add_CollectionView(QuickCustomCollectionView block,UICollectionViewFlowLayout* layout){
    return [UICollectionView add_view:block layout:layout];
}
+ (UICollectionView*)add_view:(nullable QuickCustomCollectionView)block layout:(UICollectionViewFlowLayout*)layout{
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    if (@available(iOS 11.0, *)) {
        collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    if (block) {
        block(collectionView);
    }
    return collectionView;
}
- (UICollectionView * _Nonnull (^)(id<UICollectionViewDelegate> _Nonnull))add_delegate{
    return ^UICollectionView*(id<UICollectionViewDelegate> delegate){
        [self setDelegate:delegate];return self;};
}
- (UICollectionView * _Nonnull (^)(id<UICollectionViewDataSource> _Nonnull))add_dataSource{
    return ^UICollectionView*(id<UICollectionViewDataSource> delegate){
        [self setDataSource:delegate];return self;};
}
- (UICollectionView * _Nonnull (^)(UIScrollViewKeyboardDismissMode))add_keyboardDismissMode{
    return ^UICollectionView*(UIScrollViewKeyboardDismissMode keyboardDismissMode){
        [self setKeyboardDismissMode:keyboardDismissMode];return self;};
}
- (UICollectionView * _Nonnull (^)(NSArray<NSString*> * _Nonnull))add_registerCellClass{
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
- (UICollectionView * _Nonnull (^)(NSArray<NSString *> * _Nonnull))add_registerHeaderClass{
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
- (UICollectionView * _Nonnull (^)(NSArray<NSString *> * _Nonnull))add_registerFooterClass{
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
- (UICollectionView * _Nonnull (^)(BOOL))add_showsVerticalScrollIndicator{
    return ^UICollectionView*(BOOL showsVerticalScrollIndicator){
        [self setShowsVerticalScrollIndicator:showsVerticalScrollIndicator];return self;};
}
- (UICollectionView * _Nonnull (^)(BOOL))add_showsHorizontalScrollIndicator{
    return ^UICollectionView*(BOOL showsHorizontalScrollIndicator){
        [self setShowsHorizontalScrollIndicator:showsHorizontalScrollIndicator];return self;};
}
@end

@implementation UICollectionViewFlowLayout(WMZQuickView)
+ (UICollectionViewFlowLayout*)add_flowLayout:(CGFloat)minimumLineSpacing
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
UICollectionViewFlowLayout* Add_FlowLayout(CGFloat minimumLineSpacing,CGFloat minimumInteritemSpacing,UIEdgeInsets sectionInset,QuickCollectionViewFlowLayout block){
    return [UICollectionViewFlowLayout add_flowLayout:minimumLineSpacing minimumInteritemSpacing:minimumInteritemSpacing sectionInset:sectionInset block:block];
}
@end

@implementation UIScrollView(WMZQuickView)
UIScrollView* Add_ScrollView(QuickCustomScrollView block){
    return [UIScrollView add_view:block];
}
+ (UIScrollView *)add_view:(QuickCustomScrollView)block{
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    if (block) {
        block(scrollView);
    }
    return scrollView;
}
- (UIScrollView * _Nonnull (^)(BOOL))add_showsVerticalScrollIndicator{
    return ^UIScrollView*(BOOL showsVerticalScrollIndicator){
        [self setShowsVerticalScrollIndicator:showsVerticalScrollIndicator];return self;};
}
- (UIScrollView * _Nonnull (^)(BOOL))add_showsHorizontalScrollIndicator{
    return ^UIScrollView*(BOOL showsHorizontalScrollIndicator){
        [self setShowsHorizontalScrollIndicator:showsHorizontalScrollIndicator];return self;};
}
- (UIScrollView * _Nonnull (^)(id<UIScrollViewDelegate> _Nonnull))add_delegate{
    return ^UIScrollView*(id<UIScrollViewDelegate> delegate){
        [self setDelegate:delegate];return self;};
}
- (UIScrollView * _Nonnull (^)(CGSize))add_contentSize{
    return ^UIScrollView*(CGSize contentSize){
        [self setContentSize:contentSize];return self;};
}
- (UIScrollView * _Nonnull (^)(CGPoint))add_contentOffset{
    return ^UIScrollView*(CGPoint contentOffset){
        [self setContentOffset:contentOffset];return self;};
}
@end
