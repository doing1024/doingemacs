;;; init.el --- 加载完整配置 -*- lexical-binding: t -*-
;;; Commentary:

;; 这是Emacs的初始化文件，负责加载所有配置
;; 配置被分散在多个文件中管理


;;; Code:
;; 解决Package cl is deprecated警告
(setq byte-compile-warnings '(cl-functions))

;; 提高垃圾回收阈值以加快启动速度
(setq gc-cons-threshold (* 40 1000 1000))

;; 设置doingemacs版本号
(setq doingemacs-version "doingemacs 1.0.0")

;; 标记Emacs是否已完成启动
(setq doingemacs-already-startup nil)
;; 添加自定义配置目录到加载路径
(add-to-list 'load-path "~/.emacs.d/user-custom")
(add-to-list 'load-path "~/.emacs.d/config")
(add-to-list 'load-path "~/.emacs.d/config/plugins")

;; 添加第三方库目录到加载路径
(add-to-list 'load-path "~/.emacs.d/site-lisp/inheritenv")
(add-to-list 'load-path "~/.emacs.d/site-lisp/s.el")
(add-to-list 'load-path "~/.emacs.d/site-lisp/language-id")

;; 加载用户自定义配置
(require 'user-custom)

;; 执行初始化前的自定义操作
(user/run-before-init)

;; 加载用户配置
(user/config)

;; 加载基础配置
(require 'basic)
(require 'keys)
(require 'hooks)
(require 'plugin)

;; 加载自定义变量设置
(setq custom-file "~/.emacs.d/config/custom-set-var.el")
(load custom-file)

;; 执行初始化后的自定义操作
(user/run-after-init)

;; 标记Emacs已完成启动
(setq doingemacs-already-startup t)

;; 恢复垃圾回收阈值（当前被注释掉）
(setq gc-cons-threshold (* 2 1000 1000))
(provide 'init)
;;; init.el ends here
