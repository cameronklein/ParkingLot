//
//  Vehicle.h
//  ParkingLot
//
//  Created by Cameron Klein on 1/21/15.
//  Copyright (c) 2015 Cameron Klein. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vehicle : NSObject

@property NSInteger wheels;
@property NSInteger surcharge;
@property NSInteger ident;
@property (nonatomic, strong) NSString* toString;

@end