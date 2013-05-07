//
//  EPSAppDelegate.m
//  Auto Layout Example
//
//  Created by Peter Stuart on 5/7/13.
//  Copyright (c) 2013 Electric Peel, LLC. All rights reserved.
//

#import "EPSAppDelegate.h"

#import "EPSAvatarView.h"

@implementation EPSAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	EPSAvatarView *avatarView = [EPSAvatarView new];
	avatarView.translatesAutoresizingMaskIntoConstraints = NO;
	avatarView.image = [NSImage imageNamed:@"avatar.jpg"];
	avatarView.circleDiameter = 80;
    [avatarView setContentHuggingPriority:NSLayoutPriorityRequired forOrientation:NSLayoutConstraintOrientationVertical];
    
	[self.window.contentView addSubview:avatarView];
	
    NSTextField *optionalTextField = [NSTextField new];
    optionalTextField.stringValue = @"This is an optional text field";
    [optionalTextField setBezeled:NO];
    [optionalTextField setDrawsBackground:YES];
    [optionalTextField setEditable:NO];
    [optionalTextField setSelectable:NO];
    [[optionalTextField cell] setLineBreakMode:NSLineBreakByTruncatingTail];
    optionalTextField.translatesAutoresizingMaskIntoConstraints = NO;
    
    [optionalTextField setContentCompressionResistancePriority:NSLayoutPriorityDefaultLow forOrientation:NSLayoutConstraintOrientationHorizontal];
    
    [self.window.contentView addSubview:optionalTextField];
    
    NSTextField *requiredTextField = [NSTextField new];
    requiredTextField.stringValue = @"Required";
    [requiredTextField setBezeled:NO];
    [requiredTextField setDrawsBackground:YES];
    [requiredTextField setEditable:NO];
    [requiredTextField setSelectable:NO];
    requiredTextField.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.window.contentView addSubview:requiredTextField];
    
	NSDictionary *views = NSDictionaryOfVariableBindings(avatarView, optionalTextField, requiredTextField);
	
	[self.window.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[avatarView]-[optionalTextField]-(>=20)-[requiredTextField]-|" options:NSLayoutFormatAlignAllBottom metrics:nil views:views]];
	[self.window.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[avatarView]-|" options:0 metrics:nil views:views]];
}

@end
