//
//  UpView.m
//  SwipeWithTouchesEvent
//
//  Created by 양 원석 on 2013. 7. 25..
//  Copyright (c) 2013년 양 원석. All rights reserved.
//

#import "UpView.h"

@interface UpView()

@property (assign, nonatomic) CGFloat deltaX;

@end

@implementation UpView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
	CGPoint location = [touch locationInView:self.superview];
	_deltaX = location.x;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{

    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.superview];
    CGFloat deltaX = location.x+self.frame.origin.x-_deltaX;

    if (deltaX<0) deltaX =0;
    if (deltaX>200) deltaX = 200;
    
    [self setTransform:CGAffineTransformTranslate(CGAffineTransformIdentity, deltaX, 0.0)];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    _deltaX = 0;
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
