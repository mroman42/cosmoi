;;; publish.el --- Publishes Cosmoi.

;;; Commentary:

;;; This is the code I use to generate the my webpage.  It is an
;;; org-publish configuration.


;;; Code:
(require 'ox-publish)

(setq org-publish-project-alist
   '(("posts"
      :base-directory "./posts/"
      :base-extension "org"
      :publishing-directory "./docs/posts/"
      :recursive t
      :publishing-function org-html-publish-to-html
      :headline-levels 4
      :auto-preamble t
      :auto-sitemap t
      :sitemap-title "Blog"
      :sitemap-sort-files chronologically
      :sitemap-date-format "%Y-%m-%d"
      :html-postamble cosmoi-postamble
      )
     ("cosmoi" :components ("posts"))
  ))


;; This function defines the postamble of an exported HTML. It
;; basically substitues the default one by one that says: Last edited
;; 21-10-2019 by Mario Román.
(defun cosmoi-postamble (options)
  (concat "<hr>"
    (format "<p class=\"date\">Last edited %s by Mario Román (<a href=\"https://github.com/mroman42/cosmoi\">code</a>).</p>"
       (format-time-string "%Y-%m-%d %H:%M:%S")
       (car (plist-get options ':author)))))


;; Disables the backgroud on code comments. Haskell comments would
;; show a really dark and difficult to read background otherwise.
(set-face-attribute 'font-lock-comment-face nil :background nil)
