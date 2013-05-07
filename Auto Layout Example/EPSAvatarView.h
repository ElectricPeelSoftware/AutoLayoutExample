//
//  EPSAvatarView.h
//  AvatarTest
//
//  Created by Peter Stuart on 4/20/13.
//  Copyright (c) 2013 Electric Peel, LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface EPSAvatarView : NSView

@property (nonatomic) NSImage *image;
@property (nonatomic) CGFloat circleDiameter; // Defaults to 50
@property (nonatomic) CGFloat blurRadius; // Defaults to 4
@property (nonatomic) CGFloat blurOffset; // Defaults to 3

@end
