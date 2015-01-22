//
//  ParkingLot.h
//  ParkingLot
//
//  Created by Cameron Klein on 1/21/15.
//  Copyright (c) 2015 Cameron Klein. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Vehicle.h"

@interface ParkingLot : NSObject

- (instancetype)initWithCapacity:(NSInteger)capacity;

- (BOOL) parkVehicle:(Vehicle *)vehicle;
- (BOOL) unparkVehicle:(Vehicle *)vehicle;

- (NSInteger) moneyEarned;
- (NSInteger) moneyEarnedFromVehicleType:(Vehicle *) type;

- (NSString *) listAllVehicles;
- (NSString *) listVehiclesSortedByType;
- (NSString *) listVehiclesSortedByID;

@end
