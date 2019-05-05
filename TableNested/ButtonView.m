//
//  ButtonView.m
//  TableNested
//
//  Created by 纵昂 on 2019/5/5.
//  Copyright © 2019 纵昂. All rights reserved.
//

#import "ButtonView.h"
@interface ButtonView()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation ButtonView
-(instancetype)initWithFrame:(CGRect)frame titleArr:(NSArray *)titleArr
{
    
    if (self=[super initWithFrame:frame]) {
        self.titleArr = titleArr;
        [self creatScrollview];
        [self creatTableview];
        
        
    }
    
    return self;
    
}

-(void)creatScrollview
{
    NSInteger index = _selected ;
    NSInteger titleNum = self.titleArr.count;
    UIView * topView = [[UIView alloc]initWithFrame:CGRectMake(0, NAVGATION_BAR_HEIGHT, SCREEN_WIDTH, 50)];
    [self addSubview:topView];
    for (int i=0; i<self.titleArr.count; i++) {
        UIButton*btn=[[UIButton alloc] initWithFrame:CGRectMake(i*SCREEN_WIDTH/titleNum, 0, SCREEN_WIDTH/titleNum, 40)];
        
        btn.tag=i+1;
        [btn setTitle:self.titleArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:RGBColor(228, 52, 61) forState:UIControlStateSelected];
        btn.titleLabel.font=[UIFont boldSystemFontOfSize:17];
        [btn addTarget:self action:@selector(btn_clicked:) forControlEvents:UIControlEventTouchUpInside];
        [topView addSubview:btn];
        if (i == index) {
            if (btn.selected==NO) {
                btn.selected=YES;
                _lastBtn=btn;
                
            }
            // 获取第一个button的标题
            NSString * title = self.titleArr[i];
            // 根据字符串计算size
            UIFont * font = [UIFont systemFontOfSize:17.f];
            CGSize size = [title sizeWithFont:font];
            _lineView = [[UIView alloc]init];
            _lineView.backgroundColor = RGBColor(228, 52, 61);
            _lineView.center = CGPointMake(btn.center.x, btn.center.y+29);
            _lineView.bounds = CGRectMake(0, 0, SCREEN_WIDTH/titleNum, 2);
            [topView addSubview:_lineView];
        }
        
    }
    
    
    
    _scroview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, NAVGATION_BAR_HEIGHT+50, SCREEN_WIDTH, SCREEN_HEIGHT-NAVGATION_BAR_HEIGHT-50)];
    [_scroview setContentOffset:CGPointMake(SCREEN_WIDTH*index, 0)];
    _scroview.showsHorizontalScrollIndicator=NO;
    _scroview.showsVerticalScrollIndicator=NO;
    _scroview.scrollEnabled=NO;
    _scroview.contentSize=CGSizeMake(SCREEN_WIDTH*titleNum,SCREEN_HEIGHT);
    [self addSubview:_scroview];
    
}
-(void)creatTableview
{
    for (int i = 0; i < self.titleArr.count; i++) {
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, CGRectGetHeight(_scroview.frame)) style:UITableViewStyleGrouped] ;
        tableView.delegate = self;
        tableView.dataSource = self;
        
        tableView.tag = i +1;
        
        [self.scroview addSubview:tableView];
        
        tableView.estimatedRowHeight = 0;
        tableView.estimatedSectionFooterHeight =0;
        tableView.estimatedSectionHeaderHeight = 0;
        
        
    }
    
    
}

#pragma mark--按钮点击事件
-(void)btn_clicked:(UIButton*)btn
{
    _lastBtn.selected=NO;
    btn.selected=!btn.selected;
    
    _lastBtn= btn;
    
    NSString * titleStr = btn.titleLabel.text;
    // 根据title计算大小
    UIFont * font = [UIFont systemFontOfSize:17];
    CGSize size = [titleStr sizeWithFont:font];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0];
    
    _lineView.center = CGPointMake(btn.center.x, btn.center.y+29);
    _lineView.bounds = CGRectMake(0, 0, SCREEN_WIDTH/self.titleArr.count, 2);
    [UIView commitAnimations];
    
    [_scroview setContentOffset:CGPointMake(SCREEN_WIDTH*(self.titleArr.count-1), 0) animated:NO];
    if ([self.delegate respondsToSelector:@selector(selectBtnWithTag:)]) {
        [_delegate selectBtnWithTag:btn];
    }
    
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 10;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.backgroundColor =[UIColor clearColor];
    return cell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
