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
    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView: self.view];
    
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems: self.bubbleViews];
    
    CGVector gravityDirection = {0.0, -1.0};
    [gravityBehavior setGravityDirection:gravityDirection];
    
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
            
            UIView *bubble = [[UIView alloc] initWithFrame:CGRectMake(xPos,yPos,50,50)];
            bubble.alpha = 0.5;
            bubble.layer.cornerRadius = 25;
            bubble.backgroundColor = [UIColor blueColor];
            
            UIView *innerView = [[UIView alloc] initWithFrame:CGRectMake(xPos,yPos,10,10)];
            innerView.alpha = 0.5;
            innerView.layer.cornerRadius = 5;
            innerView.backgroundColor = [UIColor redColor];
            
            [bubbleView addSubview: bubble];
            [gravityBehavior addItem: bubble];
            [collisionBehavior addItem: bubble];
            
            [bubble addSubview: innerView];
            [gravityBehavior addItem: innerView];
            [collisionBehavior addItem: innerView];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
