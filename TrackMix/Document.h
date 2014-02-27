//
//  Document.h
//  TrackMix
//
//  Created by Chris Angelli on 2/24/14.
//  Copyright (c) 2014 Chris Angelli. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class Track;

@interface Document : NSPersistentDocument

- (IBAction)mute:(id)sender;
- (IBAction)takeFloatValueForVolumeFrom:(id)sender;
- (void) updateUserInterface;

@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSSlider *slider;
@property (strong) Track *track;

@end
