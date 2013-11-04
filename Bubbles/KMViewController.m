//
//  KMViewController.m
//  Bubbles
//
//  Created by Kelli Mohr on 11/1/13.
//  Copyright (c) 2013 Kelli Mohr. All rights reserved.
//

#import "KMViewController.h"

@interface KMViewController ()

@property (nonatomic, strong) UIDynamicAnimator *animator;

@end

@implementation KMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear: animated];
    
    CGFloat superViewWidth = self.view.frame.size.width;
    CGFloat superViewHeight = self.view.frame.size.height;
    
    UIView *barrier = [[UIView alloc] initWithFrame:CGRectMake(0, superViewHeight * .90, superViewWidth, superViewHeight)];
    
    barrier.backgroundColor = [UIColor greenColor];
    [self.view addSubview:barrier];
    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView: self.view];
    
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems: self.bubbleViews];
    
    [_animator addBehavior: gravityBehavior];
    
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems: self.bubbleViews];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [_animator addBehavior: collisionBehavior];
    
    for (UIView *bubbleView in self.bubbleViews)
    {
        for (int i = 0; i < 5; i++)
        {
            int xPos = arc4random() %300;
            int yPos = arc4random() %500;
            
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(xPos,yPos,50,50)];
            view.alpha = 0.5;
            view.layer.cornerRadius = 25;
            view.backgroundColor = [UIColor blueColor];
            
            [bubbleView addSubview: view];
            [gravityBehavior addItem: view];
            [collisionBehavior addItem: view];
        }
    }
    /*
    for (UIView *subBubbleView in self.subBubbleViews)
    {
        for (int i = 0; i < 5; i++)
        {
            UIView *innerView = [[UIView alloc] initWithFrame:CGRectMake(xPos,yPos,40,40)];
            innerView.alpha = 0.5;
            innerView.layer.cornerRadius = 20;
            innerView.backgroundColor = [UIColor purpleColor];
    
            [subBubbleView addSubview: innerView];
          // [collisionBehavior addSubview: innerView];
        }
    }
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
