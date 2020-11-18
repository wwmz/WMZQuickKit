# WMZQuickKit - 链式编程快速写UIKit控件 只需要引入一个文件即可

```
//通用属性写后面 不然会点不出来
    //UIScrollView
    UIScrollView *scrollView = Add_ScrollView(^(UIScrollView * _Nonnull scrollView) {
         scrollView
        .add_showsVerticalScrollIndicator(NO)
        .add_constraints(^(MASConstraintMaker * _Nullable make) {
            make.edges.mas_equalTo(0);
        }, self.view);
    });
    
    
     //UIView使用
    UIView *mainView = Add_View(^(UIView * _Nullable view) {
         view
         .add_backgroundColor([UIColor whiteColor])
         .add_superView(scrollView)
         .add_constraints(^(MASConstraintMaker * _Nullable make) {
             make.top.bottom.left.mas_equalTo(0);
             make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
         }, scrollView);
     });
    
    //UIView使用 类方法通用写法 add_view 开头
    [UIView add_view:^(UIView * _Nonnull view) {
        view
        .add_backgroundColor([UIColor redColor])
        .add_cornerRadius(15)
        .add_superView(mainView)
        .add_frame(CGRectMake(20, 60, UIScreen.mainScreen.bounds.size.width - 40, 30))
        .add_event(^(UIView * _Nonnull sender) {
            NSLog(@"点击");
        });
    }];
    
    //UILabel使用
    Add_Label(^(UILabel * _Nonnull label) {
        label
        .add_text(@"快速创建文本")
        .add_textAlignment(NSTextAlignmentCenter)
        .add_textColor([UIColor redColor])
        .add_font([UIFont systemFontOfSize:15.0f])
        .add_constraints(^(MASConstraintMaker * _Nullable make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(100);
        }, mainView);
    });
    
    //UIButton使用
    Add_Button(^(UIButton * _Nonnull button) {
        button
        .add_title(@"点击文字变红色")
        .add_font([UIFont systemFontOfSize:14.0f])
        .add_titleColor([UIColor whiteColor])
        .add_state_titleColor([UIColor redColor], UIControlStateSelected)
        .add_event(^(UIView * _Nonnull sender) {  //点击事件
            button.selected = ![button isSelected];
        })
        .add_frame(CGRectMake(60, 130, UIScreen.mainScreen.bounds.size.width - 120, 44))
        .add_superView(mainView)
        .add_backgroundColor([UIColor blueColor])
        .add_cornerRadius(22);
    });
    
    //UIImageView
    Add_ImageView(^(UIImageView * _Nonnull imageView) {
       imageView
        .add_image([UIImage imageNamed:@"timg"])
        .add_contentMode(UIViewContentModeScaleAspectFill)
        .add_frame(CGRectMake(([UIScreen mainScreen].bounds.size.width - 80)/2, 180, 80, 80))
        .add_cornerRadius(40)  //放在设置frame后面
        .add_superView(mainView);
    });
    
    
    //UITextField
    Add_TextField(^(UITextField * _Nonnull textField) {
       textField
        .add_delegate(self)
        .add_placeholder(@"请输入")
        .add_textColor([UIColor blackColor])
        .add_textAlignment(NSTextAlignmentCenter)
        .add_frame(CGRectMake(60, 270, UIScreen.mainScreen.bounds.size.width - 120, 40))
        .add_superView(mainView);
    });
    
    //UISwitch
    Add_Switch(^(UISwitch * _Nonnull switc) {
        switc
        .add_onTintColor([UIColor blueColor])
        .add_event(^(UIView * _Nonnull sender) {  //切换事件
            NSLog(@"切换%d",switc.on);
        })
        .add_frame(CGRectMake(([UIScreen mainScreen].bounds.size.width - 60)/2, 320, 60, 40))
        .add_superView(mainView);
    });
    
    //UITextView
    Add_TextView(^(UITextView * _Nonnull textView) {
         textView
        .add_delegate(self)
        .add_font([UIFont systemFontOfSize:15.0f])
        .add_text(@"UITextView")
        .add_textColor([UIColor blackColor])
        .add_textAlignment(NSTextAlignmentCenter)
        .add_frame(CGRectMake(60, 370, UIScreen.mainScreen.bounds.size.width - 120, 80))
        .add_backgroundColor([UIColor lightGrayColor])
        .add_cornerRadius(20)
        .add_superView(mainView);
    });
    
    //UISlider
    Add_Slider(^(UISlider * _Nonnull slider) {
        slider
        .add_minimumValue(0)
        .add_maximumValue(100)
        .add_value(50)
        .add_thumbTintColor([UIColor redColor])
        .add_minimumTrackTintColor([UIColor greenColor])
        .add_maximumTrackTintColor([UIColor redColor])
        .add_event(^(UIView * _Nonnull sender) {  //切换事件
            NSLog(@"改变%f",slider.value);
        })
        .add_frame(CGRectMake(60, 450, UIScreen.mainScreen.bounds.size.width - 120, 40))
        .add_superView(mainView);
    });
    
    //UIProgressView
    Add_ProgressView(^(UIProgressView * _Nonnull progressView) {
        progressView
        .add_progressViewStyle(UIProgressViewStyleDefault)
        .add_progress(0.5)
        .add_progressTintColor([UIColor redColor])
        .add_trackTintColor([UIColor greenColor])
        .add_frame(CGRectMake(60, 500, UIScreen.mainScreen.bounds.size.width - 120, 40))
        .add_superView(mainView);
    });
    
    //UITableView
    Add_TableView(^(UITableView * _Nonnull tableView) {
        tableView
        .add_dataSource(self)
        .add_delegate(self)
        .add_keyboardDismissMode(UIScrollViewKeyboardDismissModeOnDrag)
        .add_separatorStyle(UITableViewCellSeparatorStyleNone)
        .add_registerCellClass(@[@"UITableViewCell"])
        .add_frame(CGRectMake(0, 550, UIScreen.mainScreen.bounds.size.width, 100))
        .add_superView(mainView);
    }, UITableViewStyleGrouped);
    
    
    //UICollectionViewFlowLayout
    UICollectionViewFlowLayout *layout = Add_FlowLayout(10, 10, UIEdgeInsetsZero, ^(UICollectionViewFlowLayout * _Nonnull collectionView) {
          collectionView.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width/3-10, 50);
    });
    
    
    //UICollectionView
    Add_CollectionView(^(UICollectionView * _Nonnull collectionView) {
        collectionView
        .add_dataSource(self)
        .add_delegate(self)
        .add_showsVerticalScrollIndicator(NO)
        .add_showsHorizontalScrollIndicator(NO)
        .add_keyboardDismissMode(UIScrollViewKeyboardDismissModeOnDrag)
        .add_registerCellClass(@[@"UICollectionViewCell"])
        .add_constraints(^(MASConstraintMaker * _Nullable make) {
            make.top.mas_equalTo(680);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(200);
            make.bottom.mas_equalTo(0);
        }, mainView)
        .add_backgroundColor([UIColor whiteColor]);
    }, layout);
```


### 依赖
目前习惯 导入了Masonry 可以删掉相关的几行代码

安装
==============
### 手动安装

1. 下载 WMZQuickKit 文件夹内的所有内容。
2. 将 WMZQuickKit 内的"UIView+WMZQuickView.h"和"UIView+WMZQuickView.m"添加(拖放)到你的工程。
3. 导入 #import "UIView+WMZQuickView.h"

系统要求
==============
该库最低支持 `iOS 9.0` 和 `Xcode 9.0`。



许可证
==============
WMZDialog 使用 MIT 许可证，详情见 [LICENSE](LICENSE) 文件。


个人主页
==============
使用过程中如果有什么bug欢迎给我提issue 我看到就会解决
[我的简书](https://www.jianshu.com/p/601ad3960353)
ios问题交流群 937909825(有问题加群哈)
