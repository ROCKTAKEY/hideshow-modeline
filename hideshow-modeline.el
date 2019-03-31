;;; hideshow-modeline.el --- hide/show modeline

;; Copyright (C) 2016 by ROCKTAKEY

;; Author: ROCKTAKEY <ROCKTAKEY@gmail.com>
;; URL:
;; Version: 0.0.2

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;; hs-mode-line-hide : Hide the modeline.
;; hs-mode-line-show : Show the modeline hidden by `hs-mode-line-hide'.
;; hs-mode-line-toggle : Toggle modeline hidden/shown.
;;                       If you use this with C-u, call hs-mode-line-show.

;;; Code:

(defvar hs-mode-line-hist nil)
(make-local-variable 'hs-mode-line-hist)

;;;###autoload
(defun hs-mode-line-hide ()
  "Hide the modeline"
  (interactive)
  (setq hs-mode-line-hist mode-line-format)
  (setq mode-line-format nil))

;;;###autoload
(defun hs-mode-line-show ()
  "Show the modeline hidden by `hs-mode-line-hide'."
  (interactive)
  (setq mode-line-format hs-mode-line-hist)
  (setq hs-mode-line-hist nil))

;;;###autoload
(defun hs-mode-line-toggle (arg)
  "toggle hide-show modelineToggle modeline hidden/shown.
If you use this with C-u, call hs-mode-line-show."
  (interactive "P")
  (if arg
      (hs-mode-line-show)
    (if hs-mode-line-hist
        (hs-mode-line-show)
      (hs-mode-line-hide))))

(provide 'hideshow-modeline)
;;; hideshow-modeline ends here
