//
//  EPSAvatarView.m
//  AvatarTest
//
//  Created by Peter Stuart on 4/20/13.
//  Copyright (c) 2013 Electric Peel, LLC. All rights reserved.
//

#import "EPSAvatarView.h"

#import "NSImage+Extensions.h"

@interface EPSAvatarView ()

@end

@implementation EPSAvatarView

- (id)initWithFrame:(NSRect)frameRect {
	self = [super initWithFrame:frameRect];
	if (self) {
		_blurOffset = 3;
		_blurRadius = 4;
		_circleDiameter = 50;
	}
	
	return self;
}

- (NSEdgeInsets)alignmentRectInsets {
	return NSEdgeInsetsMake(0, self.blurRadius, self.blurOffset + self.blurRadius, self.blurRadius);
}

- (NSSize)intrinsicContentSize {
    return NSMakeSize(self.circleDiameter, self.circleDiameter);
}

- (void)drawRect:(NSRect)dirtyRect {
    CGFloat blurRadius = self.blurRadius;
	NSSize shadowOffset = NSMakeSize(0, -self.blurOffset);
	NSImage *circularImage = [self.image maskedCircularImageWithDiameter:self.circleDiameter];
    
    NSRect rect = NSMakeRect(blurRadius, blurRadius + self.blurOffset, circularImage.size.width, circularImage.size.height);
    
    NSShadow *shadow = [NSShadow new];
    shadow.shadowBlurRadius = blurRadius;
    shadow.shadowOffset = shadowOffset;
    shadow.shadowColor = [NSColor blackColor];
    [shadow set];
    
    [circularImage drawInRect:rect fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0];
}

#pragma mark - Accessors

- (void)setImage:(NSImage *)image {
	_image = image;

	[self setNeedsDisplay:YES];
}

- (void)setCircleDiameter:(CGFloat)circleDiameter {
	_circleDiameter = circleDiameter;
	
    [self setNeedsDisplay:YES];
	[self invalidateIntrinsicContentSize];
}

- (void)setBlurRadius:(CGFloat)blurRadius {
	_blurRadius = blurRadius;
	
    [self setNeedsDisplay:YES];
	[self invalidateIntrinsicContentSize];
}

- (void)setBlurOffset:(CGFloat)blurOffset {
	_blurOffset = blurOffset;
	
    [self setNeedsDisplay:YES];
	[self invalidateIntrinsicContentSize];
}

@end
