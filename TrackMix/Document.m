//
//  Document.m
//  TrackMix
//
//  Created by Chris Angelli on 2/24/14.
//  Copyright (c) 2014 Chris Angelli. All rights reserved.
//

#import "Document.h"
#import "Track.h"

@implementation Document

- (id)init
{
    self = [super init];
    if (self) { // Add your subclass-specific initialization here.
   }
    return self;
}

- (void) awakeFromNib
{
    Track *aTrack = [[Track alloc] init];
    [self setTrack:aTrack];
    [self updateUserInterface];
    
}

- (NSString *)windowNibName
{
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"Document";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

+ (BOOL)autosavesInPlace
{
    return YES;
}

- (IBAction)mute:(id)sender {
     NSLog(@"received a mute: message");
    
    [self.track setVolume:0.0];
    [self updateUserInterface];
    
}

- (IBAction)takeFloatValueForVolumeFrom:(id)sender {
    NSString *senderName = nil;
    if (sender == self.textField) {
        senderName = @"textField";
    }
    else {
        senderName = @"slider";
    }
    NSLog(@"%@ sent takeFloatValueForVolumeFrom: with value %1.2f", senderName, [sender floatValue]);
    
    float newValue = [sender floatValue];
    [self.track setVolume:newValue];
    [self updateUserInterface];
}

- (void) updateUserInterface {
    float volume = [self.track volume];
    
    [self.textField setFloatValue: volume];
    [self.slider setFloatValue:volume];
    
}
@end
