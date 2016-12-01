//
//  ViewController.m
//  DKPullDowntoEnlargeThePicture
//
//  Created by devzkn on 01/12/2016.
//  Copyright © 2016 DevKevin. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Extension.h"


const CGFloat DKimageViewH=300;
//#define DKimageViewH 300

@interface ViewController ()

@property (nonatomic,weak) UIImageView *imageView;

@end

@implementation ViewController

- (UIImageView *)imageView{
    if (nil == _imageView) {
        UIImageView *tmpView = [[UIImageView alloc]init];
        _imageView = tmpView;
        tmpView.contentMode = UIViewContentModeScaleAspectFill;
        [self.tableView insertSubview:_imageView atIndex:0];
    }
    return _imageView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat H = DKimageViewH;
    self.imageView.frame = CGRectMake(0, -1*H, [UIScreen mainScreen].bounds.size.width, H);
    [self.imageView setImage:[UIImage imageNamed:@"test"]];
    
    self.tableView.contentInset = UIEdgeInsetsMake(0.5*H, 0, 0, 0);;
    
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   static  NSString *identifier = @"UITableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据%ld",(long)indexPath.row];
    
    
    
    return cell;
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat pullDownH = -(scrollView.contentOffset.y+(DKimageViewH*0.5));
    NSLog(@" 下拉的高度 %f",pullDownH);
    if (pullDownH<=0) {
        return;
    }
    self.imageView.height = pullDownH+ (1.0 *DKimageViewH);
}



@end
