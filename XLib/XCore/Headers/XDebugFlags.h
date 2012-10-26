//
//  XDebugFlags.h
//  X20
//
//  Created by Gary Xie on 10/26/12.
//  Copyright (c) 2012 Gary.Xie. All rights reserved.
//

/**
 * These flags are used primarily by XDCONDITIONLOG.
 * Example:
 *
 *    XDCONDITIONLOG(XDFLAG_NAVIGATOR, @"XNavigator activated");
 *
 * This will only write to the log if the XDFLAG_NAVIGATOR is set to non-zero.
 */
#define XDFLAG_VIEWCONTROLLERS             0
#define XDFLAG_CONTROLLERGARBAGECOLLECTION 0
#define XDFLAG_NAVIGATOR                   0
#define XDFLAG_TABLEVIEWMODIFICATIONS      0
#define XDFLAG_LAUNCHERVIEW                0
#define XDFLAG_URLREQUEST                  0
#define XDFLAG_URLCACHE                    0
#define XDFLAG_XMLPARSER                   0
#define XDFLAG_ETAGS                       0
