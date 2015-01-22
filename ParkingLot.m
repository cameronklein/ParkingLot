//
//  ParkingLot.m
//  ParkingLot
//
//  Created by Cameron Klein on 1/21/15.
//  Copyright (c) 2015 Cameron Klein. All rights reserved.
//

#import "ParkingLot.h"

@interface ParkingLot ()

@property (nonatomic, strong) NSMutableArray *spaces;
@property (nonatomic, strong) NSMutableDictionary *moneyCollected;

@property (nonatomic) NSInteger nextID;
@property NSInteger capacity;

- (void) provideSpaceForVehicle:(Vehicle *) vehicle;

@end

@implementation ParkingLot

//
// Initializes new parking lot with set capacity.
//

- (instancetype)initWithCapacity:(NSInteger)capacity
{
  self = [super init];
  if (self) {
    self.capacity = capacity;
    self.spaces = [[NSMutableArray alloc] initWithCapacity:capacity];
    self.moneyCollected = [[NSMutableDictionary alloc] init];
    self.nextID = 0;
  }
  return self;
}

//
// Getter for nextID, increments every time called.
//

- (NSInteger) nextID {
  _nextID++;
  return _nextID;
}

//
// Attempts to park a vehicle. Returns true if space available, false if parking lot is full.
//

- (BOOL) parkVehicle:(Vehicle *)vehicle {
  
  if (self.spaces.count < self.capacity) {
    [self provideSpaceForVehicle:vehicle];
    [self collectMoneyFromVehicle:vehicle];
    [self assignIDToVehicle:vehicle];
    return true;
  } else {
    return false;
  }
}

//
// Attempts to remove a vehicle. Returns true if vehicle found, false if not.
//

- (BOOL) unparkVehicle:(Vehicle *)vehicle {
  
  NSUInteger index = [self.spaces indexOfObject:vehicle];
  if (index != NSNotFound) {
    [self.spaces removeObjectAtIndex:index];
    return true;
  } else {
    return false;
  }
}

//
// Simple helper method to insert vehicle in spaces array.
//

- (void) provideSpaceForVehicle:(Vehicle *) vehicle {
  [self.spaces addObject:vehicle];
}

//
// Calculates money owed from vehicle and inserts it into money collected dictionary.
//

- (void) collectMoneyFromVehicle:(Vehicle *) vehicle {
  NSInteger moneyFromThisVehicle = (vehicle.wheels * 5) + vehicle.surcharge;
  NSNumber *previousMoneyFromThisVehicleType = [self.moneyCollected objectForKey:vehicle.toString];
  NSNumber *value;
  
  
  if (previousMoneyFromThisVehicleType) {
    NSInteger newTotal = previousMoneyFromThisVehicleType.integerValue + moneyFromThisVehicle;
    value = [[NSNumber alloc] initWithInteger:newTotal];
  } else {
    value = [[NSNumber alloc] initWithInteger:moneyFromThisVehicle];
  }
  
  [self.moneyCollected setObject: value forKey: vehicle.toString];
  NSLog(@"Money Collected: %ld.\nTotal money: %ld", moneyFromThisVehicle, [self moneyEarned]);
}

//
// Assign ID to vehicle
//

- (void) assignIDToVehicle: (Vehicle *) vehicle {
  
  vehicle.ident = self.nextID;
  
}

//
// Returns total money earned
//

- (NSInteger) moneyEarned {
  NSInteger totalMoney = 0;
  for (NSString *key in self.moneyCollected) {
    NSNumber *moneyForType = [self.moneyCollected objectForKey:key];
    totalMoney += moneyForType.integerValue;
  }
  return totalMoney;
}

//
// Returns money earned from given vehicle type
//

- (NSInteger) moneyEarnedFromVehicleType:(Vehicle *) type {
  NSLog(@"%@",type.toString);
  NSNumber *money = [self.moneyCollected objectForKey:type.toString];
  return money.integerValue;
}

//
// Returns string description of all vehicles
//

- (NSString *) listAllVehicles {
  NSString *output = @"";
  for (Vehicle *vehicle in self.spaces) {
    NSString *string = [NSString stringWithFormat:@"%@ with id: %ld\n", vehicle.toString, (long)vehicle.ident];
    output = [output stringByAppendingString:string];
  }
  return output;
}

//
// Returns string description of all vehicles, sorted by type
//

- (NSString *) listVehiclesSortedByType {
  
  NSString *output = @"";
  NSString *lastType = @"";
  NSSortDescriptor *sorter = [NSSortDescriptor sortDescriptorWithKey:@"toString" ascending:true];
  NSArray *array = [self.spaces sortedArrayUsingDescriptors:@[sorter]];
  
  for (Vehicle *vehicle in array) {
    if (![lastType isEqualToString:vehicle.toString]){
      lastType = vehicle.toString;
      NSString *header = [NSString stringWithFormat:@"\n %@: \n", vehicle.toString];
      output = [output stringByAppendingString:header];
    }
    
    NSString *string = [NSString stringWithFormat:@"id: %ld\n", (long)vehicle.ident];
    output = [output stringByAppendingString:string];

  }
  
  return output;
}

//
// Returns string description of all vehicles, sorted by id
//

- (NSString *) listVehiclesSortedByID {
  
  NSString *output = @"";
  NSSortDescriptor *sorter = [NSSortDescriptor sortDescriptorWithKey:@"ident" ascending:true];
  NSArray *array = [self.spaces sortedArrayUsingDescriptors:@[sorter]];
  
  for (Vehicle *vehicle in array) {
    NSString *string = [NSString stringWithFormat:@"%@ with id: %ld\n", vehicle.toString, (long)vehicle.ident];
    output = [output stringByAppendingString:string];
  }
  return output;
}





@end
