;; Load Dependencies
(ql:quickload "cl-markdown")
(ql:quickload "str")
(ql:quickload "spinneret")
(ql:quickload "cl-yassg")

;; Load Templates
(load "templates/templates.lisp")

(defpackage #:blog
  (:use #:cl-yassg #:templates))

(in-package #:blog)

(register-template "post" #'templates::post)
(register-template "page" #'templates::page)

(make-site "." "../blog-output/")
