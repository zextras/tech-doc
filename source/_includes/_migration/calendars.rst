
We assume that the Calendar files of all users has been exported and
placed into |carbonio| Mails & Calendar Node's
:file:`/tmp/backup/` directory, in ICS Format, e.g.,
:file:`/tmp/backup/user1@example.com.ics`,
:file:`/tmp/backup/user1@acme.corp.ics`, and so on.

The files to be imported must have the standard ICS format, for
example

.. dropdown:: Example ICS file
   :open:

   ::

      BEGIN:VCALENDAR
      X-WR-CALNAME:Calendar
      X-WR-CALID:0621afc2-6801-4577-8444-bc67a85b1fbf:10
      PRODID:Carbonio-Calendar-Provider
      VERSION:2.0
      METHOD:PUBLISH
      BEGIN:VTIMEZONE
      TZID:Europe/Rome
      BEGIN:STANDARD
      DTSTART:16010101T030000
      TZOFFSETTO:+0100
      TZOFFSETFROM:+0200
      RRULE:FREQ=YEARLY;WKST=MO;INTERVAL=1;BYMONTH=10;BYDAY=-1SU
      TZNAME:CET
      END:STANDARD
      BEGIN:DAYLIGHT
      DTSTART:16010101T020000
      TZOFFSETTO:+0200
      TZOFFSETFROM:+0100
      RRULE:FREQ=YEARLY;WKST=MO;INTERVAL=1;BYMONTH=3;BYDAY=-1SU
      TZNAME:CEST
      END:DAYLIGHT
      END:VTIMEZONE
      BEGIN:VEVENT
      UID:8c9eb99d-5197-40ef-9a3f-0cd4845e808d
      SUMMARY:Meeting with CEO
      DESCRIPTION:-:::_::_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_
       :_:_:_:_:_:_:_::_:_::-\n have invited you to a new meeting!\n\nSubject: Meet
       ing with CEO \nOrganizer: "undefined \n\nTime: Wednesday\, 16 October\, 2024
        09:00 - 12:00\n \nInvitees: john.doe@example.com \n\n\n-:::_::_:_:_:_:_
       :_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_::_:_::-\n"
      X-ALT-DESC;FMTTYPE=text/html:<html><body id='htmlmode'>-:::_::_:_:_:_:_:_:_:
       _:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_::_:_::-<h3>undefin
       ed have invited you to a new meeting!</h3><p>Subject: Meeting with CEO</p><p
       >Organizer: undefined</p><p>Location: </p><p>Time: Wednesday\, 16 October\, 
       2024 09:00 - 12:00</p><p>Invitees: john.doe@example.com</p><br/>-:::_::_
       :_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_::_:_:
       :-</body></html>
      ATTENDEE;CN=john.doe@example.com;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACT
       ION;RSVP=TRUE:mailto:john.doe@example.com
      ORGANIZER:mailto:stefano@example.com
      DTSTART;TZID="Europe/Rome":20241016T090000
      DTEND;TZID="Europe/Rome":20241016T120000
      STATUS:CONFIRMED
      CLASS:PUBLIC
      X-MICROSOFT-CDO-INTENDEDSTATUS:BUSY
      TRANSP:OPAQUE
      LAST-MODIFIED:20240930T105154Z
      DTSTAMP:20240930T105154Z
      SEQUENCE:0
      BEGIN:VALARM
      ACTION:DISPLAY
      TRIGGER;RELATED=START:-PT5M
      DESCRIPTION:Reminder
      END:VALARM
      END:VEVENT
      BEGIN:VEVENT
      UID:af6362e5-8806-4427-952b-6d33aedb93b9
      SUMMARY:Meeting with CEO
      DESCRIPTION:-:::_::_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_
       :_:_:_:_:_:_:_::_:_::-\n have invited you to a new meeting!\n\nSubject: Meet
       ing with CEO \nOrganizer: "undefined \n\nTime: Wednesday\, 16 October\, 2024
        09:00 - 12:00\n \nInvitees: j.doe@example.com \n\n\n-:::_::_:_:_:_:_
       :_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_::_:_::-\n"
      X-ALT-DESC;FMTTYPE=text/html:<html><body id='htmlmode'>-:::_::_:_:_:_:_:_:_:
       _:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_::_:_::-<h3>undefin
       ed have invited you to a new meeting!</h3><p>Subject: Meeting with CEO</p><p
       >Organizer: undefined</p><p>Location: </p><p>Time: Wednesday\, 16 October\, 
       2024 09:00 - 12:00</p><p>Invitees: j.doe@example.com</p><br/>-:::_::_
       :_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_::_:_:
       :-</body></html>
      ATTENDEE;CN=john.doe@example.com;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACT
       ION;RSVP=TRUE:mailto:j.doe@example.com
      ORGANIZER:mailto:m.jane@example.com
      DTSTART;TZID="Europe/Rome":20241016T090000
      DTEND;TZID="Europe/Rome":20241016T120000
      STATUS:CONFIRMED
      CLASS:PUBLIC
      X-MICROSOFT-CDO-INTENDEDSTATUS:BUSY
      TRANSP:OPAQUE
      LAST-MODIFIED:20240930T105159Z
      DTSTAMP:20240930T105159Z
      SEQUENCE:0
      BEGIN:VALARM
      ACTION:DISPLAY
      TRIGGER;RELATED=START:-PT5M
      DESCRIPTION:Reminder
      END:VALARM
      END:VEVENT
      END:VCALENDAR

They can be imported into |product| using the following command:

.. code:: console

   zextras$ for account in $(carbonio prov -l gaa SOURCE_DOMAIN); do \
   echo "prov sa $account postRestURL '/Calendar?fmt=ics' /tmp/backup/${account}.ics"; \
   done | carbonio

ICS files can be also be imported manually by each user according to
the direction presented in the `Working with Calendars
<https://docs.zextras.com/user-guides/carbonio/en/html/calendars/toc.html#import-an-ics-file-as-new-calendar>`_
section of the User Guides.
