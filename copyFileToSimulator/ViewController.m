//
//  ViewController.m
//  copyFileToSimulator
//
//  Created by cjw on 2018/6/8.
//  Copyright © 2018年 cjw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //读工程中的视频
    NSString *videoPath=[[NSBundle mainBundle] pathForResource:@"vid" ofType:@"mp4"];
    
    //读工程中的图片
    NSString *imagePath=[[NSBundle mainBundle] pathForResource:@"pic" ofType:@"png"];
    UIImage *imageToCopyToSimulator=[UIImage imageWithContentsOfFile:imagePath];
    
    //执行保存//info.plist文件中要加一个Privacy - Photo Library Additions Usage Description权限请求，不加看报错也就知道了
    if(UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(videoPath)){
        
        //保存视频，直接按视频在项目中的路径存
        UISaveVideoAtPathToSavedPhotosAlbum(videoPath,nil,nil,nil);
        
        //保存图片，要把路径转换成UIImage对象才能存
        UIImageWriteToSavedPhotosAlbum(imageToCopyToSimulator,nil,nil,nil);
        
        NSLog(@"保存成功👌👌👌");
    }
    else {
        NSLog(@"保存失败🙅🙅🙅");
    }
    
}

@end
