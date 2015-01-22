//
//  ParkingLotTests.m
//  ParkingLotTests
//
//  Created by Cameron Klein on 1/21/15.
//  Copyright (c) 2015 Cameron Klein. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ParkingLot.h"
#import "CompactCar.h"
#import "Truck.h"

@interface ParkingLotTests : XCTestCase

@property (nonatomic, strong) ParkingLot *parkingLot;

@end

@implementation ParkingLotTests

- (void)setUp {
    [super setUp];
  
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInsert {
    ParkingLot *parkingLot = [[ParkingLot alloc] initWithCapacity:1];
    XCTAssert([parkingLot parkVehicle:[CompactCar new]], @"Inserted First Car");
    XCTAssert(![parkingLot parkVehicle:[CompactCar new]], @"Second Car Exceeds Capacity");
}

- (void)testRemove {
  ParkingLot *parkingLot = [[ParkingLot alloc] initWithCapacity:1];
  CompactCar *car = [CompactCar new];
  XCTAssert([parkingLot parkVehicle:car], @"Inserted First Car");
  XCTAssert([parkingLot unparkVehicle:car], @"Removed First Car");
  XCTAssert([parkingLot parkVehicle:car], @"Inserted Second Car");
}

- (void)testMoneyCollection {
  ParkingLot *parkingLot = [[ParkingLot alloc] initWithCapacity:2];
  [parkingLot parkVehicle:[CompactCar new]];
  XCTAssert([parkingLot moneyEarned] == 20, @"Correctly collected money from compact car");
  [parkingLot parkVehicle:[[Truck alloc] initWithNumberOfWheels:8]];
  XCTAssert([parkingLot moneyEarned] == 63, @"Correctly collected money from truck");
}


@end
