(load "/home2/althusiu/programs/share/lisp/sbclrc")
(require 'clsql)
(defvar *db* (clsql:connect '("/home2/althusiu/tutorial.db") :database-type :sqlite3))

(clsql:def-view-class employee ()
  ((emplid
    :db-kind :key
    :db-constraints :not-null
    :type integer
    :initarg :emplid)
   (first-name
    :accessor first-name
    :type (string 30)
    :initarg :first-name)
   (last-name
    :accessor last-name
    :type (string 30)
    :initarg :last-name)
   (email
    :accessor employee-email
    :type (string 100)
    :nulls-ok t
    :initarg :email)
   (companyid
    :type integer
    :initarg :companyid)
   (managerid
    :type integer
    :nulls-ok t
    :initarg :managerid)
   (company
      :accessor employee-company
      :db-kind :join
      :db-info (:join-class company
	        :home-key companyid
		:foreign-key companyid
		:set nil))
   (manager
    :accessor employee-manager
    :db-kind :join
    :db-info (:join-class employee
                          :home-key mangerid
                          :foreign-key emplid
                          :set nil)))
  (:base-table employee))

(clsql:def-view-class company ()
  ((companyid
    :db-kind :key
    :db-constraints :not-null
    :type integer
    :initarg :companyid)
   (name
    :type (string 100)
    :initarg :name)
   (presidentid
    :type integer
    :initarg :presidentid)
   (employees
    :reader company-employees
    :db-kind :join
    :db-info (:join-class employee
                          :home-key companyid
                          :foreign-key companyid
                          :set t))
   (president
    :reader president
    :db-kind :join
    :db-info (:join-class employee
                          :home-key presidentid
                          :foreign-key emplid
                          :set nil)))
  (:base-table company))

(clsql:create-view-from-class 'employee)
(clsql:create-view-from-class 'company)

(defvar company1 (make-instance 'company
			      :companyid 1
			      :presidentid 1
			      :name "Widgets Inc."))

(defvar employee1 (make-instance 'employee
			       :emplid 1
			       :first-name "Vladimir"
			       :last-name "Lenin"
			       :email "lenin@soviet.org"
			       :companyid 1))

(defvar employee2 (make-instance 'employee
			       :emplid 2
			       :first-name "Josef"
			       :last-name "Stalin"
			       :email "stalin@soviet.org"
			       :companyid 1
			       :managerid 1))

(clsql:update-records-from-instance employee1)
(clsql:update-records-from-instance employee2)
(clsql:update-records-from-instance company1)

(clsql:locally-enable-sql-reader-syntax)

(format t "The email address of ~A ~A is ~A"
	(first-name employee1)
	(last-name employee1)
	(employee-email employee1))
(setf (employee-email employee1) "lenin-nospam@soviets.org")
(clsql:update-records-from-instance employee1)

(let ((new-lenin (caar (clsql:select 'employee
	                :where [= [slot-value 'employee 'emplid] 1]))))
      (format t "His new email is ~A"
	  (employee-email new-lenin)))
