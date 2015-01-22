//
//  FullCar.m
//  ParkingLot
//
//  Created by Cameron Klein on 1/21/15.
//  Copyright (c) 2015 Cameron Klein. All rights reserved.
//

#import "FullCar.h"

@implementation FullCar

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.wheels = 4;
    self.surcharge = 2;
    self.toString = @"Full Car";
  }
  return self;
}

@end
