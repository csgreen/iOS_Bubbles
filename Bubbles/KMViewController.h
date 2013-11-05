//
//  KMViewController.h
//  Bubbles
//
//  Created by Kelli Mohr on 11/1/13.
//  Copyright (c) 2013 Kelli Mohr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KMViewController : UIViewController

@property (nonatomic, strong) IBOutletCollection(UIView) NSArray *bubbleViews;

@property (nonatomic, strong) IBOutlet UIView *blueBubble;
@property (nonatomic, strong) IBOutlet UIView *redBubble;
@property (nonatomic, strong) IBOutlet UIView *yellowBubble;
@property (nonatomic, strong) IBOutlet UIView *greenBubble;
@property (nonatomic, strong) IBOutlet UIView *purpleBubble;

@property (nonatomic, strong) IBOutlet UIView *blueBubbleSmall;
@property (nonatomic, strong) IBOutlet UIView *redBubbleSmall;
@property (nonatomic, strong) IBOutlet UIView *yellowBubbleSmall;
@property (nonatomic, strong) IBOutlet UIView *greenBubbleSmall;
@property (nonatomic, strong) IBOutlet UIView *purpleBubbleSmall;

@property (nonatomic, strong) IBOutlet UIView *bigBubble;

@property (strong, nonatomic) IBOutlet UIView *barrier;

@end
