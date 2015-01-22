//
//  CompactCar.m
//  ParkingLot
//
//  Created by Cameron Klein on 1/21/15.
//  Copyright (c) 2015 Cameron Klein. All rights reserved.
//

#import "CompactCar.h"

@implementation CompactCar

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.wheels = 4;
    self.toString = @"Compact Car";
  }
  return self;
}

@end
