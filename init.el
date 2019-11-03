;;; init.el --- Emacs init.el                        -*- lexical-binding: t; -*-

;; Copyright (C) 2019  Doug Davis

;; Author: Doug Davis <ddavis@ddavis.io>
;; Keywords: local

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; My personal Emacs configuration.

;;; Code:

;; prompt to start server
(fset 'yes-or-no-p 'y-or-n-p)
(when (yes-or-no-p "start server?")
  (server-start))

;; Use .el if it is newer
(when (boundp 'load-prefer-newer)
  (setq load-prefer-newer t))

(when (or (eq system-type 'darwin)
          (eq system-type 'gnu/linux))
  (setq default-directory "~/"))

;; this init.el file is designed to be a symlink to the init.el file
;; in my `emacs.d` git repo.  this ensures the git repo can live
;; anywhere
(add-to-list 'load-path (directory-file-name
                         (file-name-directory
                          (file-truename
                           (concat user-emacs-directory "init.el")))))

(setq custom-file (concat user-emacs-directory "custom.el"))

(setq user-mail-address "ddavis@ddavis.io"
      user-login-name "ddavis"
      user-full-name "Doug Davis")

(require 'ddavis-vars)
(require 'ddavis-package)
(require 'ddavis-utils)
(require 'ddavis-org)
(require 'ddavis-projectile)
(require 'ddavis-helm)
(require 'ddavis-eshell)
(require 'ddavis-company)
(require 'ddavis-vc)
(require 'ddavis-python)
(require 'ddavis-cpp)
(require 'ddavis-tex)
(require 'ddavis-spell)
(require 'ddavis-looks)
(require 'ddavis-misc)

(when ddavis-v-is-mac
  (require 'ddavis-macos))
(when ddavis-v-enable-mu4e
  (require 'ddavis-mu4e))
(when ddavis-v-enable-irc
  (require 'ddavis-irc))
