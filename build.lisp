;; Load Dependencies
(ql:quickload "spinneret")
(ql:quickload "cl-yassg")

;; Load Templates
(load "templates/templates.lisp")

(defpackage #:blog
  (:use #:cl #:cl-yassg #:templates))

(in-package #:blog)

(exclude-file "README.md")

(register-template "page" #'templates::page)
(register-template "post" #'templates::post)

(make-site "." "../blog-output/")
