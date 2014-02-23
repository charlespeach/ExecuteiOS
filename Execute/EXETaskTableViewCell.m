 //
//  EXETaskTableViewCell.m
//  Execute
//
//  Created by Charles Peach on 23/02/14.
//  Copyright (c) 2014 cub3y. All rights reserved.
//

#import "EXETaskTableViewCell.h"

@implementation EXETaskTableViewCell

@synthesize task = _task;
@synthesize completed = _completed;
@synthesize editGestureRecognizer = _editGestureRecognizer;


- (void)setTask:(NSString *)task {
    _task = task;
    self.textLabel.text = task;
}


- (void)setCompleted:(BOOL)completed {
    _completed = completed;
    
    if (_completed) {
        self.textLabel.textColor = [UIColor lightGrayColor];
    } else {
        self.textLabel.textColor = [UIColor blackColor];
    }
}


- (UITapGestureRecognizer *)editGestureRecognizer {
    if (_editGestureRecognizer == nil) {
        _editGestureRecognizer = [[UITapGestureRecognizer alloc] init];
        _editGestureRecognizer.delegate = self;
        [self addGestureRecognizer:_editGestureRecognizer];
    }
    return _editGestureRecognizer;
}


- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    
    self.editGestureRecognizer.enabled = editing;
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    CGPoint point = [touch locationInView:self];
    return CGRectContainsPoint(self.contentView.frame, point);
}


@end
