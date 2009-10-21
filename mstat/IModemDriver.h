//
//  IModemDriver.h
//  mstat
//
//  Created by dirk.eisenberg on 10/21/09.
//  Copyright 2009 private. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MSModemInstance.h"

@protocol IModemDriver

- (void)startStatisticInterface:(MSModemInstance *)modem;

@end
