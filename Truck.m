//
//  Truck.m
//  ParkingLot
//
//  Created by Cameron Klein on 1/21/15.
//  Copyright (c) 2015 Cameron Klein. All rights reserved.
//

#import "Truck.h"

@implementation Truck

- (instancetype)initWithNumberOfWheels:(NSInteger) wheels;
{
  self = [super init];
  if (self) {
    self.wheels = wheels;
    self.surcharge = 3;
    self.toString = @"Truck";
  }
  return self;
}

@end
