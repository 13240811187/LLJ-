//
//  ViewController.m
//  实验
//
//  Created by 优站创意 on 2018/6/11.
//  Copyright © 2018年 优站创意. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "ZXCycleScrollView.h"
#define KScreenWidth self.view.frame.size.width
#define KScreenHeight self.view.frame.size.height

@interface ViewController ()<ZXCycleScrollViewDelegate>
@property (nonatomic,strong) ZXCycleScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _scrollView = [ZXCycleScrollView  initWithFrame:CGRectMake(0,0, KScreenWidth,200) withMargnPadding:10 withImgWidth:KScreenWidth - 40 dataArray:@[@"http://d.hiphotos.baidu.com/image/pic/item/b7fd5266d016092408d4a5d1dd0735fae7cd3402.jpg"]] ;
    _scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    
    self.scrollView.otherPageControlColor = [UIColor blueColor];
    self.scrollView.curPageControlColor = [UIColor whiteColor];
    
    self.scrollView.sourceDataArr = @[@"https://manhua.qpic.cn/operation/0/11_11_22_c4de3602c8aff83100c018fce9f52d5c_1528687357296.jpg/0",@"https://manhua.qpic.cn/operation/0/31_22_55_30aa7716ea9fd9abd139b10909d29d6e_1522508127196.jpg/0",@"https://manhua.qpic.cn/operation/0/11_11_23_18a1debf5a249a4eeda00006ac467d01_1528687408905.jpg/0",@"https://manhua.qpic.cn/operation/0/03_09_42_08ae84d5bd144070a8d5081062eb86b8_1525311724240.jpg/0",@"https://manhua.qpic.cn/operation/0/11_11_23_2a169d0cbfff4864a8888da7c378627e_1528687424498.jpg/0"];
    
   
    self.scrollView.autoScroll = YES;
    //    self.scrollView.showPageControl = NO;
    
    
    

//    UIView * read = [[UIView alloc] initWithFrame:CGRectMake(0, 200,self.view.frame.size.width,self.view.frame.size.height-200)];
//
//    read.backgroundColor = [UIColor redColor];
//
//    [self.view addSubview:read];
//
    
    /**
     * byRoundingCorners :设置指定的角
     *
     * UIRectCornerTopLeft
     * UIRectCornerTopRight
     * UIRectCornerBottomLeft
     * UIRectCornerBottomRight
     * UIRectCornerAllCorners
     */
//    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:image.bounds
//                                                   byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight
//                                                         cornerRadii:CGSizeMake(image.bounds.size.width/2-80, image.bounds.size.width/2-80)];
//    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//    maskLayer.frame = image.bounds;
//    maskLayer.path = maskPath.CGPath;
//    image.layer.mask = maskLayer;

    
    
    
    
    
    
    [self gl_drawThreeBezier];
    
   // [self fiveAnimation];
    //[self createCurvedLine];
    
    
    
    
   


}

#pragma mark -- ZXCycleScrollViewDelegate
-(void)zxCycleScrollView:(ZXCycleScrollView *)scrollView didScrollToIndex:(NSInteger)index {
    NSLog(@"index------%lu",index);
}

-(void)zxCycleScrollView:(ZXCycleScrollView *)scrollView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"点击了----index------%lu",index);
}

//画一个弧线
-(void)createCurvedLine
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0,200, self.view.frame.size.width,100)];
    
    
    
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = 5.0;
    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    [aPath moveToPoint:CGPointMake(0, 160)];
    [aPath addQuadCurveToPoint:CGPointMake(self.view.frame.size.width, 160) controlPoint:CGPointMake(200, 280)];
    
    CAShapeLayer * CurvedLineLayer=[CAShapeLayer layer];
    CurvedLineLayer.path=aPath.CGPath;
    [self.view.layer addSublayer:CurvedLineLayer];
}


//画一个五边形
-(void)fiveAnimation
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    //开始点 从上左下右的点
    [aPath moveToPoint:CGPointMake(0,200)];
    //划线点
    [aPath addLineToPoint:CGPointMake(0,500)];
    [aPath addLineToPoint:CGPointMake(60, 240)];
    [aPath addLineToPoint:CGPointMake(160, 240)];
    [aPath addLineToPoint:CGPointMake(160, 140)];
    [aPath closePath];
//    //设置定点是个5*5的小圆形（自己加的）
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100-5/2.0, 0, 5, 5)];
//    [aPath appendPath:path];
    
    CAShapeLayer *shapelayer = [CAShapeLayer layer];
    //设置边框颜色
    shapelayer.strokeColor = [[UIColor redColor]CGColor];
    //设置填充颜色 如果只要边 可以把里面设置成[UIColor ClearColor]
    shapelayer.fillColor = [[UIColor blueColor]CGColor];
    //就是这句话在关联彼此（UIBezierPath和CAShapeLayer）：
    shapelayer.path = aPath.CGPath;
    [self.view.layer addSublayer:shapelayer];
    
    
}


- (void)gl_drawThreeBezier
{
    
    
//    UIView * bgread = [[UIView alloc] initWithFrame:CGRectMake(0, 200,self.view.frame.size.width,self.view.frame.size.height-200)];
//
//    bgread.backgroundColor = [UIColor whiteColor];
//    //read.opaque =NO;
//    [self.view addSubview:bgread];
//

    UIView * read = [[UIView alloc] initWithFrame:CGRectMake(0, 150,self.view.frame.size.width,self.view.frame.size.height-150)];

        read.backgroundColor = [UIColor clearColor];
         //read.opaque =NO;
        [self.view addSubview:read];
    
    
    
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame =  CGRectMake(0, 0, self.view.frame.size.width, read.frame.size.height);
   // maskLayer.backgroundColor = [UIColor yellowColor].CGColor;
//    maskLayer.borderWidth = 5;
     // maskLayer.borderColor = [UIColor redColor].CGColor;
    //maskLayer.strokeColor = [UIColor redColor].CGColor;
    maskLayer.fillColor = [UIColor whiteColor].CGColor;
    UIBezierPath *path = [UIBezierPath bezierPath];
    //path.lineCapStyle = kCGLineCapRound; //线条拐角
    //path.lineJoinStyle = kCGLineJoinRound; //终点处理
    
    //起点坐标
    [path moveToPoint:CGPointMake(0, 0)];
    
    //下面三个点分别为 终点坐标  控制坐标1 控制坐标2
    [path addQuadCurveToPoint:CGPointMake(self.view.frame.size.width, 0) controlPoint:CGPointMake(self.view.frame.size.width/2, 50)];
    
    
    [path addLineToPoint:CGPointMake(self.view.frame.size.width,read.frame.size.height)];
    
    
    [path addLineToPoint:CGPointMake(0, read.frame.size.height)];
    
  
    
    
   
    
//    [path addCurveToPoint:CGPointMake(self.view.frame.size.width, 0) controlPoint1:<#(CGPoint)#> controlPoint2:<#(CGPoint)#>]
//
    
    
//    [path stroke];

    maskLayer.path = path.CGPath;
    [read.layer addSublayer:maskLayer];
    
    
    
//    UIBezierPath *path2 = [UIBezierPath bezierPath];
//    //起点坐标
//    [path2 moveToPoint:CGPointMake(0, 0)];
//    [path2 addQuadCurveToPoint:CGPointMake(self.view.frame.size.width, 0) controlPoint:CGPointMake(self.view.frame.size.width/2, 80)];
//
//
//    CAShapeLayer *shapelayer = [[CAShapeLayer alloc] init];
//    maskLayer.frame =  CGRectMake(0, 0, self.view.frame.size.width, read.frame.size.height);
//    //设置边框颜色
//    //shapelayer.strokeColor = [[UIColor redColor]CGColor];
//    //设置填充颜色 如果只要边 可以把里面设置成[UIColor ClearColor]
//    shapelayer.fillColor = [[UIColor clearColor]CGColor];
//    //就是这句话在关联彼此（UIBezierPath和CAShapeLayer）：
//    shapelayer.path = path2.CGPath;
//    [read.layer addSublayer:shapelayer];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
