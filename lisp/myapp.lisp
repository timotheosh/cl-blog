(load "/home2/althusiu/programs/share/lisp/fcgi-preload.lisp")
(require 'dbi)

(defvar *connection*
  (dbi:connect :sqlite3
                :database-name "/home2/althusiu/myapp.db"))

(defun add-role (role)
  (let* ((query (dbi:prepare *connection*
                             "INSERT INTO clb_roles (clbrole) VALUES (?)"))
         (result (dbi:execute query role)))
    (loop for row = (dbi:fetch result)
         while row
         do (format t "~A~%" row))))

(defun update-role (id role)
  (let* ((query (dbi:prepare *connection*
                             "UPDATE clb_roles SET clbrole = ? WHERE id = ?"))
         (result (dbi:execute query role id)))
    (loop for row = (dbi:fetch result)
         while row
         do (format t "~A~%" row))))

(defun delete-role (id)
  (let* ((query (dbi:prepare *connection*
                             "DELETE FROM clb_roles WHERE id = ?"))
         (result (dbi:execute query id)))
    (loop for row = (dbi:fetch result)
         while row
         do (format t "~A~%" row))))

(defun add-group (group)
  (let* ((query (dbi:prepare *connection*
                             "INSERT INTO clb_group (clbgroup) VALUES (?)"))
         (result (dbi:execute query group)))
    (loop for row = (dbi:fetch result)
         while row
         do (format t "~A~%" row))))

(defun update-group (id group)
  (let* ((query (dbi:prepare *connection*
                             "UPDATE clb_group SET clbgroup = ? WHERE id = ?"))
         (result (dbi:execute query group id)))
    (loop for row = (dbi:fetch result)
         while row
         do (format t "~A~%" row))))

(defun delete-group (id)
  (let* ((query (dbi:prepare *connection*
                             "DELETE FROM clb_group WHERE id = ?"))
         (result (dbi:execute query id)))
    (loop for row = (dbi:fetch result)
         while row
         do (format t "~A~%" row))))

(defun add-user (user)
  (let* ((query (dbi:prepare *connection*
                             "INSERT INTO clb_users (username) VALUES (?)"))
         (result (dbi:execute query user)))
    (loop for row = (dbi:fetch result)
         while row
         do (format t "~A~%" row))))

(defun update-user (id user)
  (let* ((query (dbi:prepare *connection*
                             "UPDATE clb_users SET username = ? WHERE id = ?"))
         (result (dbi:execute query user id)))
    (loop for row = (dbi:fetch result)
         while row
         do (format t "~A~%" row))))

(defun delete-user (id)
  (let* ((query (dbi:prepare *connection*
                             "DELETE FROM clb_users WHERE id = ?"))
         (result (dbi:execute query id)))
    (loop for row = (dbi:fetch result)
         while row
         do (format t "~A~%" row))))

(defun add-user-group (user group)
  (let* ((query (dbi:prepare *connection*
                             "INSERT INTO clb_user_group (user, clbgroup) VALUES (?, ?)"))
         (result (dbi:execute query user group)))
    (loop for row = (dbi:fetch result)
         while row
         do (format t "~A~%" row))))

(defun delete-user-group (user group)
  (let* ((query (dbi:prepare *connection*
                             "DELETE FROM clb_user_group WHERE user = ? AND clbgroup = ?"))
         (result (dbi:execute query user group)))
    (loop for row = (dbi:fetch result)
         while row
         do (format t "~A~%" row))))

(defun add-group-role (group role)
  (let* ((query (dbi:prepare *connection*
                             "INSERT INTO clb_group_roles (clbgroup, clbrole) VALUES (?, ?)"))
         (result (dbi:execute query group role)))
    (loop for row = (dbi:fetch result)
         while row
         do (format t "~A~%" row))))

(defun delete-group-role (group role)
  (let* ((query (dbi:prepare *connection*
                             "DELETE FROM clb_group_roles WHERE clbgroup = ? AND clbrole = ?"))
         (result (dbi:execute query group role)))
    (loop for row = (dbi:fetch result)
         while row
         do (format t "~A~%" row))))
