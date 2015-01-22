//
//  ViewController.m
//  ParkingLot
//
//  Created by Cameron Klein on 1/21/15.
//  Copyright (c) 2015 Cameron Klein. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  ParkingLot *lot = [[ParkingLot alloc] initWithCapacity:50];
  [lot parkVehicle:[CompactCar new]];
  [lot parkVehicle:[FullCar new]];
  [lot parkVehicle:[FullCar new]];
  [lot parkVehicle:[FullCar new]];
  [lot parkVehicle:[ElectricCar new]];
  [lot parkVehicle:[ElectricCar new]];
  [lot parkVehicle:[ElectricCar new]];
  [lot parkVehicle:[ElectricCar new]];
  [lot parkVehicle:[[Truck alloc] initWithNumberOfWheels:8]];
  [lot parkVehicle:[[Truck alloc] initWithNumberOfWheels:8]];
  [lot parkVehicle:[[Truck alloc] initWithNumberOfWheels:8]];
  [lot parkVehicle:[[Truck alloc] initWithNumberOfWheels:4]];
  [lot parkVehicle:[[Truck alloc] initWithNumberOfWheels:8]];
  NSLog(@"%@", [lot listAllVehicles]);
  NSLog(@"%@", [lot listVehiclesSortedByID]);
  NSLog(@"%@", [lot listVehiclesSortedByType]);
  NSLog(@"MoneyCollected From Trucks: %ld", [lot moneyEarnedFromVehicleType:[Truck new]]);
  
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
