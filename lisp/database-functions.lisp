;; Database functions
(load "/home2/althusiu/programs/share/lisp/fcgi-preload.lisp")
(require 'clsql)
(defvar *db* (clsql:connect '("/home2/althusiu/myapp.db") :database-type :sqlite3))


;; Role table, contianing roles.
(clsql:def-view-class clb_role ()
  ((roleid
    :db-kind :key
    :db-constraints :not-null
    :type integer
    :initarg  roleid)
   (rolename
    :accessor rolename
    :type (string 255)
    :initarg :rolename))
  (:base-table clb_role))

;; Group table, contianing groups.
(clsql:def-view-class clb_group ()
  ((groupid
    :db-kind :key
    :db-constraints :not-null
    :type integer
    :initarg  groupid)
   (groupname
    :accessor groupname
    :type (string 255)
    :initarg :groupname))
  (:base-table clb_group))

;; Table for linking roles to groups.
(clsql:def-view-class clb_group_roles ()
  ((groupid
    :db-kind :key
    :db-constraints :not-null
    :type interger
    :initarg groupid)
   (roleid
    :db-kind :key
    :db-constraints :not-null
    :type integer
    :initarg  roleid)
   (group
    :accessor group-role
    :db-kind :join
    :db-info (:join-class clb_group
                          :home-key groupid
                          :foreign-key groupid
                          :set nil))
   (role
    :accessor role-group
    :db-kind :join
    :db-info (:join clb_role
                    :home-key roleid
                    :foreign-key roleid
                    :set nil)))
  (:base-table clb_group_roles))

(clsql:def-view-class clb_users ()
  ((userid
    :db-kind :key
    :db-constraints :not-null
    :type integer
    :initarg userid)
   (username
    :accessor username
    :type (string 255)
    :db-constraints :not-null
    :initarg username)
   (password
    :accessor password
    :type (string 255)
    :db-constraints :not-null
    :initarg password)
   (email
    :accessor email
    :type (string 255)
    :nulls-ok t
    :initarg email)
   (fullname
    :accessor fullname
    :type (string 255)
    :nulls-ok t
    :initarg fullname))
  (:base-table clb_users))
