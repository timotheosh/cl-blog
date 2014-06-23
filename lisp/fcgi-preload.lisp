(require 'asdf)

(pushnew #P"/home2/althusiu/programs/share/lisp/systems/" asdf:*central-registry* :test #'equal)
(push #P"/home2/althusiu/programs/share/lisp/systems/" asdf:*central-registry*)

;;; The following lines added by ql:add-to-init-file:
#-quicklisp
(let ((quicklisp-init (merge-pathnames "/home2/althusiu/programs/share/quicklisp/setup.lisp"
                                       (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))

(asdf:operate 'asdf:load-op 'sb-fastcgi)
(sb-fastcgi:load-libfcgi "/home2/althusiu/programs/lib/libfcgi.so")
