//
//  ViewController.m
//  TableNested
//
//  Created by 纵昂 on 2019/5/5.
//  Copyright © 2019 纵昂. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<ButtonViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray * titleArr=@[@"全部",@"待付款",@"待发货",@"待收货",@"待评价"];
    
    ButtonView * buttonview = [[ButtonView alloc]initWithFrame:self.view.frame titleArr:titleArr];
    buttonview.delegate=self;
    [self.view addSubview:buttonview];
}

#pragma mark---ButtonViewDelegate
-(void)selectBtnWithTag:(UIButton *)sender
{
    
    switch (sender.tag) {
        case 1:
            NSLog(@"第一个");
            break;
        case 2:
            NSLog(@"第二个");
            break;
        case 3:
            NSLog(@"第三个");
            break;
        case 4:
            NSLog(@"第四个");
            break;
            
        default:
            NSLog(@"第五个");
            
            break;
    }
    
    
    
}



@end
