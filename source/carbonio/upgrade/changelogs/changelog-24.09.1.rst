
Release 24.9.1
=================

Release Date: October 24th, 2024


Bugfix List
-----------

**CO-1507: Mail UI badge counter and font color readability improvement**
   Fixed usability issues where the badge counter font size was too small, and grey text was hard to read over a grey background in the web UI. The fix ensures better readability and consistency in the UI.


**CO-1508: Enhanced recipient Drag-and-Drop functionality**
    Improved email composer recipient management by fixing drag-and-drop issues between TO, CC, and BCC fields, preventing duplication and deletion.


**CO-1515: Enhanced files/chat blob management**
   Introduced digest checks and improved logging for doMoveBlobs operations to prevent data loss and ensure reliable file and chat attachment management.


**CO-1529: IMAP folder subscription with cyrillic chars**
   The issue of Thunderbird not being able to subscribe to IMAP folders containing Cyrillic characters has been resolved. A missing charset dependency (UTF-7) has been restored, allowing proper synchronization of these folders.


**CO-1549: Config parameters for carbonio-avdb-updater updated**
   Updated default configuration parameters for carbonio-avdb-updater service, enhancing antivirus database update handling.

**IN-773: PostJournal configuration removal**
   Removed outdated PostJournal references from master.cf.in file, enhancing security and streamlining Carbonio MTA configuration.


**IN-789: Optimized OpenJDK CACerts Installation**
    Enhanced carbonio-openjdk-cacerts package installation by filtering certificates with specific aliases, reducing backup and restore time.


**TEAMS-4162: Restored background change in chrome**
   Fixed Chrome browser userAgent check, enabling background change functionality during video call meetings.


**ZPS-985: Optimized process exporter memory usage**
   Upgraded process exporter to latest version, enabling auto-gomemlimit and resolving memory leak issues for improved performance.

*****

End of changelog
