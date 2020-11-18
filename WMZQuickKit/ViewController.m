//
//  ViewController.m
//  WMZQuickKit
//
//  Created by wmz on 2020/11/18.
//  Copyright © 2020 wmz. All rights reserved.
//

#import "ViewController.h"
#import "UIView+WMZQuickView.h"
@interface ViewController ()<UITextFieldDelegate,UITextViewDelegate,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //通用属性写后面 不然会点不出来
    //UIScrollView
    UIScrollView *scrollView = [UIScrollView mz_view:^(UIScrollView * _Nonnull scrollView){
         scrollView
        .mz_showsVerticalScrollIndicator(NO)
        .mz_constraints(^(MASConstraintMaker * _Nullable make) {
            make.edges.mas_equalTo(0);
        }, self.view);
    }];
    
    
     //UIView使用
    UIView *mainView = [UIView mz_view:^(UIView * _Nullable view) {
         view
         .mz_backgroundColor([UIColor whiteColor])
         .mz_superView(scrollView)
         .mz_constraints(^(MASConstraintMaker * _Nullable make) {
             make.top.bottom.left.mas_equalTo(0);
             make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
         }, scrollView);
     }];
    
    //UIView使用
   [UIView mz_view:^(UIView * _Nullable view) {
        view
        .mz_backgroundColor([UIColor redColor])
        .mz_cornerRadius(15)
        .mz_superView(mainView)
        .mz_frame(CGRectMake(20, 60, UIScreen.mainScreen.bounds.size.width - 40, 30))
        .mz_event(^(UIView * _Nonnull sender) {
            NSLog(@"点击");
         });
    }];
    
    //UILabel使用
    [UILabel mz_view:^(UILabel * _Nonnull label) {
        label
        .mz_text(@"快速创建文本")
        .mz_textAlignment(NSTextAlignmentCenter)
        .mz_textColor([UIColor redColor])
        .mz_font([UIFont systemFontOfSize:15.0f])
        .mz_constraints(^(MASConstraintMaker * _Nullable make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(100);
        }, mainView);
    }];
    
    //UIButton使用
    [UIButton mz_view:^(UIButton * _Nonnull button) {
        button
        .mz_title(@"点击文字变红色")
        .mz_font([UIFont systemFontOfSize:14.0f])
        .mz_titleColor([UIColor whiteColor])
        .mz_state_titleColor([UIColor redColor], UIControlStateSelected)
        .mz_event(^(UIView * _Nonnull sender) {  //点击事件
            button.selected = ![button isSelected];
        })
        .mz_frame(CGRectMake(60, 130, UIScreen.mainScreen.bounds.size.width - 120, 44))
        .mz_superView(mainView)
        .mz_backgroundColor([UIColor blueColor])
        .mz_cornerRadius(22);
    }];
    
    //UIImageView
    [UIImageView mz_view:^(UIImageView * _Nonnull imageView) {
       imageView
        .mz_image([UIImage imageNamed:@"timg"])
        .mz_contentMode(UIViewContentModeScaleAspectFill)
        .mz_frame(CGRectMake(([UIScreen mainScreen].bounds.size.width - 80)/2, 180, 80, 80))
        .mz_cornerRadius(40)  //放在设置frame后面
        .mz_superView(mainView);
    }];
    
    
    //UITextField
    [UITextField mz_view:^(UITextField * _Nonnull textField) {
       textField
        .mz_delegate(self)
        .mz_placeholder(@"请输入")
        .mz_textColor([UIColor blackColor])
        .mz_textAlignment(NSTextAlignmentCenter)
        .mz_frame(CGRectMake(60, 270, UIScreen.mainScreen.bounds.size.width - 120, 40))
        .mz_superView(mainView);
    }];
    
    //UISwitch
    [UISwitch mz_view:^(UISwitch * _Nonnull switc) {
        switc
        .mz_onTintColor([UIColor blueColor])
        .mz_event(^(UIView * _Nonnull sender) {  //切换事件
            NSLog(@"切换%d",switc.on);
        })
        .mz_frame(CGRectMake(([UIScreen mainScreen].bounds.size.width - 60)/2, 320, 60, 40))
        .mz_superView(mainView);
    }];
    
    //UITextView
    [UITextView mz_view:^(UITextView * _Nonnull textView) {
         textView
        .mz_delegate(self)
        .mz_font([UIFont systemFontOfSize:15.0f])
        .mz_text(@"UITextView")
        .mz_textColor([UIColor blackColor])
        .mz_textAlignment(NSTextAlignmentCenter)
        .mz_frame(CGRectMake(60, 370, UIScreen.mainScreen.bounds.size.width - 120, 80))
        .mz_backgroundColor([UIColor lightGrayColor])
        .mz_cornerRadius(20)
        .mz_superView(mainView);
    }];
    
    //UISlider
    [UISlider mz_view:^(UISlider * _Nonnull slider) {
        slider
        .mz_minimumValue(0)
        .mz_maximumValue(100)
        .mz_value(50)
        .mz_thumbTintColor([UIColor redColor])
        .mz_minimumTrackTintColor([UIColor greenColor])
        .mz_maximumTrackTintColor([UIColor redColor])
        .mz_event(^(UIView * _Nonnull sender) {  //切换事件
            NSLog(@"改变%f",slider.value);
        })
        .mz_frame(CGRectMake(60, 450, UIScreen.mainScreen.bounds.size.width - 120, 40))
        .mz_superView(mainView);
    }];
    
    //UIProgressView
    [UIProgressView mz_view:^(UIProgressView * _Nonnull progressView) {
        progressView
        .mz_progressViewStyle(UIProgressViewStyleDefault)
        .mz_progress(0.5)
        .mz_progressTintColor([UIColor redColor])
        .mz_trackTintColor([UIColor greenColor])
        .mz_frame(CGRectMake(60, 500, UIScreen.mainScreen.bounds.size.width - 120, 40))
        .mz_superView(mainView);
    }];
    
    //UITableView
    [UITableView mz_view:^(UITableView * _Nonnull tableView) {
        tableView
        .mz_dataSource(self)
        .mz_delegate(self)
        .mz_keyboardDismissMode(UIScrollViewKeyboardDismissModeOnDrag)
        .mz_separatorStyle(UITableViewCellSeparatorStyleNone)
        .mz_registerCellClass(@[@"UITableViewCell"])
        .mz_frame(CGRectMake(0, 550, UIScreen.mainScreen.bounds.size.width, 100))
        .mz_superView(mainView);
    } style:UITableViewStyleGrouped];
    
    
    
    //UICollectionViewFlowLayout
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout mz_flowLayout:10 minimumInteritemSpacing:10 sectionInset:UIEdgeInsetsZero block:^(UICollectionViewFlowLayout * _Nonnull collectionView) {
        collectionView.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width/3-10, 50);
    }];
    
    //UICollectionView
    [UICollectionView mz_view:^(UICollectionView * _Nonnull collectionView) {
        collectionView
        .mz_dataSource(self)
        .mz_delegate(self)
        .mz_showsVerticalScrollIndicator(NO)
        .mz_showsHorizontalScrollIndicator(NO)
        .mz_keyboardDismissMode(UIScrollViewKeyboardDismissModeOnDrag)
        .mz_registerCellClass(@[@"UICollectionViewCell"])
        .mz_constraints(^(MASConstraintMaker * _Nullable make) {
            make.top.mas_equalTo(680);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(200);
            make.bottom.mas_equalTo(0);
        }, mainView)
        .mz_backgroundColor([UIColor whiteColor]);
    } layout:layout];
    
}

#pragma tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = @"显示";
    return cell;}

#pragma collectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 12;}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor redColor];
    return cell;}

@end
