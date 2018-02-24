//
//  ViewController.m
//  glsl_demo
//
//  Created by jiang on 2018/2/24.
//  Copyright © 2018年 t. All rights reserved.
//

#import "ViewController.h"
#import "GPUImageMultipleExposureFilter.h"

@interface ViewController ()

@property (nonatomic, strong) GPUImagePicture *picture1;
@property (nonatomic, strong) GPUImagePicture *picture2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // multiple exposure 测试
    UIImage *image1 = [UIImage imageNamed:@"1"];
    UIImage *image2 = [UIImage imageNamed:@"2"];
    self.picture1 = [[GPUImagePicture alloc] initWithImage:image1];
    self.picture2 = [[GPUImagePicture alloc] initWithImage:image2];
    
    CGFloat width = CGRectGetWidth([UIScreen mainScreen].bounds);
    GPUImageMultipleExposureFilter *filter = [[GPUImageMultipleExposureFilter alloc] init];
    [filter forceProcessingAtSize:image1.size];
    [self.picture1 addTarget:filter];
    [self.picture2 addTarget:filter];
    
    GPUImageView *resultView = [[GPUImageView alloc] initWithFrame:CGRectMake(10, 30, width - 20, 300)];
    resultView.contentMode = UIViewContentModeScaleAspectFit;
    
    [filter addTarget:resultView];
    [self.view addSubview:resultView];
    
    [self.picture1 processImage];
    [self.picture2 processImage];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
