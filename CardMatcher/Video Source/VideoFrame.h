//
//  VideoFrame.h
//  OpenCVTutorial
//
//  Created by Paul Sholtz on 12/14/13.
//  Copyright (c) 2013 Razeware LLC. All rights reserved.
//



typedef struct
{
    size_t width;
    size_t height;
    size_t stride;
    
    unsigned char * data;
} VideoFrame;

