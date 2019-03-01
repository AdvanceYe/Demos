//
//  ViewController.m
//  demo6
//
//  Created by yeye(* ￣＾￣) on 2019/2/4.
//  Copyright © 2019年 com.test. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

//#define WIDTH 100
//#define HEIGHT 100
//#define DEPTH 10
//#define SIZE 100
//#define SPACING 150
//#define CAMERA_DISTANCE 500

#define WIDTH 100
#define HEIGHT 100
#define DEPTH 10
#define SIZE 100
#define SPACING 150
#define CAMERA_DISTANCE 500
#define PERSPECTIVE(z) (float)CAMERA_DISTANCE/(z + CAMERA_DISTANCE)

@interface ViewController ()<UIScrollViewDelegate>

//@property (weak, nonatomic) IBOutlet UIView *layerView;

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIImageView *view1 = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
//    view1.image = [UIImage imageNamed:@"Img1.jpeg"];
//    [self.view addSubview:view1];
//
//    //create shape layer
//    CAShapeLayer *blueLayer = [CAShapeLayer layer];
//    blueLayer.path = [UIBezierPath bezierPathWithRoundedRect:view1.bounds cornerRadius:20].CGPath;
//    view1.layer.mask = blueLayer;
    
    
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.scrollView];
    self.scrollView.delegate = self;
//
//    //set content size
//    self.scrollView.contentSize = CGSizeMake((WIDTH - 1)*SPACING, (HEIGHT - 1)*SPACING);
//
//    //set up perspective transform
//    CATransform3D transform = CATransform3DIdentity;
//    transform.m34 = -1.0 / CAMERA_DISTANCE;
//    self.scrollView.layer.sublayerTransform = transform;
//
//    //create layers
//    for (int z = DEPTH - 1; z >= 0; z--) {
//        for (int y = 0; y < HEIGHT; y++) {
//            for (int x = 0; x < WIDTH; x++) {
//                //create layer
//                CALayer *layer = [CALayer layer];
//                layer.frame = CGRectMake(0, 0, SIZE, SIZE);
//                layer.position = CGPointMake(x*SPACING, y*SPACING);
//                layer.zPosition = -z*SPACING;
//                //set background color
//                layer.backgroundColor = [UIColor colorWithWhite:1-z*(1.0/DEPTH) alpha:1].CGColor;
//                //attach to scroll view
//                [self.scrollView.layer addSublayer:layer];
//            }
//        }
//    }
//
//    //log
//    NSLog(@"displayed: %i", DEPTH*HEIGHT*WIDTH);
    
    self.scrollView.contentSize = CGSizeMake((WIDTH - 1)*SPACING, (HEIGHT - 1)*SPACING);
    //set up perspective transform
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1.0 / CAMERA_DISTANCE;
    self.scrollView.layer.sublayerTransform = transform;
}

- (void)viewDidLayoutSubviews
{
    [self updateLayers];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self updateLayers];
}

- (void)updateLayers
{
    //calculate clipping bounds
    CGRect bounds = self.scrollView.bounds;
    bounds.origin = self.scrollView.contentOffset;
    bounds = CGRectInset(bounds, -SIZE/2, -SIZE/2);
    //create layers
    NSMutableArray *visibleLayers = [NSMutableArray array];
    for (int z = DEPTH - 1; z >= 0; z--)
    {
        //increase bounds size to compensate for perspective
        CGRect adjusted = bounds;
        adjusted.size.width /= PERSPECTIVE(z*SPACING);
        adjusted.size.height /= PERSPECTIVE(z*SPACING);
        adjusted.origin.x -= (adjusted.size.width - bounds.size.width) / 2;
        adjusted.origin.y -= (adjusted.size.height - bounds.size.height) / 2;
        for (int y = 0; y < HEIGHT; y++) {
            //check if vertically outside visible rect
            if (y*SPACING < adjusted.origin.y || y*SPACING >= adjusted.origin.y + adjusted.size.height)
            {
                continue;
            }
            for (int x = 0; x < WIDTH; x++) {
                //check if horizontally outside visible rect
                if (x*SPACING < adjusted.origin.x ||x*SPACING >= adjusted.origin.x + adjusted.size.width)
                {
                    continue;
                }
            
                //create layer
                CALayer *layer = [CALayer layer];
                layer.frame = CGRectMake(0, 0, SIZE, SIZE);
                layer.position = CGPointMake(x*SPACING, y*SPACING);
                layer.zPosition = -z*SPACING;
                //set background color
                layer.backgroundColor = [UIColor colorWithWhite:1-z*(1.0/DEPTH) alpha:1].CGColor;
                //attach to scroll view
                [visibleLayers addObject:layer];
            }
        }
    }
    //update layers
    self.scrollView.layer.sublayers = visibleLayers;
    //log
    NSLog(@"displayed: %i/%i", [visibleLayers count], DEPTH*HEIGHT*WIDTH);
}

@end
