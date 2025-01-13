.. glossary::
   :sorted:

   .. architecture

   Role
     In |product|, a **Role** is a functionality that is considered
     atomic and consists of one or more packages.

   Node
     A **Node** is a physical server or VM on which one or more Roles
     are installed.

   .. Carbonio-related terminology

   CoS
   Class of Service
     A **Class of Service** is a named set of preferences that can be
     assigned to a domain, a user, or a subset of them. Preferences
     include for example the access to features, the default language,
     e-mail composing options, and much more.

   Resource
     A resource is a special kind of account, used to manage the
     availability of a physical resource, such as a meeting room or
     equipment.

     While accessible trough its e-mail address, Resources are not
     meant to send and receive email, but rather for booking
     purposes. Indeed, Meeting Rooms and Equipment are managed within
     Calendar appointments, so when creating an appointment, an e-mail
     is sent to the resource, which will appear as booked to all other
     users for the time reserved for the appointment.

     Usually a resource is configured to automatically accept or deny
     a calendar appointment based on the current calendar status, although
     this action can be delegated this to a manual approver.

   .. user

   Account Alias
   Mail Alias
     An **Account Alias** or *Mail Alias* is a regular e-mail address
     that is used in situations where your real (personal or
     professional) e-mail address can not, or should not, be exposed
     directly. E-mails sent to the alias are delivered to the real
     e-mail address and can be answered to from the same account.

     An account alias differs from functional accounts because it
     forwards e-mails to a specific account and can not be accessed by
     other users. Moreover, an alias does not have a quota limit, but
     the space occupied by email sent to or received by the alias is
     calculated as part of the real e-mail address.

   Appointment
     An **Appointment** is a private or public event defined on a
     calendar, possibly including other users and information
     (location, meeting rooms).

   Attendee
     An **Attendee** is a user (external or internal) that is part of
     an appointment.

   Functional Account
   Shared Account
     A **Functional Account** is an account type intended for
     non-personal uses, that serve for specific purposes. Examples of
     use cases may include the following: HelpDesk activities, Human
     Resources management, Automatic testing result gathering, and so
     on and so forth.

     Functional accounts (also called *Shared* or *Delegated*
     accounts) can be delegated to multiple users and accessed from
     within their personal accounts. Allowed users with access can
     easily see when emails have been read and replied to by others,
     and send or reply to messages from within the functional
     (delegated) account.

   Quota
    The **Quota** can refer to both the amount of data used by an
    account (**Quota Used**) and the maximum amount of space available
    to a user (**Quota Limit**).

    A *Quota Limit* of **0** refers to an unlimited quota, meaning
    that a user can even fill up the whole space available in
    |product|, while a *Quota Usage* of **0** means that the user has
    no data saved within |product| infrastructure.

    User can go “Over quota” - using more space that the available
    because he uploaded a file greater than the available space the
    admin reduced the quota when the space was already in use.

    The *Quota Limit* is very granular could by defined at a Domain,
    CoS, or Account level.

   Rights
     A **Right** is a privilege granted to an account, which allows to
     manage other users.

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

   User Management
     **User Management** is a core component of |product|, whose
     purpose is allow all Roles and services (like for example |task|
     and |file|) to access all the data of a connected user
     (including, but not limited to, name, e-mail address, rights) and
     the data of the other users with whom the user can interact.

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

   .. admins

   Administrator
     An **Administrator** is any :term:`regular user` that can access
     the |adminui|. Depending on the permission they have, they can
     play different Roles and can carry out different activities, for
     example a Domain Administrator can manage all domain-related
     tasks, while a Global Administrator can effectively manage the
     whole |product| infrastructure.

   Global Admin
   Global Administrator
     A **Global Admin** is a user account that has the highest level
     of administrative privileges within |product| and allows the
     user to manage and configure every aspect of |product|. Global
     Administrators have full access to the |adminui| and can manage
     settings across all users, domains, server-level, and global-level
     configurations.
