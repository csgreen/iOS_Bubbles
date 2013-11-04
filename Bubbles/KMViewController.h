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
//@property (nonatomic, strong) IBOutletCollection(UIView) NSArray *subBubbleViews;

@end
