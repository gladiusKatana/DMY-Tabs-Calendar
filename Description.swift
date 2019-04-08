 /*  Description.swift
 //  The 'Ultimate' Collection View Boilerplate
 //  Created by Garth Snyder on 2019-02-07.  //  Copyright © 2019 Garth Snyder. All rights reserved.
 
  
                                                                                     < ◉ > __________________
                          //\/\\/\/\//\/\/\//\/\/\//\/\//\/\//\// \// \//\\//\/ /\/ (       ''"'''"'''""''''"'
                    ///\//\/\/\/\/ \/\/\v\/\//v/\///\//\ \/\/\/\//\/\/\/v/\//\\/ \ /\{                           (yes i know, my tail needs work)
                     \/\/\\/\\\/\\/\/\/\\/\/ \\/\/\/\/\/\/\/\//v /\/\// /\/\//\/\/v//\\/   "''"'"''""''''"'"'
                             \ \\//\//\/\/\vv\//v/\/\ \/\/\//\//\///\//\//  \/    //\{
                                                          \/     \/ / \/\/ \\/    \
                                                           {     }           (    }
                                                             {    )            {   )
                                                              {   )             \||\
                                                               /||\

 
  
                                        WHAT KIND of animal am I?
  
  
  
(Of course my creator is really asking, "AM I GOOD at drawing?"  Being perfectly ok with the correct answer, "NO!")
  
 

                                        ANYWAY. This file describes
  
                                        the “USEFULNESS TEST” of this program, its intended use cases & design motivations.
 

                                        WHAT is this test?
  
  Basically, it's whether this program can provide a single class(*) for all or most of the collection views one can imagine implementing, in an iOS project that relies on collection views (which is a large fraction of them.)  This should be possible with minimal subclassing: initialization parameters should cover most custom properties you'd ever need.
  
  
                                        HOW will this be tested?
  
  Over time, with practical use.  I will fork this repo to create a small set of applications: a calendar
                                                                                               a timetable
                                                                                               a video app pulling from an AWS S3 bucket
                                                                                               a spreadsheet-like personal financial planning tool
                                                                                               a market tracking app for traders, with price tables & exchange API calls
                                                                                               a simple clone of the Excel / Numbers app (maybe later)
                                                                                               ... (**)
  
  The more code this boilerplate saves in these projects, (especially the latter ones), the greater the win.
  
  
                                        3 COMPONENTS will be evaluated:
  
                                CollectionVC, a custom collection view class;
                                CCVFlowLayout, its layout class (containing the bulk of the customization);
                                and the somewhat idiosyncratic style in which navigation between multiple collection views is handled. (✭)
  
  
  THE GOAL is to save development effort on a project's initial setup (particularly custom collection view layouts), making a collection view look to the developer more like a simple data structure (e.g., a dictionary), rather than some inordinately complex set of ''objects'' implemented by developers in a myriad of fragmented ways. (✭✭)
  
  
  
  NOTES
  
  (*)
  Well, two, really: one for the layout and one for the collection view itself, but the former is a required property of the latter, so it's as if it's one.
  
  (**)
  The second “usefulness test” is that I'm preparing to fork this repo in the rewrite of my main (currently private) project.  Ironically, in that project, everything works great, but it's got all sorts of functionality that I've built on top of collection view layout classes that are not particularly elegant.  This boilerplate will obviate all or most of the subclassing needed for those collection view layouts, saving probably ~300 lines there alone.  The functionality it adds, e.g. launching straight to either portrait or landscape orientation (if one so chooses), and transposing layout direction with one bool in the layout init, are just a bonus.
  
  (✭)
  This is, as running this program will show, meant to be similar in look & feel to navigating between multiple tabs on browser, or worksheets on a spreadsheet, rather than the 'navigation stack' way Apple gently nudges us into using, with its built-in Back button, and 'push'/'pop' methods.
 
  (✭✭)
  To be quite frank, I personally think Swift (specifically Swift 3, 4 & 5, which are what I've worked with) makes collection view layouts a bit awkward to implement.  Why is UICollectionViewFlowLayout so limited, requiring all this subclassing just to create, essentially, a simple 2-by-2 array of items that scrolls and looks normal?  Why are sticky headers built into table views, but not collection views?  And for that matter, why does a "table" view even exist any more? It's just a 1-by-n collection view!
  
  I suspect there are simple reasons for all this; mainly that Apple expects (undoubtedly, correctly) that most devs using collection/table views will fill them with simple arrangements of objects (whose data sources are pulled from a cloud bucket), where only a few items can (and should) be shown at once. Like the Photos app, or Youtube. Whereas, applications more akin to desktop Excel, that let users toggle between multiple large arrangements of data or items (read: apps for power-users), are rarer.  Of course... these are the applications that necessitate expansion of their underlying classes to encompass the most general blueprints of ''collections'' of objects.  Which begs the perennial question, that I see Apple increasingly struggling with
    — do you design with power users in mind? Or just mainstream consumers?
  
  
  
  
  
  
  
                                        NEAR-FUTURE updates
  
    [features]
  
    cell borders & cornerRadius init bool (*on layout or cv itself (where it's called) though? pick whichever seems more intuitive for user)
  
  
  
    [performance]
  
    ...
  
  
  
    [ui]
  
    make background colours (ie navy blue) brighter?
  
  
  
    [ux]
  
    more descriptive comments for developers
                                                */
 
