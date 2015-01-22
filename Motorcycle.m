//
//  Motorcycle.m
//  ParkingLot
//
//  Created by Cameron Klein on 1/21/15.
//  Copyright (c) 2015 Cameron Klein. All rights reserved.
//

#import "Motorcycle.h"

@implementation Motorcycle

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.wheels = 2;
    self.toString = @"Motorcycle";
  }
  return self;
}

@end
