#import <Foundation/Foundation.h>

@class ShuttleStop;
@class ShuttleRoute;
@class ShuttleRouteCache;
@class ShuttleStopLocation;

@protocol ShuttleDataManagerDelegate<NSObject>

// everything is optional. 
@optional

// message sent when routes were received. If request failed, this is called with a nil routes array
-(void) routesReceived:(NSArray*) routes;

// message sent when stops were received. If request failed, this is called with a nil stops array
-(void) stopsReceived:(NSArray*) routes;

// message sent when a shuttle stop is received. If request fails, this is called with nil 
-(void) stopInfoReceived:(NSArray*)shuttleStopSchedules forStopID:(NSString*)stopID;

// message sent when a shuttle route is received. If request fails, this is called with nil
-(void) routeInfoReceived:(ShuttleRoute*)shuttleRoute forRouteID:(NSString*)routeID;

@end


@interface ShuttleDataManager : NSObject {
	// registered delegates
	NSMutableArray* _registeredDelegates;
}

@property (nonatomic, readonly, copy) NSMutableArray* shuttleRoutes;               // cached shuttle routes.
@property (nonatomic, readonly, copy) NSMutableDictionary* shuttleRoutesByID;      // cached shuttle routes sorted by route ID
@property (nonatomic, readonly, copy) NSMutableArray* stopLocations;               // cached shuttle stops locations.
@property (nonatomic, readonly, copy) NSMutableDictionary *stopLocationsByID;      // cached shuttle stops sorted by ID

// get the signleton data manager
+(ShuttleDataManager*) sharedDataManager;

// return a list of all shuttle stops.
// this method is only here for backwards compatibility with CampusMapViewController
// which includes a function to display all shuttle stops on the map
// though that function is not used as we decided to get rid of the shuttle button from the UI
// so this can go away if that goes away
- (NSArray *)shuttleStops;

+ (ShuttleRoute *)shuttleRouteWithID:(NSString *)routeID;
+ (ShuttleRouteCache *)routeCacheWithID:(NSString *)routeID;
+ (ShuttleStop *)stopWithRoute:(NSString *)routeID stopID:(NSString *)stopID error:(NSError **)error;
+ (ShuttleStopLocation *)stopLocationWithID:(NSString *)stopID;

// delegate registration and unregistration
-(void) registerDelegate:(id<ShuttleDataManagerDelegate>)delegate;

-(void) unregisterDelegate:(id<ShuttleDataManagerDelegate>)delegate;

// request the routes from the server.
-(void) requestRoutes;

// request full information about a particular stop
-(void) requestStop:(NSString*)stopID;

// request full information about a particular route
-(void) requestRoute:(NSString*)routeID;

@end
