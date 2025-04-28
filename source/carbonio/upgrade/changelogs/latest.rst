Release 25.3.1
=================

Release Date: April 28th, 2025

New Features List
-----------------

WSC-1836: carbonio-mlt dependency of carbonio-videorecorder package
   Package carbonio-mlt is now a dependency of package carbonio-videorecorder.


IN-791: Updated carbonio MLT package
   A unified carbonio-mlt package is now provided, standardizing versioning across distributions and serving as a runtime dependency for carbonio-videorecorder.

*****

Bugfix List
-----------

WSC-1928: Cropped video recordings
   Solved an issue that prevented the correct storage of a recorded
   video meeting, which sometimes lacked part of the whole
   registration and sometimes did not synchronise the video and audio
   streams.

*****

End of changelog
