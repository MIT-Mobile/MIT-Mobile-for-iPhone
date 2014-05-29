#import "MITShuttleVehicle.h"
#import "MITShuttleRoute.h"
#import "MITShuttleVehicleList.h"
#import "MITShuttlePrediction.h"


@implementation MITShuttleVehicle

@dynamic heading;
@dynamic identifier;
@dynamic latitude;
@dynamic longitude;
@dynamic secondsSinceReport;
@dynamic speedKph;
@dynamic route;
@dynamic vehicleList;
@dynamic predictions;

+ (RKMapping *)objectMapping
{
    RKEntityMapping *mapping = [[RKEntityMapping alloc] initWithEntity:[self entityDescription]];
    [mapping addAttributeMappingsFromDictionary:@{@"id": @"identifier",
                                                  @"lat": @"latitude",
                                                  @"lon": @"longitude",
                                                  @"heading": @"heading",
                                                  @"speed_kph": @"speedKph",
                                                  @"seconds_since_report": @"secondsSinceReport"}];
    [mapping setIdentificationAttributes:@[@"identifier"]];
    return mapping;
}

@end
