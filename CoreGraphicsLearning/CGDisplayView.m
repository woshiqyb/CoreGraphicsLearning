//
//  CGDisplayView.m
//  CoreGraphicsLearning
//
//  Created by qianyb on 15/7/21.
//  Copyright (c) 2015年 qianyb. All rights reserved.
//

#import "CGDisplayView.h"

@implementation CGDisplayView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
//    //不需要翻转坐标系
//    //画一条线
//    CGContextSetStrokeColorWithColor(context, [[UIColor greenColor] CGColor]);
//    CGContextMoveToPoint(context, 0, 0);
//    CGContextAddLineToPoint(context, 100, 100);
//    CGContextStrokePath(context);
//    
//    //写文字
//    UIFont  *font = [UIFont boldSystemFontOfSize:18.0];
//    [@"公司：启明\n部门：启明谐鸿\n姓名：QYB" drawInRect:CGRectMake(100, 100, 200, 100) withAttributes:@{NSFontAttributeName:font}];
//    
//    //画一个红色填充的区域
//    CGContextSetRGBFillColor(context, 1, 0, 0, 1);
//    CGContextFillRect(context, CGRectMake(100, 200, 200, 100));
//    CGContextStrokePath(context);
//    //用画笔画出边框
//    CGContextStrokeRect(context, CGRectMake(100, 200, 200, 100));
//    //在rect里面画圆/椭圆
//    CGContextStrokeEllipseInRect(context, CGRectMake(100, 200, 200, 100));
//    //实心圆
//    CGContextFillEllipseInRect(context, CGRectMake(100, 200, 200, 100));
//    //画圆
//    CGContextMoveToPoint(context, 100, 300);
//    CGContextAddArcToPoint(context, 50, 300, 50, 350, 50);
//    CGContextStrokePath(context);
    
    //弧线的是通过指定两个切点，还有角度，调用CGContextAddArcToPoint()绘制
//    CGContextSetLineWidth(context, 2.0);
//    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
//    CGContextMoveToPoint(context, 100, 100);
//    CGContextAddArcToPoint(context, 100,200, 300,200, 100);
//    CGContextStrokePath(context);
    
     //绘制贝兹曲线
     //贝兹曲线是通过移动一个起始点，然后通过两个控制点,还有一个中止点，调用CGContextAddCurveToPoint() 函数绘制
//    CGContextSetLineWidth(context, 2.0);
//     
//    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
//     
//    CGContextMoveToPoint(context, 10, 10);
//     
//    CGContextAddCurveToPoint(context, 0, 50, 300, 250, 300, 400);
//     
//    CGContextStrokePath(context);
    
    //绘制二次贝兹曲线
//    CGContextSetLineWidth(context, 2.0);
// 
//    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
// 
//    CGContextMoveToPoint(context, 10, 200);
// 
//    CGContextAddQuadCurveToPoint(context, 150, 10, 300, 200);
// 
//    CGContextStrokePath(context);
    
    //绘制虚线
//    CGContextSetLineWidth(context, 5.0);
//     
//    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
//    //实线虚线相间 实宽(2)虚宽(6)实宽(4)虚宽(2)
//    CGFloat dashArray[] = {2,6,4,2};
//     
//    CGContextSetLineDash(context, 3, dashArray, 4);//跳过3个再画虚线，所以刚开始有6-（3-2）=5个虚点
//     
//    CGContextMoveToPoint(context, 10, 200);
//     
//    CGContextAddQuadCurveToPoint(context, 150, 10, 300, 200);
//     
//    CGContextStrokePath(context);
    
    //绘制图片1
//     NSString* imagePath = [[NSBundle mainBundle] pathForResource:@"dog" ofType:@"jpg"];
//     UIImage* myImageObj = [[UIImage alloc] initWithContentsOfFile:imagePath];
//     [myImageObj drawInRect:CGRectMake((CGRectGetWidth([[UIScreen mainScreen] bounds]) - 320)/2, 60, 320, 320*myImageObj.size.height/myImageObj.size.width)];
//     
//     NSString *s = @"我的小狗";
//     
//    [s drawAtPoint:CGPointMake(100, 0) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:34.0]}];
    
    //绘制图片2,这种绘图方式需要旋转，否则显示出来的是倒着的
    NSString *path = [[NSBundle mainBundle] pathForResource:@"dog" ofType:@"jpg"];
    UIImage *img = [UIImage imageWithContentsOfFile:path];
    CGImageRef image = img.CGImage;
    
    CGContextSaveGState(context);
    
    //先移动后缩放使得Y坐标反向
    CGContextTranslateCTM(context, 0, img.size.height/3);
    CGContextScaleCTM(context, 1, -1);
//    //或者先缩放使得Y坐标反向，此时移动其实是相对Y负方向的了
//    CGContextScaleCTM(context, 1, -1);
//    CGContextTranslateCTM(context, 0, -img.size.height/3);
//    //或者先构造好变换矩阵，一次性变换
//    CGAffineTransform myAffine = CGAffineTransformMakeScale(1, -1);
//    myAffine = CGAffineTransformTranslate(myAffine, 0, -img.size.height/3);
//    CGContextConcatCTM(context, myAffine);
    
    CGRect touchRect = CGRectMake(0, 0, img.size.width/3, img.size.height/3);
    CGContextDrawImage(context, touchRect, image);
    CGContextRestoreGState(context);
    
    //画渐变色
//    CGContextClip(context);
//    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
//    CGFloat colors[] =
//    {
//        204.0 / 255.0, 224.0 / 255.0, 244.0 / 255.0, 1.00,
//        29.0 / 255.0, 156.0 / 255.0, 215.0 / 255.0, 1.00,
//        0.0 / 255.0,  50.0 / 255.0, 126.0 / 255.0, 1.00,
//    };
//    CGGradientRef gradient = CGGradientCreateWithColorComponents
//    (rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));
//    CGColorSpaceRelease(rgb);
//    CGContextDrawLinearGradient(context, gradient,CGPointMake
//                                (0.0,0.0) ,CGPointMake(0.0,self.frame.size.height),
//                                kCGGradientDrawsBeforeStartLocation);
    
    
}

@end
