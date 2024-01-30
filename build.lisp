;; Load Dependencies
(ql:quickload "spinneret")
(ql:quickload "local-time")
(ql:quickload "cl-yassg")

;; Load Templates
(load "templates/templates.lisp")

(defpackage #:blog
  (:use #:cl #:cl-yassg #:templates))

(in-package #:blog)

(exclude-file "README.md")
(exclude-file ".gitignore")
(exclude-file ".DS_Store")
(exclude-file "build.lisp")
(exclude-file "build.sh")

(register-template "home-page" #'templates::home-page)
(register-template "page" #'templates::page)
(register-template "post" #'templates::post)

(make-site "." "../blog-output/")
