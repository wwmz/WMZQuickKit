//
//  UIView+WMZQuickView.h
//  WMZQuickKit
//
//  Created by wmz on 2020/11/18.
//  Copyright © 2020 wmz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif
typedef void (^QuickLongGuesture)         (UILongPressGestureRecognizer* _Nonnull longGuesture);
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
* @brief init 类方法
*/
+ (UIView*)add_view:(nullable QuickCustomView)block;
UIView* Add_View(QuickCustomView block);
- (void)addAnimal;
/*!
* @brief superView
*/
@property (nonatomic,strong,readonly) UIView *(^add_superView)(UIView* superView);
/*!
* @brief frame
*/
@property (nonatomic,assign,readonly) UIView *(^add_frame)(CGRect frame);
/*!
* @brief Masonry autoLayout
*/
@property (nonatomic,copy,  readonly) UIView *(^add_constraints)(QuickConstraint formConstraint,UIView *superView);
@property (nonatomic,strong,readonly) UIView *(^add_backgroundColor)(UIColor* backgroundColor);
@property (nonatomic,strong,readonly) UIView *(^add_bgBackgroundColor)(UIColor* backgroundColor);
@property (nonatomic,assign,readonly) UIView *(^add_cornerRadius)(CGFloat cornerRadius);
/*!
* @brief init
* @param block self
*/
@property (nonatomic,copy,  readonly) UIView *(^add_event)(QuickCustomEvent block);
@property (nonatomic,assign,readonly) UIView *(^add_userInteractionEnabled)(BOOL userInteractionEnabled);
@property (nonatomic,copy,  readonly) UIView *(^add_longEvent)(QuickLongGuesture block);
@property (nonatomic, copy) QuickCustomEvent add_block;
@property (nonatomic, copy) QuickLongGuesture add_longBlock;
@property (nonatomic, strong) CALayer *anLayer;
@end

@interface UILabel (WMZQuickView)
/*!
* @brief init
* @param block self
*/
+ (UILabel*)add_view:(nullable QuickCustomLabel)block;
UILabel* Add_Label(QuickCustomLabel block);
@property (nonatomic,strong,readonly) UILabel *(^add_textColor)(UIColor* textColor);
@property (nonatomic,strong,readonly) UILabel *(^add_font)(UIFont* font);
@property (nonatomic,strong,readonly) UILabel *(^add_text)(NSString* text);
@property (nonatomic,strong,readonly) UILabel *(^add_attributedText)(NSAttributedString* attributedText);
@property (nonatomic,assign,readonly) UILabel *(^add_textAlignment)(NSTextAlignment textAlignment);
@property (nonatomic,assign,readonly) UILabel *(^add_numberOfLines)(NSInteger numberOfLines);
@end

@interface UIButton (WMZQuickView)
/*!
* @brief init
* @param block self
*/
+ (UIButton*)add_view:(nullable QuickCustomButton)block;
UIButton* Add_Button(QuickCustomButton block);
@property (nonatomic,strong,readonly) UIButton *(^add_state_titleColor)(UIColor* textColor,UIControlState state);
@property (nonatomic,strong,readonly) UIButton *(^add_state_title)(NSString* title,UIControlState state);
@property (nonatomic,strong,readonly) UIButton *(^add_state_image)(UIImage* image,UIControlState state);
@property (nonatomic,strong,readonly) UIButton *(^add_titleColor)(UIColor* textColor);
@property (nonatomic,strong,readonly) UIButton *(^add_title)(NSString* title);
@property (nonatomic,strong,readonly) UIButton *(^add_image)(UIImage* image);
@property (nonatomic,strong,readonly) UIButton *(^add_font)(UIFont* font);
@property (nonatomic,copy,  readonly) UIButton *(^add_event)(QuickCustomEvent block);
@property (nonatomic,strong,readonly) UIButton *(^add_state_event)(QuickCustomEvent block,UIControlEvents state);
@end

@interface UIImageView (WMZQuickView)
/*!
* @brief init
* @param block self
*/
+ (UIImageView*)add_view:(nullable QuickCustomImageView)block;
UIImageView* Add_ImageView(QuickCustomImageView block);
@property (nonatomic,strong,readonly) UIImageView *(^add_image)(UIImage* image);
@property (nonatomic,assign,readonly) UIImageView *(^add_contentMode)(UIViewContentMode contentMode);
@property (nonatomic,assign,readonly) UIImageView *(^add_cornerRadius)(CGFloat cornerRadius);
@end


@interface UITextField (WMZQuickView)
/*!
* @brief init
* @param block self
*/
+ (UITextField*)add_view:(nullable QuickCustomTextField)block;
UITextField* Add_TextField(QuickCustomTextField block);
@property (nonatomic,weak,  readonly) UITextField *(^add_delegate)(id<UITextFieldDelegate> delegate);
@property (nonatomic,strong,readonly) UITextField *(^add_textColor)(UIColor* textColor);
@property (nonatomic,strong,readonly) UITextField *(^add_font)(UIFont* font);
@property (nonatomic,strong,readonly) UITextField *(^add_text)(NSString* text);
@property (nonatomic,assign,readonly) UITextField *(^add_textAlignment)(NSTextAlignment textAlignment);
@property (nonatomic,strong,readonly) UITextField *(^add_placeholder)(NSString* placeholder);
@property (nonatomic,assign,readonly) UITextField *(^add_keyboardType)(UIKeyboardType keyboardType);
@end

@interface UITextView (WMZQuickView)
/*!
* @brief init
* @param block self
*/
+ (UITextView*)add_view:(nullable QuickCustomTextView)block;
UITextView* Add_TextView(QuickCustomTextView block);
@property (nonatomic,weak,  readonly) UITextView *(^add_delegate)(id<UITextViewDelegate> delegate);
@property (nonatomic,strong,readonly) UITextView *(^add_textColor)(UIColor* textColor);
@property (nonatomic,strong,readonly) UITextView *(^add_font)(UIFont* font);
@property (nonatomic,strong,readonly) UITextView *(^add_text)(NSString* text);
@property (nonatomic,assign,readonly) UITextView *(^add_textAlignment)(NSTextAlignment textAlignment);
@property (nonatomic,assign,readonly) UITextView *(^add_keyboardType)(UIKeyboardType keyboardType);
@end

@interface UISwitch (WMZQuickView)
/*!
* @brief init
* @param block self
*/
+ (UISwitch*)add_view:(nullable QuickCustomSwitch)block;
UISwitch* Add_Switch(QuickCustomSwitch block);
@property (nonatomic,strong,readonly) UISwitch *(^add_onImage)(UIImage* onImage);
@property (nonatomic,strong,readonly) UISwitch *(^add_offImage)(UIImage* offImage);
@property (nonatomic,strong,readonly) UISwitch *(^add_onTintColor)(UIColor* onTintColor);
@property (nonatomic,strong,readonly) UISwitch *(^add_thumbTintColor)(UIColor* thumbTintColor);
@property (nonatomic,copy,  readonly) UISwitch *(^add_event)(QuickCustomEvent block);
@end

@interface UISlider (WMZQuickView)
/*!
* @brief init
* @param block self
*/
+ (UISlider*)add_view:(nullable QuickCustomSlider)block;
UISlider* Add_Slider(QuickCustomSlider block);
@property (nonatomic,assign,readonly) UISlider *(^add_value)(float value);
@property (nonatomic,assign,readonly) UISlider *(^add_minimumValue)(float minimumValue);
@property (nonatomic,assign,readonly) UISlider *(^add_maximumValue)(float maximumValue);
@property (nonatomic,strong,readonly) UISlider *(^add_minimumTrackTintColor)(UIColor* minimumTrackTintColor);
@property (nonatomic,strong,readonly) UISlider *(^add_thumbTintColor)(UIColor* thumbTintColor);
@property (nonatomic,strong,readonly) UISlider *(^add_maximumTrackTintColor)(UIColor* maximumTrackTintColor);
@property (nonatomic,copy,  readonly) UISlider *(^add_event)(QuickCustomEvent block);
@end

@interface UIProgressView(WMZQuickView)
/*!
* @brief init
* @param block self
*/
+ (UIProgressView*)add_view:(nullable QuickCustomProgressView)block;
UIProgressView* Add_ProgressView(QuickCustomProgressView block);
@property (nonatomic,assign,readonly) UIProgressView *(^add_progressViewStyle)(UIProgressViewStyle progressViewStyle);
@property (nonatomic,assign,readonly) UIProgressView *(^add_progress)(float progress);
@property (nonatomic,strong,readonly) UIProgressView *(^add_progressTintColor)(UIColor* progressTintColor);
@property (nonatomic,strong,readonly) UIProgressView *(^add_trackTintColor)(UIColor* trackTintColor);
@property (nonatomic,copy,  readonly) UIProgressView *(^add_event)(QuickCustomEvent block);
@end

@interface UITableView(WMZQuickView)
/*!
* @brief init
* @param style style
* @param block self
*/
+ (UITableView*)add_view:(nullable QuickCustomTableView)block style:(UITableViewStyle)style;
UITableView* Add_TableView(QuickCustomTableView block,UITableViewStyle style);
@property (nonatomic,weak,  readonly) UITableView *(^add_dataSource)(id <UITableViewDataSource> dataSource);
@property (nonatomic,weak,  readonly) UITableView *(^add_delegate)(id<UITableViewDelegate> delegate);
@property (nonatomic,assign,readonly) UITableView *(^add_keyboardDismissMode)(UIScrollViewKeyboardDismissMode keyboardDismissMode);
@property (nonatomic,assign,readonly) UITableView *(^add_separatorStyle)(UITableViewCellSeparatorStyle separatorStyle);
@property (nonatomic,copy,readonly) UITableView *(^add_registerCellClass)(NSArray<NSString*>* cellClassArr);
@property (nonatomic,copy,readonly) UITableView *(^add_registerHeaderFooterClass)(NSArray<NSString*>* cellClassArr);
@property (nonatomic,assign,readonly) UITableView *(^add_showsHorizontalScrollIndicator)(BOOL showsHorizontalScrollIndicator);
@property (nonatomic,assign,readonly) UITableView
    *(^add_showsVerticalScrollIndicator)(BOOL showsVerticalScrollIndicator);
@end

@interface UICollectionView(WMZQuickView)
/*!
* @brief init
* @param layout UICollectionViewFlowLayout
* @param block self
*/
+ (UICollectionView*)add_view:(nullable QuickCustomCollectionView)block layout:(UICollectionViewFlowLayout*)layout;
UICollectionView* Add_CollectionView(QuickCustomCollectionView block,UICollectionViewFlowLayout* layout);
@property (nonatomic,weak,  readonly) UICollectionView *(^add_dataSource)(id <UICollectionViewDataSource> dataSource);
@property (nonatomic,weak,  readonly) UICollectionView *(^add_delegate)(id<UICollectionViewDelegate> delegate);
@property (nonatomic,assign,readonly) UICollectionView *(^add_keyboardDismissMode)(UIScrollViewKeyboardDismissMode keyboardDismissMode);
@property (nonatomic,copy,readonly) UICollectionView *(^add_registerCellClass)(NSArray<NSString*>* cellClassArr);
@property (nonatomic,copy,readonly) UICollectionView *(^add_registerHeaderClass)(NSArray<NSString*>* cellClassArr);
@property (nonatomic,copy,readonly) UICollectionView *(^add_registerFooterClass)(NSArray<NSString*>* cellClassArr);
@property (nonatomic,assign,readonly) UICollectionView *(^add_showsHorizontalScrollIndicator)(BOOL showsHorizontalScrollIndicator);
@property (nonatomic,assign,readonly) UICollectionView
    *(^add_showsVerticalScrollIndicator)(BOOL showsVerticalScrollIndicator);

@end

@interface UICollectionViewFlowLayout(WMZQuickView)
/*!
* @brief init
* @param minimumLineSpacing minimumLineSpacing
* @param minimumInteritemSpacing minimumInteritemSpacing
* @param sectionInset sectionInset
* @param block self
*/
+ (UICollectionViewFlowLayout*)add_flowLayout:(CGFloat)minimumLineSpacing
                     minimumInteritemSpacing:(CGFloat)minimumInteritemSpacing
                                sectionInset:(UIEdgeInsets)sectionInset
                                       block:(nullable QuickCollectionViewFlowLayout)block;
UICollectionViewFlowLayout* Add_FlowLayout(CGFloat minimumLineSpacing,CGFloat minimumInteritemSpacing,UIEdgeInsets sectionInset,QuickCollectionViewFlowLayout block);
@end

@interface UIScrollView(WMZQuickView)
/*!
* @brief init
* @param block self
*/
+ (UIScrollView*)add_view:(nullable QuickCustomScrollView)block;
UIScrollView* Add_ScrollView(QuickCustomScrollView block);
@property (nonatomic,weak,  readonly) UIScrollView *(^add_delegate)(id<UIScrollViewDelegate> delegate);
@property (nonatomic,assign,readonly) UIScrollView
*(^add_showsHorizontalScrollIndicator)(BOOL showsHorizontalScrollIndicator);
@property (nonatomic,assign,readonly) UIScrollView
    *(^add_showsVerticalScrollIndicator)(BOOL showsVerticalScrollIndicator);
@property (nonatomic,assign,readonly) UIScrollView
*(^add_contentOffset)(CGPoint contentOffset);
@property (nonatomic,assign,readonly) UIScrollView
*(^add_contentSize)(CGSize contentSize);

@end

typedef enum :NSInteger{
    BtnPositionLeft     = 0,            //图片在左，文字在右，默认
    BtnPositionRight    = 1,            //图片在右，文字在左
    BtnPositionTop      = 2,            //图片在上，文字在下
    BtnPositionBottom   = 3,            //图片在下，文字在上
}BtnPosition;
@interface UIButton(Position)
- (void)TagSetImagePosition:(BtnPosition)postion spacing:(CGFloat)spacing;
@end

@interface CALayer (LayerColor)
- (void)setBorderColorFromUIColor:(UIColor *)color;
@end

@interface QuickButton:UIButton
@end
NS_ASSUME_NONNULL_END
