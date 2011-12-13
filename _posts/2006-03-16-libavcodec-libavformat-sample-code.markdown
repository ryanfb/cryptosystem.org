--- 
permalink: archives/2006/03/libavcodec-libavformat-sample-code
wordpress_id: 19
layout: default
comments: 
- :comment_content: |-
    Thank you!
    
    After a lot of frustration not even getting the example code to work, i almost gave up on video-coding.... until i found you ;)
  :comment_date: 2006-05-04 10:55:02 -04:00
  :comment_author: Henrik
- :comment_content: |
    <p>yes ... your willingness to post this is the difference between me giving up my project in frustration and having the psych to continue ... thanks very much, may you enjoy good karma</p>

  :comment_date: 2006-06-28 08:57:09 -04:00
  :comment_author: Carty
- :comment_content: |
    <p>hi..
          i am trying to compile fixed program avcodec sample program,
    i am using macosx, i changed the header files</p>
    
    include "/usr/local/include/ffmpeg/avcodec.h"
    
    include "/usr/local/include/ffmpeg/avformat.h"
    
    <p>i am getting the followin error</p>
    
    <p>/usr/local/include/ffmpeg/avformat.h:251: warning: 'AVFrac' is deprecated (declared at /usr/local/include/ffmpeg/avformat.h:102)
    /usr/bin/ld: Undefined symbols:
    _av_close_input_file
    _av_find_stream_info
    _av_free
    _av_open_input_file
    _av_read_frame
    _av_register_all
    _avcodec_alloc_frame
    _avcodec_close
    _avcodec_decode_video
    _avcodec_find_decoder
    _avcodec_open
    _avpicture_fill
    _avpicture_get_size
    _dump_format
    _img_convert
    collect2: ld returned 1 exit status</p>
    
    <p>what could be the error..
    thanks</p>

  :comment_date: 2006-11-23 15:18:52 -05:00
  :comment_author: harsha
- :comment_content: |
    <p>it worked in debian machine,, thanks for the code. :)</p>

  :comment_date: 2006-11-23 23:16:51 -05:00
  :comment_author: harsha
- :comment_content: |
    <p>A fully updated revision of this code can be found on my site: http://web.me.com/dhoerl/Home/Tech_Blog/Entries/2009/1/22_Revised_avcodec_sample.c.html</p>
    
    <p>Click on avcodec_sample.0.5.0.c and to download it.</p>

  :comment_date: 2009-01-22 16:21:58 -05:00
  :comment_author: David
title: libavcodec / libavformat sample code
wordpress_url: http://www.cryptosystem.org/archives/2006/03/libavcodec-libavformat-sample-code/
---
Due to some changes in libavformat, the sample code at
[http://www.inb.uni-luebeck.de/~boehme/libavcodec_update.html](http://www.inb.uni-luebeck.de/~boehme/libavcodec_update.html) no longer
compiles correctly.

    avcodec_sample.0.4.9.cpp: In function â€˜int main(int, char**)â€™:
    avcodec_sample.0.4.9.cpp:83: error: request for member â€˜codec_typeâ€™ in 
        â€˜pFormatCtx->AVFormatContext::streams[i]->AVStream::codecâ€™, 
        which is of non-class type â€˜AVCodecContext*â€™
    avcodec_sample.0.4.9.cpp:92: error: cannot convert â€˜AVCodecContext**â€™ 
        to â€˜AVCodecContext*â€™ in assignment
    avcodec_sample.0.4.9.cpp:105: error: â€˜struct AVCodecContextâ€™ has 
        no member named â€˜frame_rateâ€™
    avcodec_sample.0.4.9.cpp:105: error: â€˜struct AVCodecContextâ€™ has 
        no member named â€˜frame_rate_baseâ€™
    avcodec_sample.0.4.9.cpp:106: error: â€˜struct AVCodecContextâ€™ has 
        no member named â€˜frame_rate_baseâ€™

I've created a [patch](http://cryptosystem.org/projects/libavcodec/avcodec_sample.patch) as well as a [fixed example](http://cryptosystem.org/projects/libavcodec/avcodec_sample.0.4.9-fixed.cpp) for the code. I'm not entirely sure about commenting out the frame rate correction hack, but those frame rate variables are no longer members of the AVCodecContext struct.

Also, for compiling under Debian, the recommended usage is not to change the include directives, but to use:

    g++ `ffmpeg-config --cflags` -o filename filename.cpp 
        `ffmpeg-config --libs avformat --libs avcodec`
