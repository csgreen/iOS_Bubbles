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

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear: animated];
    
    [self becomeFirstResponder];
    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView: self.view];
    
    _blueBubble = [[UIView alloc] initWithFrame:CGRectMake(200,300,50,50)];
    _blueBubble.alpha = 0.5;
    _blueBubble.layer.cornerRadius = 25;
    _blueBubble.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_blueBubble];
    
    _purpleBubble = [[UIView alloc] initWithFrame:CGRectMake(200,400,50,50)];
    _purpleBubble.alpha = 0.5;
    _purpleBubble.layer.cornerRadius = 25;
    _purpleBubble.backgroundColor = [UIColor purpleColor];
    _purpleBubble.layer.shadowColor = [[UIColor blackColor] CGColor];
    _purpleBubble.layer.shadowOpacity = 1.0f;
    _purpleBubble.layer.shadowRadius = 8.0f;
    [self.view addSubview:_purpleBubble];
    
    _yellowBubble = [[UIView alloc] initWithFrame:CGRectMake(50,400,50,50)];
    _yellowBubble.alpha = 0.5;
    _yellowBubble.layer.cornerRadius = 25;
    _yellowBubble.backgroundColor = [UIColor yellowColor];
    _yellowBubble.layer.shadowColor = [[UIColor purpleColor] CGColor];
    _yellowBubble.layer.shadowOpacity = 1.0f;
    _yellowBubble.layer.shadowRadius = 8.0f;
    [self.view addSubview:_yellowBubble];
    
    _redBubble = [[UIView alloc] initWithFrame:CGRectMake(75,450,50,50)];
    _redBubble.alpha = 0.5;
    _redBubble.layer.cornerRadius = 25;
    _redBubble.backgroundColor = [UIColor redColor];
    _redBubble.layer.shadowColor = [[UIColor greenColor] CGColor];
    _redBubble.layer.shadowOpacity = 1.0f;
    _redBubble.layer.shadowRadius = 8.0f;
    [self.view addSubview:_redBubble];
    
    _greenBubble = [[UIView alloc] initWithFrame:CGRectMake(175,450,50,50)];
    _greenBubble.alpha = 0.5;
    _greenBubble.layer.cornerRadius = 25;
    _greenBubble.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_greenBubble];
    
    _greenBubbleSmall = [[UIView alloc] initWithFrame:CGRectMake(25,25,10,10)];
    _greenBubbleSmall.alpha = 0.5;
    _greenBubbleSmall.layer.cornerRadius = 5;
    _greenBubbleSmall.backgroundColor = [UIColor greenColor];
    [_yellowBubble addSubview:_greenBubbleSmall];
    
    _redBubbleSmall = [[UIView alloc] initWithFrame:CGRectMake(25,25,10,10)];
    _redBubbleSmall.alpha = 0.5;
    _redBubbleSmall.layer.cornerRadius = 5;
    _redBubbleSmall.backgroundColor = [UIColor redColor];
    [_blueBubble addSubview:_redBubbleSmall];
    
    _blueBubbleSmall = [[UIView alloc] initWithFrame:CGRectMake(25,25,10,10)];
    _blueBubbleSmall.alpha = 0.5;
    _blueBubbleSmall.layer.cornerRadius = 5;
    _blueBubbleSmall.backgroundColor = [UIColor blueColor];
    [_redBubble addSubview:_blueBubbleSmall];
    
    _greenBubbleSmall = [[UIView alloc] initWithFrame:CGRectMake(25,25,10,10)];
    _greenBubbleSmall.alpha = 0.5;
    _greenBubbleSmall.layer.cornerRadius = 5;
    _greenBubbleSmall.backgroundColor = [UIColor greenColor];
    [_purpleBubble addSubview:_greenBubbleSmall];
    
    _purpleBubbleSmall = [[UIView alloc] initWithFrame:CGRectMake(25,25,10,10)];
    _purpleBubbleSmall.alpha = 0.5;
    _purpleBubbleSmall.layer.cornerRadius = 5;
    _purpleBubbleSmall.backgroundColor = [UIColor purpleColor];
    [_greenBubble addSubview:_purpleBubbleSmall];
    
   // UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems: self.bubbleViews];
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems: @[_blueBubble, _purpleBubble, _yellowBubble, _redBubble, _greenBubble]];
    
    CGVector gravityDirection = {0.0, -1.0};
    [gravityBehavior setGravityDirection:gravityDirection];
    
    [_animator addBehavior: gravityBehavior];
    
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems: @[_blueBubble, _purpleBubble, _yellowBubble, _redBubble, _greenBubble]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    
    
    [_animator addBehavior: collisionBehavior];
    
    /*
    for (UIView *bubbleView in self.bubbleViews)
    {
        for (int i = 0; i < 5; i++)
        {
            int xPos = arc4random() %100;
            int yPos = arc4random() %700;
            
            UIView *bubble = [[UIView alloc] initWithFrame:CGRectMake(xPos,yPos,50,50)];
            bubble.alpha = 0.5;
            bubble.layer.cornerRadius = 25;
            bubble.backgroundColor = [UIColor blueColor];
            
            UIView *innerView = [[UIView alloc] initWithFrame:CGRectMake(xPos,yPos,10,10)];
            innerView.alpha = 0.5;
            innerView.layer.cornerRadius = 5;
            innerView.backgroundColor = [UIColor redColor];
            
            [self.view addSubview: bubble];
            [gravityBehavior addItem: bubble];
            [collisionBehavior addItem: bubble];
            
            [bubbleView addSubview: innerView];
            [gravityBehavior addItem: innerView];
            [collisionBehavior addItem: innerView];
        }
    }
     */
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    
    if (motion == UIEventSubtypeMotionShake) {
        NSLog(@"shake");
        
        
        _bigBubble = [[UIView alloc] initWithFrame:CGRectMake(100,150,150,150)];
        _bigBubble.alpha = 0.5;
        _bigBubble.layer.cornerRadius = 75;
        _bigBubble.backgroundColor = [UIColor cyanColor];
        _bigBubble.layer.shadowColor = [[UIColor blackColor] CGColor];
        _bigBubble.layer.shadowOpacity = 1.0f;
        _bigBubble.layer.shadowRadius = 8.0f;
        [self.view addSubview:_bigBubble];
    }
    
}

- (void)viewWillDisappear:(BOOL)animated {
	[self resignFirstResponder];
	[super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
