//
//  ElectricCar.m
//  ParkingLot
//
//  Created by Cameron Klein on 1/21/15.
//  Copyright (c) 2015 Cameron Klein. All rights reserved.
//

#import "ElectricCar.h"

@implementation ElectricCar

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.wheels = 4;
    self.surcharge = 1;
    self.toString = @"Electric Car";
  }
  return self;
}

@end
