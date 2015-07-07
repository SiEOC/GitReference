//
//  GitReferenceViewController.m
//  GitReference
//
//  Created by Skyler Clark on 7/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "GitReferenceViewController.h"

@interface GitReferenceViewController ()

@end

@implementation GitReferenceViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil

{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        
    }
    
    return self;
    
}


#pragma Step Number One (Add Scroll view to main view)
- (void)viewDidLoad

{
    
    [super viewDidLoad];
    
    // Add Scroll view capacity
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20)];
    
     // Add Scroll View capacity to the View  Note: Everyobject Carries Methods With it.
    //  "view" carries "addSubView" method
    
    [self.view addSubview:scrollView];
    
      // See Notes for sizes stated here
     //  "topMargin": space required for navigation bar.
    //   "widthMinusMargin": margin of space not used.
    
    CGFloat topMargin = 20;
    
    CGFloat appropriateWidth = self.view.frame.size.width - 2 * margin;
    
    
    //Make a label from class UILabel
    
    /* "margin" a coonstant given in notes */
     
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(margin, topMargin, appropriateWidth, labelHeight)];
    
    
     // Give a Title To The UILABEL
    //  Increase Font size by changing text With UIFont Class & Its Class Method
   //   Add Label (that holds the "title" , add label to the object "scrollView" -instance of a class.
    
    title.font = [UIFont boldSystemFontOfSize:20];
    
    title.text = @"GitReference";

    [scrollView addSubview:title];
    
    
    // New guage for top Note: Do the math and you'll see
    
    /*  b =  15 +  x + y *2  */
    
    CGFloat top = topMargin + labelHeight + margin * 2;
    
    
    
    for (NSDictionary *gitCommand in [self gitCommands])
    
    {
        
   /*Notes */
  // Give name to a dictionary "gitCommand"
        
 // Give name to an Array that will be used in a dictionary "command" , which is a string.  Call / Pass the array by a simplying using the name.
//  Give name to an Array that will be used in a dictionary "references"
        
        
        NSString *command = gitCommand[Command];  // Array of commands. // Note: Arrays are indicated by "[]" such as.. [nameOfAnyArray]
        NSString *reference = gitCommand[Reference]; // Array of refeences.
        
        
        // Label with calculated size
        UILabel *gitCommand = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, appropriateWidth, labelHeight)];
        
        gitCommand.font = [UIFont boldSystemFontOfSize:17];
        gitCommand.text = command;
        
        
        // Add label to object "scrollView"
        
        [scrollView addSubview:gitCommand];
        
        
        // Make more room for..
        top += (labelHeight + margin);
        
        
        
        CGFloat heightForReference = [self heightOfReferenceString:reference];
    
        
        // Build new label
        
        UILabel *gitReference = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, appropriateWidth, heightForReference)];
        
        // Customize label:
        
        gitReference.numberOfLines = 0;
        
        gitReference.font = [UIFont systemFontOfSize:15];
        
        gitReference.text = reference;
        
        [scrollView addSubview:gitReference];
        
         // Add more room for..
        //  Add (xyz..etc)  into top
        
        top += (heightForReference + margin * 2);
        
    }
    
    
    
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, top);
    
    
    
}



- (NSArray *)gitCommands
{
    
    
    
    return @[@{Command: @"git status", Reference: @": shows changed files"}, // Array of Dictianries //'Property' for key is.. .h
             
             @{Command: @"git diff", Reference: @": shows actual changes"},
             
             @{Command: @"git add .", Reference: @": adds changed files to the commit"},
             
             @{Command: @"git commit -m \"notes\"", Reference: @": commits the changes"},
             
             @{Command: @"git push origin _branch_", Reference: @": pushes commits to branch named _branch_"},
             
             @{Command: @"git log", Reference: @": displays progress log"},
             
             @{Command: @"git comment --amend", Reference: @": re-enter last commit message"}
             
             ];
    
    
    
}



- (CGFloat)heightOfReferenceString:(NSString *)reference {
    
    
    
CGRect bounding = [reference boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin, 0)
                       
                    options:NSStringDrawingUsesLineFragmentOrigin
                       
                    attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}
                       
                    context:nil];
    
    
    
    return bounding.size.height;
    
    
    
}



@end
