.. glossary::
   :sorted:

   Role
     In |product|, a **Role** is a functionality that is considered
     atomic and consists of one or more packages.

   Node
     A **Node** is one server or VM on which one or more Roles are
     installed.  A |product| installation consists of one Node
     (*Carbonio Single-Server*) or two or more Nodes (*Carbonio
     Multi-Server*)

   Component
     A **Component** is one of the basic elements of |product|; it is
     a high-level description of a functionality. A more technical
     description of the functionality, including the software packages
     required is provided by :term:`Role`.

   Rights
     A **Right** is a privilege granted to an account, which allows to
     manage other users.

   .. user

   Shared Account
     A **Shared Account** is an account that can be accessed by multiple users.

   Appointment
     An **Appointment** is a private or public event defined on a
     calendar, possibly including other users and information
     (location, meeting rooms).

   Attendee
     An **Attendee** is a user (external or internal) that is part of
     an appointment.

   Smart Link
     A **Smart Link** is a generated URL that, while composing an
     e-mail, replaces an attachment that exceeds the maximum allowed
     size on either the sender or receiver side.  The receiver will be
     able to retrieve the attachment by clicking the URL.

   Regular User
     **Regular User**\ s can access all the modules of |product|, but
     not the |adminui|. Hence, they can read mail, create and share
     documents, plan meetings and event, share and manage e-mail
     addresses and address books, and much more.

   .. certificates

   Wildcard Certificate
     An SSL certificate that is valid for one domain and all of its
     subdomains. For example, a *wildcard certificate* issued for
     domain ``*.example.com`` is valid for all subdomains, including
     ``mail.example.com``, ``www.example.com``, ``blog.example.com``,
     and so on.

   Infrastructure Certificate
     An SSL certificate that is valid for a whole |product|
     infrastructure.

   Domain Certificate
     A **Domain Certificate** is a SSL certificate that is valid for a
     unique domain. You need one domain certificate only if you host
     multiple domains in the same |product| infrastructure.
