#import <QuartzCore/QuartzCore.h>
#import "RANudgableView.h"

@interface RANudgableLayer : CALayer
@property (nonatomic, readwrite, strong) id nudge;
@end

@implementation RANudgableLayer

- (void) setNudge:(id)datum {
	if (self == [self modelLayer]) {
		[self.delegate nudge];
	}
}

+ (BOOL)needsDisplayForKey:(NSString *)key {
	if ([key isEqualToString:@"nudge"]) {
		return YES;
	}
	return [super needsDisplayForKey:key];
}

@end

@implementation RANudgableView

+ (Class) layerClass {
	return [RANudgableLayer class];
}

- (id<CAAction>) actionForLayer:(CALayer *)layer forKey:(NSString *)event {

	id<CAAction> action = [super actionForLayer:layer forKey:event];
	
	if (![event isEqualToString:@"bounds"])
		return action;
	
	if (![(id)action isKindOfClass:[CAAnimation class]])
		return action;
			
	CAAnimation *animation = (CAAnimation *)action;
	
	CABasicAnimation *nudgeAnimation = [CABasicAnimation animationWithKeyPath:@"nudge"];
	nudgeAnimation.fromValue = @(0.0f);
	nudgeAnimation.toValue = @(1.0f);
	nudgeAnimation.fillMode = animation.fillMode;
	nudgeAnimation.duration = animation.duration;
	nudgeAnimation.timingFunction = animation.timingFunction;
	nudgeAnimation.removedOnCompletion = YES;
	nudgeAnimation.delegate = self;
	
	CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
	animationGroup.delegate = animation.delegate;
	animation.delegate = nil;
	
	animationGroup.duration = animation.duration;
	animationGroup.timingFunction = animation.timingFunction;
	animationGroup.animations = @[
		animation, nudgeAnimation
	];
	animationGroup.removedOnCompletion = YES;
	
	return animationGroup;

}

- (void) nudge {
	//	No op
}

@end
