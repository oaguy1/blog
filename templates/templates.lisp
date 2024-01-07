(defpackage #:templates
  (:use #:cl #:cl-yassg #:spinneret))

(in-package #:templates)

(defmacro with-page-string ((&key title type twitter description) &body body)
   `(with-html-string
      (:doctype)
      (:html
        (:head
         (:title (format nil "Lily Hughes-Robinson - ~A" ,title))
	 (:link :rel "stylesheet" :href "/assets/default.css")
         (:link :rel "stylesheet" :href "https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css")
	 (:meta :charset "utf-8")
	 (:meta :name "viewport" :content "width=device-width, initial-scale=1")
	 (:meta :name "description" :content ,description)
	 (:meta :name "og:type" :content ,type)
	 (:meta :name "og:title" :content ,title)
	 (:meta :name "dog:description" :content ,description)
	 (:meta :name "twitter:card" :content "summary_large_image")
	 (:meta :name "twitter:site" :content ,twitter)
	 (:meta :name "twitter:creator" :content ,twitter)
	 (:meta :name "twitter:title" :content ,title)
	 (:meta :name "twitter:description" :content ,description))
	(:main
	 :class "container"
	 (:nav
	  (:ul
	   (:li (:strong "Lily Hughes-Robinson")))
	  (:ul
	   (:li (:a :href "/" "Home"))
	   (:li (:a :href "/about.html" "About"))))
	 (:body ,@body)))))

(defun post (&key title description type twitter body-html date &allow-other-keys)
  (with-page-string (:title title :type type :twitter twitter :description description)
    (:header
     (:hgroup
      (:h2 title)
      (:h4 description)
      (:h5 date))
     (:section
      (:raw body-html)))))

(defun page (&key title description type twitter body-html &allow-other-keys)
  (with-page-string (:title title :type type :twitter twitter :description description)
    (:header (:h1 title))
    (:section (:raw body-html))))

(defun home-page (&key title description type twitter posts body-html &allow-other-keys)
  (with-page-string (:title title :type type :twitter twitter :description description)
    (:h1 title)
    (:raw body-html)
    (:section
     (:h2 "Posts")
     (dolist (post posts)
       (let ((post-vars (cdr post)))
	 (:section
	  (:hgroup
	   (:a
	    :href (cdr (assoc "link" post-vars :test #'equal))
	    (:strong (cdr (assoc "title" post-vars :test #'equal))))
	   (:br)
	   (:em (cdr (assoc "description" post-vars :test #'equal))))))))))
