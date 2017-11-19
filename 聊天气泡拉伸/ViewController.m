//
//  ViewController.m
//  聊天气泡拉伸
//
//  Created by 韩军强 on 2017/11/16.
//  Copyright © 2017年 韩军强. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImage *image = [UIImage imageNamed:@"chat_send_nor"];
    
    /**
         ➤方法一
     
         resizingMode：
         UIImageResizingModeTile：平铺模式
         UIImageResizingModeStretch：拉伸模式
     
         resizableImageWithCapInsets：
         上左下右间距，表示的是保护区域。
    
         保护区域：指的是四个圆角我们不想让它拉伸，我们要量出圆角的尺寸，然后设置inset
         只要保护区域正确，模式一和模式二效果是一样的。
     
    */

    //模式一
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(30, 30, 30, 30)]; //默认为平铺模式(iOS5.0)
    //模式二
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(30, 30, 30, 30) resizingMode:UIImageResizingModeStretch]; //拉伸模式(iOS6.0)
    
    /**
        ➤方法二（这个是比较老的方法，旧项目中可能会遇到）
     
         可以理解成：只拉伸中间1*1的空间，所以传参数左、上时，传图片宽高的一半即可。
     
         根据官方文档：
             1，right cap is calculated as width - leftCapWidth - 1
             2，bottom cap is calculated as height - topCapWidth - 1
     
          left
          top
          width
          height
          right = width - left - 1;
          等价于：1 = width - left - right;
     
          bottom = height - top - 1;
          等价于：1 = height - top - bottom;
    */
//    image = [image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
    
    /**
        方法三：图片必须放在Assets.xcassets中（推荐）
         1，找到Assets.xcassets中的图片，选中
         2，找到slicing模块
         3，设置slices为Horizontal and Vertical
    */
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 300)];
    imgView.backgroundColor = [UIColor redColor];
    imgView.image = image;
    
    [self.view addSubview:imgView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
