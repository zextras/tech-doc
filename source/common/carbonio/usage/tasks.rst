|task| is the component that allows to create simple entries to keep
track of your activities.

Each task can be created by clicking the |new| button and consists of
a title, the only mandatory part. Optionally, you can provide a
priority (Low, Medium, and high) a description, and a reminder.

Tasks are presented as a list, ordered by their creation date in
descending order, i.e., the newest on top: clicking a task will open
it and show its details on the browser's right-hand side, where also
its creation date and description are shown; for each task you can

* Toggle its completion status
* Edit all its details
* remove a task from the list. The removal is permanent, so a dialog
  will appear to confirm the action.

The number of tasks that can be created is limited to *200*: when the
200th is about to be created or when the limit has already reached, a
banner in the Tasks editor will inform that no new task can be
created. In these cases it is therefore necessary to remove older
tasks to create new ones.

.. card:: Reminders

   Reminders can be added to alert of an approaching deadline. Once a
   date and time is set and the task saved, at the selected time a
   pop-up will show the task's title and priority when you are in the
   |task| module; otherwise, a badge will be shown next to the Tasks
   Module in the primary bar (i.e., the leftmost column). The number
   in the badge shows how many tasks have reached or passed the
   deadline.

   Besides a fixed time, a reminder can be configured to be shown upon
   every login during the expiry day with the following behaviour.

   * It appears at every login, even after the expiration, if the task
     is not marked as *completed*

   * If you do not login during the expiry date will *not* be shown in
     the next days

   In the list of tasks, the deadline is shown in :red:`red` if it
   already passed.
