//
//  UIView+WMZQuickView.h
//  WMZQuickKit
//
//  Created by wmz on 2020/11/18.
//  Copyright © 2020 wmz. All rights reserved.
//

#import <UIKit/UIKit.h>
#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif
typedef void (^QuickCustomView)           (UIView * _Nonnull view);
typedef void (^QuickCustomLabel)          (UILabel * _Nonnull label);
typedef void (^QuickCustomButton)         (UIButton * _Nonnull button);
typedef void (^QuickCustomImageView)      (UIImageView * _Nonnull imageView);
typedef void (^QuickCustomTextField)      (UITextField * _Nonnull textField);
typedef void (^QuickCustomTextView)       (UITextView * _Nonnull textView);
typedef void (^QuickCustomTableView)      (UITableView * _Nonnull tableView);
typedef void (^QuickCustomCollectionView) (UICollectionView * _Nonnull collectionView);
typedef void (^QuickCustomScrollView)     (UIScrollView * _Nonnull scrollView);
typedef void (^QuickCustomSwitch)         (UISwitch * _Nonnull switc);
typedef void (^QuickCustomSlider)         (UISlider * _Nonnull slider);
typedef void (^QuickCustomProgressView)   (UIProgressView * _Nonnull progressView);
typedef void (^QuickCustomEvent)          (UIView * _Nonnull sender);
typedef void (^QuickConstraint)           (MASConstraintMaker *_Nullable make);
typedef void (^QuickCollectionViewFlowLayout)(UICollectionViewFlowLayout * _Nonnull collectionView);

NS_ASSUME_NONNULL_BEGIN

@interface UIView (WMZQuickView)
/*!
* @brief init
*/
+ (UIView*)mz_view:(nullable QuickCustomView)block;
/*!
* @brief superView
*/
@property (nonatomic,strong,readonly) UIView *(^mz_superView)(UIView* superView);
/*!
* @brief frame
*/
@property (nonatomic,assign,readonly) UIView *(^mz_frame)(CGRect frame);
/*!
* @brief Masonry autoLayout
*/
@property (nonatomic,copy,  readonly) UIView *(^mz_constraints)(QuickConstraint formConstraint,UIView *superView);
@property (nonatomic,strong,readonly) UIView *(^mz_backgroundColor)(UIColor* backgroundColor);
@property (nonatomic,assign,readonly) UIView *(^mz_cornerRadius)(CGFloat cornerRadius);
/*!
* @brief init
* @param block self
*/
@property (nonatomic,copy,  readonly) UIView *(^mz_event)(QuickCustomEvent block);
@property (nonatomic,assign,readonly) UIView *(^mz_userInteractionEnabled)(BOOL userInteractionEnabled);
@property (nonatomic, copy) QuickCustomEvent mz_block;
@end

@interface UILabel (WMZQuickView)
/*!
* @brief init
* @param block self
*/
+ (UILabel*)mz_view:(nullable QuickCustomLabel)block;
@property (nonatomic,strong,readonly) UILabel *(^mz_textColor)(UIColor* textColor);
@property (nonatomic,strong,readonly) UILabel *(^mz_font)(UIFont* font);
@property (nonatomic,strong,readonly) UILabel *(^mz_text)(NSString* text);
@property (nonatomic,strong,readonly) UILabel *(^mz_attributedText)(NSAttributedString* attributedText);
@property (nonatomic,assign,readonly) UILabel *(^mz_textAlignment)(NSTextAlignment textAlignment);
@property (nonatomic,assign,readonly) UILabel *(^mz_numberOfLines)(NSInteger numberOfLines);
@end

@interface UIButton (WMZQuickView)
/*!
* @brief init
* @param block self
*/
+ (UIButton*)mz_view:(nullable QuickCustomButton)block;
@property (nonatomic,strong,readonly) UIButton *(^mz_state_titleColor)(UIColor* textColor,UIControlState state);
@property (nonatomic,strong,readonly) UIButton *(^mz_state_title)(NSString* title,UIControlState state);
@property (nonatomic,strong,readonly) UIButton *(^mz_state_image)(UIImage* image,UIControlState state);
@property (nonatomic,strong,readonly) UIButton *(^mz_titleColor)(UIColor* textColor);
@property (nonatomic,strong,readonly) UIButton *(^mz_title)(NSString* title);
@property (nonatomic,strong,readonly) UIButton *(^mz_image)(UIImage* image);
@property (nonatomic,strong,readonly) UIButton *(^mz_font)(UIFont* font);
@property (nonatomic,copy,  readonly) UIButton *(^mz_event)(QuickCustomEvent block);
@end

@interface UIImageView (WMZQuickView)
/*!
* @brief init
* @param block self
*/
+ (UIImageView*)mz_view:(nullable QuickCustomImageView)block;
@property (nonatomic,strong,readonly) UIImageView *(^mz_image)(UIImage* image);
@property (nonatomic,assign,readonly) UIImageView *(^mz_contentMode)(UIViewContentMode contentMode);
@property (nonatomic,assign,readonly) UIImageView *(^mz_cornerRadius)(CGFloat cornerRadius);
@end


@interface UITextField (WMZQuickView)
/*!
* @brief init
* @param block self
*/
+ (UITextField*)mz_view:(nullable QuickCustomTextField)block;
@property (nonatomic,weak,  readonly) UITextField *(^mz_delegate)(id<UITextFieldDelegate> delegate);
@property (nonatomic,strong,readonly) UITextField *(^mz_textColor)(UIColor* textColor);
@property (nonatomic,strong,readonly) UITextField *(^mz_font)(UIFont* font);
@property (nonatomic,strong,readonly) UITextField *(^mz_text)(NSString* text);
@property (nonatomic,assign,readonly) UITextField *(^mz_textAlignment)(NSTextAlignment textAlignment);
@property (nonatomic,strong,readonly) UITextField *(^mz_placeholder)(NSString* placeholder);
@property (nonatomic,assign,readonly) UITextField *(^mz_keyboardType)(UIKeyboardType keyboardType);
@end

@interface UITextView (WMZQuickView)
/*!
* @brief init
* @param block self
*/
+ (UITextView*)mz_view:(nullable QuickCustomTextView)block;
@property (nonatomic,weak,  readonly) UITextView *(^mz_delegate)(id<UITextViewDelegate> delegate);
@property (nonatomic,strong,readonly) UITextView *(^mz_textColor)(UIColor* textColor);
@property (nonatomic,strong,readonly) UITextView *(^mz_font)(UIFont* font);
@property (nonatomic,strong,readonly) UITextView *(^mz_text)(NSString* text);
@property (nonatomic,assign,readonly) UITextView *(^mz_textAlignment)(NSTextAlignment textAlignment);
@property (nonatomic,assign,readonly) UITextView *(^mz_keyboardType)(UIKeyboardType keyboardType);
@end

@interface UISwitch (WMZQuickView)
/*!
* @brief init
* @param block self
*/
+ (UISwitch*)mz_view:(nullable QuickCustomSwitch)block;
@property (nonatomic,strong,readonly) UISwitch *(^mz_onImage)(UIImage* onImage);
@property (nonatomic,strong,readonly) UISwitch *(^mz_offImage)(UIImage* offImage);
@property (nonatomic,strong,readonly) UISwitch *(^mz_onTintColor)(UIColor* onTintColor);
@property (nonatomic,strong,readonly) UISwitch *(^mz_thumbTintColor)(UIColor* thumbTintColor);
@property (nonatomic,copy,  readonly) UISwitch *(^mz_event)(QuickCustomEvent block);
@end

@interface UISlider (WMZQuickView)
/*!
* @brief init
* @param block self
*/
+ (UISlider*)mz_view:(nullable QuickCustomSlider)block;
@property (nonatomic,assign,readonly) UISlider *(^mz_value)(float value);
@property (nonatomic,assign,readonly) UISlider *(^mz_minimumValue)(float minimumValue);
@property (nonatomic,assign,readonly) UISlider *(^mz_maximumValue)(float maximumValue);
@property (nonatomic,strong,readonly) UISlider *(^mz_minimumTrackTintColor)(UIColor* minimumTrackTintColor);
@property (nonatomic,strong,readonly) UISlider *(^mz_thumbTintColor)(UIColor* thumbTintColor);
@property (nonatomic,strong,readonly) UISlider *(^mz_maximumTrackTintColor)(UIColor* maximumTrackTintColor);
@property (nonatomic,copy,  readonly) UISlider *(^mz_event)(QuickCustomEvent block);
@end

@interface UIProgressView(WMZQuickView)
/*!
* @brief init
* @param block self
*/
+ (UIProgressView*)mz_view:(nullable QuickCustomProgressView)block;
@property (nonatomic,assign,readonly) UIProgressView *(^mz_progressViewStyle)(UIProgressViewStyle progressViewStyle);
@property (nonatomic,assign,readonly) UIProgressView *(^mz_progress)(float progress);
@property (nonatomic,strong,readonly) UIProgressView *(^mz_progressTintColor)(UIColor* progressTintColor);
@property (nonatomic,strong,readonly) UIProgressView *(^mz_trackTintColor)(UIColor* trackTintColor);
@property (nonatomic,copy,  readonly) UIProgressView *(^mz_event)(QuickCustomEvent block);
@end

@interface UITableView(WMZQuickView)
/*!
* @brief init
* @param style style
* @param block self
*/
+ (UITableView*)mz_view:(nullable QuickCustomTableView)block style:(UITableViewStyle)style;
@property (nonatomic,weak,  readonly) UITableView *(^mz_dataSource)(id <UITableViewDataSource> dataSource);
@property (nonatomic,weak,  readonly) UITableView *(^mz_delegate)(id<UITableViewDelegate> delegate);
@property (nonatomic,assign,readonly) UITableView *(^mz_keyboardDismissMode)(UIScrollViewKeyboardDismissMode keyboardDismissMode);
@property (nonatomic,assign,readonly) UITableView *(^mz_separatorStyle)(UITableViewCellSeparatorStyle separatorStyle);
@property (nonatomic,copy,readonly) UITableView *(^mz_registerCellClass)(NSArray<NSString*>* cellClassArr);
@property (nonatomic,copy,readonly) UITableView *(^mz_registerHeaderFooterClass)(NSArray<NSString*>* cellClassArr);
@property (nonatomic,assign,readonly) UITableView *(^mz_showsHorizontalScrollIndicator)(BOOL showsHorizontalScrollIndicator);
@property (nonatomic,assign,readonly) UITableView
    *(^mz_showsVerticalScrollIndicator)(BOOL showsVerticalScrollIndicator);
@end

@interface UICollectionView(WMZQuickView)
/*!
* @brief init
* @param layout UICollectionViewFlowLayout
* @param block self
*/
+ (UICollectionView*)mz_view:(nullable QuickCustomCollectionView)block layout:(UICollectionViewFlowLayout*)layout;
@property (nonatomic,weak,  readonly) UICollectionView *(^mz_dataSource)(id <UICollectionViewDataSource> dataSource);
@property (nonatomic,weak,  readonly) UICollectionView *(^mz_delegate)(id<UICollectionViewDelegate> delegate);
@property (nonatomic,assign,readonly) UICollectionView *(^mz_keyboardDismissMode)(UIScrollViewKeyboardDismissMode keyboardDismissMode);
@property (nonatomic,copy,readonly) UICollectionView *(^mz_registerCellClass)(NSArray<NSString*>* cellClassArr);
@property (nonatomic,copy,readonly) UICollectionView *(^mz_registerHeaderClass)(NSArray<NSString*>* cellClassArr);
@property (nonatomic,copy,readonly) UICollectionView *(^mz_registerFooterClass)(NSArray<NSString*>* cellClassArr);
@property (nonatomic,assign,readonly) UICollectionView *(^mz_showsHorizontalScrollIndicator)(BOOL showsHorizontalScrollIndicator);
@property (nonatomic,assign,readonly) UICollectionView
    *(^mz_showsVerticalScrollIndicator)(BOOL showsVerticalScrollIndicator);

@end

@interface UICollectionViewFlowLayout(WMZQuickView)
/*!
* @brief init
* @param minimumLineSpacing minimumLineSpacing
* @param minimumInteritemSpacing minimumInteritemSpacing
* @param sectionInset sectionInset
* @param block self
*/
+ (UICollectionViewFlowLayout*)mz_flowLayout:(CGFloat)minimumLineSpacing
                     minimumInteritemSpacing:(CGFloat)minimumInteritemSpacing
                                sectionInset:(UIEdgeInsets)sectionInset
                                       block:(nullable QuickCollectionViewFlowLayout)block;
@end

@interface UIScrollView(WMZQuickView)
/*!
* @brief init
* @param block self
*/
+ (UIScrollView*)mz_view:(nullable QuickCustomScrollView)block;
@property (nonatomic,weak,  readonly) UIScrollView *(^mz_delegate)(id<UIScrollViewDelegate> delegate);
@property (nonatomic,assign,readonly) UIScrollView
*(^mz_showsHorizontalScrollIndicator)(BOOL showsHorizontalScrollIndicator);
@property (nonatomic,assign,readonly) UIScrollView
    *(^mz_showsVerticalScrollIndicator)(BOOL showsVerticalScrollIndicator);
@property (nonatomic,assign,readonly) UIScrollView
*(^mz_contentOffset)(CGPoint contentOffset);
@property (nonatomic,assign,readonly) UIScrollView
*(^mz_contentSize)(CGSize contentSize);

@end
NS_ASSUME_NONNULL_END
