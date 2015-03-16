#import "MITMobiusModule.h"

@implementation MITMobiusModule
- (instancetype)init {
    self = [super initWithName:MITModuleTagMobius title:@"Mobius"];
    if (self) {
        self.imageName = MITImageMobiusModuleIcon;
    }
    return self;
}

- (BOOL)supportsCurrentUserInterfaceIdiom
{
    return YES;
}

- (void)loadViewController
{
    UIUserInterfaceIdiom userInterfaceIdiom = [[UIDevice currentDevice] userInterfaceIdiom];

    UIStoryboard *storyboard = nil;
    if (userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        storyboard = [UIStoryboard storyboardWithName:@"Mobius_pad" bundle:nil];
    } else if (userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
        storyboard = [UIStoryboard storyboardWithName:@"Mobius_phone" bundle:nil];
    } else {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"unknown user interface idiom" userInfo:nil];
    }

    self.viewController = [storyboard instantiateInitialViewController];
}
	
@end
