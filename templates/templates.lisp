(defpackage #:templates
  (:use #:cl #:cl-yassg #:spinneret :local-time))

(in-package #:templates)

(defmacro with-page-string ((&key title type twitter description) &body body)
   `(with-html-string
      (:doctype)
      (:html
        (:head
         (:title (format nil "Lily Hughes-Robinson - ~A" ,title))
	 (:link :rel "stylesheet" :href "/assets/default.css")
         (:link :rel "stylesheet" :href "https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css")
	 (:link :rel "apple-touch-icon" :sizes "180x180" :href "/apple-touch-icon.png")
	 (:link :rel "icon" :type "image/png" :sizes "32x32" :href "/favicon-32x32.png")
	 (:link :rel "icon" :type "image/png" :sizes "16x16" :href "/favicon-16x16.png")
	 (:link :rel "manifest" :href "/site.webmanifest")
	 (:meta :charset "utf-8")
	 (:meta :name "msapplication-TileColor" :content "#ffd1dc")
	 (:meta :name "theme-color" :content "#ffd1dc")
	 (:meta :name "viewport" :content "width=device-width, initial-scale=1")
	 (:meta :name "description" :content ,description)
	 (:meta :name "og:type" :content ,type)
	 (:meta :name "og:title" :content ,title)
	 (:meta :name "og:description" :content ,description)
	 (:meta :name "twitter:card" :content "summary_large_image")
	 (:meta :name "twitter:site" :content ,twitter)
	 (:meta :name "twitter:creator" :content ,twitter)
	 (:meta :name "twitter:title" :content ,title)
	 (:meta :name "twitter:description" :content ,description)
	 (:script :src "https://kit.fontawesome.com/f0c62b9eac.js" :crossorigin "anonymous")
	 (:script :src "https://www.googletagmanager.com/gtag/js?id=G-VGK954YKYR")
	 (:script
	  "window.dataLayer = window.dataLayer || [];"
	  "function gtag(){dataLayer.push(arguments);}"
	  "gtag('js', new Date());"
	  "gtag('config', 'G-VGK954YKYR');"))
	(:body
	 (:main
	  :class "container"
	  (:nav
	   (:ul
	    (:li (:strong "Lily Hughes-Robinson")))
	   (:ul
	    (:li (:a :href "/" "Home"))
	    (:li (:a :href "/about.html" "About"))
	    (:li (:a :href "https://tech.lgbt/@Lilaclily" (:i :class "fa-brands fa-mastodon")))
	    (:li (:a :href "https://github.com/oaguy1" (:i :class "fa-brands fa-github")))))
	  ,@body)))))

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
  (let ((sorted-posts (sort posts #'local-time:timestamp> :key #'(lambda (x) (local-time:parse-timestring (cdr (assoc "date" (cdr x) :test #'equal)))))))
    (with-page-string (:title title :type type :twitter twitter :description description)
      (:h1 "Welcome")
      (:raw body-html)
      (:section
       (:h2 "Posts")
       (dolist (post sorted-posts)
	 (let ((post-vars (cdr post)))
	   (:article
	    (:a
	     :href (cdr (assoc "link" post-vars :test #'equal))
	     (:strong (cdr (assoc "title" post-vars :test #'equal))))
	    " • "
	    (cdr (assoc "date" post-vars :test #'equal))
	    (:br)
	    (:em (cdr (assoc "description" post-vars :test #'equal))))))))))
