(defpackage #:templates
  (:use #:cl #:cl-yassg #:spinneret))

(in-package #:templates)

(defmacro with-page-string ((&key title type twitter description) &body body)
   `(with-html-string
      (:doctype)
      (:html
        (:head
         (:title ,title)
	 (:link :rel "stylesheet" :href "/assets/default.css")
	 (:meta :name "description" :content ,description)
	 (:meta :name "og:type" :content ,type)
	 (:meta :name "og:title" :content ,title)
	 (:meta :name "dog:description" :content ,description)
	 (:meta :name "twitter:card" :content "summary_large_image")
	 (:meta :name "twitter:site" :content ,twitter)
	 (:meta :name "twitter:creator" :content ,twitter)
	 (:meta :name "twitter:title" :content ,title)
	 (:meta :name "twitter:description" :content ,description)
	 )
        (:body ,@body))))

(defun post (&key title description type twitter body-html date author &allow-other-keys)
  (with-page-string (:title title :type type :twitter twitter :description description)
    (:header 
      (:h1 title)
      (:h4 author))
    (:div (:em date))
    (:section (:raw body-html))))

(defun page (&key title description type twitter body-html &allow-other-keys)
  (with-page-string (:title title :type type :twitter twitter :description description)
    (:header (:h1 title))
    (:section (:raw body-html))))

(defun home-page (&key title description type twitter posts body-html &allow-other-keys)
  (with-page-string (:title title :type type :twitter twitter :description description)
    (:header (:h1 title))
    (:section
     (:div
      :class "posts"
      :style "width: 250px; float: right; border: 1; padding: 20"
      (dolist (post posts)
	(let ((post-vars (cdr post)))
	  (:div
	   :class "post"
	   (:a
	    :href (cdr (assoc "link" post-vars :test #'equal))
	    (:h3 (cdr (assoc "title" post-vars :test #'equal))))
	   (:em (cdr (assoc "description" post-vars :test #'equal)))))))
     (:raw body-html))))
