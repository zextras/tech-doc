Release 25.03.1
=================

Release Date: April 28th, 2025

New Features List
-----------------

WSC-1836: :file:`carbonio-mlt` dependency of :file:`carbonio-videorecorder` package
   Package :file:`carbonio-mlt` is now a dependency of package :file:`carbonio-videorecorder`.


IN-791: Updated carbonio MLT package
   A unified carbonio-mlt package is now provided, standardizing versioning across distributions and serving as a runtime dependency for carbonio-videorecorder.

*****

Bugfix List
-----------

WSC-1928: Incomplete video recordings
   Solved an issue that prevented the correct storage of a recorded
   video meeting, which sometimes lacked part of the whole
   registration and sometimes did not synchronise the video and audio
   streams.

*****

End of changelog
