#import <Foundation/Foundation.h>
#import "MITMappedObject.h"

@interface MITLibrariesAvailability : NSObject <MITMappedObject>

@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *collection;
@property (nonatomic, strong) NSString *callNumber;
@property (nonatomic, strong) NSString *status;
@property (nonatomic) BOOL available;

@end
