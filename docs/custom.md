# 定制 DoingEmacs

Doingemacs 中的一切内容均配置在`Emacs 配置文件夹/user-custom/user-custom.el`。
本内容假设您有基本的 Emacs 和 Elisp 知识。

## 基本设置

Doingemacs 允许您配置一些基本内容，这些内容通用于所有插件和位置。

Doingemacs 的基本配置均在`user/config`函数中。

### 字体

如果您想为 Doingemacs 配置单独的字体（而不使用系统默认），那么请您按照以下步骤操作：

1. 将`doingemacs-enable-custom-font`设为 t
2. 取消第 5、6 行的注释
3. 将`doingemacs-default-font`设为您的英文字体。
4. 将`doingemacs-default-cjk-font`设为您的中文字体。

### 代理

如果您的网络环境需要设置代理，那么请您按照以下步骤操作：

1. 将`doingemacs-enable-proxy`设为 t
2. 将 8、9 行取消注释
3. 将`doingemacs-proxy-host`设为您的代理 host,通常是 127.0.0.1 或 localhost
4. 将`doingemacs-proxy-port`设为您的代理端口。

## 内置插件

Doingemacs 内置了许多实用插件，如果您需要，您可以自行开关它们。

### 主题

#### 固定主题

如果您希望使用固定的某个主题，那么请您设置`doingemacs-theme`为您想要的主题。另外，我们为您内置了 atom-one-dark 主题，无需修改配置直接使用。

#### 随机主题

如果您希望每次打开 Emacs 都在特定几个主题中随机选择，那么请您设`doingemacs-enable-random-switch-theme-when-startup`为 t,并修改第 12 行。

### 开头结尾

如果您有 Emacs 使用经验，您会知道，`C-a`会将光标带到行开头，`C-e`会将您带到行结尾。但是有些时候，您想要到达“缩进之后、代码之前”或者“代码之后、注释之前”，使用本插件，按下`C-a`将会移动到代码文字开头，再按一次则是移动到整行的行首，如此反复。

同时，对于`C-e`，当本行代码结尾有注释时，第一次按`C-e` 将光标移动到代码尾部、注释之前。再按一次则是移动到整行的行尾。

### 主页

当您打开 DoingEmacs 时，您会发现一个和默认 Emacs 不同的启动页面，我们称之为“主页”，您可以自定义其内容。

修改 Logo：请将 doingemacs-dashboard-logo 设为您的 logo 路径。
修改标题：请将 doingemacs-dashboard-title 设为您的标题。

### 文件树

Emacs 本身是不推荐也没有默认支持文件树的，但是出于对年轻用户需求的考虑，Doingemacs 内置了文件树的支持，但是默认没有开启。
开启方式：将`doingemacs-enable-treemacs`设为 t。
使用方法：按键`M-d f t`，使用`M-x treemacs-add-project`添加项目

### Ai 编程助手

由于近日(2024.12)Github Copilot 的免费，Doingemacs 使用 Github Copilot 作为 Ai 编程助手。
`doingemacs-enable-copilot`设置助手是否可用（默认为 t）
`doingemacs-enable-copilot-default`设置助手是否默认开启（默认为 nil）
在文件中按`M-d l c`切换助手打开/关闭（仅作用于当前文件）
初始需要`M-x copilot-login`登陆 github。

### 自动保存

如果您曾有一段使用 Emacs 的经历，您也许会对 Emacs 默认的自动保存`#file#`感到厌烦。本功能可以禁用默认的自动保存，并且实现“真正的”自动保存（当手头停下 1s 时自动保存到源文件）。

如果您希望禁用这个功能并使用原有的自动保存，您可以将`doingemacs-enable-auto-save`设为 nil.

### 标签栏

如果您希望有一个类似于 IDE 或者浏览器一样的标签栏（Tabbar），那么您可以使用本插件。

本功能默认开启，如需关闭，请将doingemacs-enable-tab设为nil.

本功能使用的是

#### 快捷键

| 按键      | 功能                |
| --------- | ------------------- |
| C-1~C-0   | 跳转至第1～10个标签 |
| C-tab     | 跳转到下一个标签    |
| C-S-tab   | 跳转到上一个标签    |
| C-M-enter | 关闭当前buffer和tab |

### 多光标

为Doingemacs提供多光标支持。本功能不建议关闭。

#### 快捷键

选中多行后`M-d m l`在每行当前位置新建光标。

选中内容后`M-d m w`为所有匹配的内容添加光标。

`C-S-<mouse-1>`在点击位置添加新光标。

### 代码补全

基于语法的代码补全，使用Lsp，若需要关闭将doingemacs-language-complete设为nil。

DoingEmacs可以使用两种插件中的一个：Eglot（Emacs 28+以上自带，在部分机器上性能较慢，DoingEmacs默认选项）或Lsp-bridge（需要Python,使用多线程，在部分机器上性能较快）.

切换：设置 `doingemacs-languge-complete-use-eglot`为是（t）否(nil)使用Eglot的选项.
设置需要启用的模式：修改doingemacs-language-need-complete中的mode-hook.

#### 使用Eglot

在打开一个新的语言的文件时，插件会提醒您是否需要安装相关的补全后端，请您进行确认。

##### 按键绑定

`M-d l o`手动打开代码补全
`M-d l r`重命名符号

#### 使用Lsp-bridge

补全会自动开启，无需手动调控。第一次使用时需要使用`M-x doingemacs-init-lsp-bridge`安装依赖（需要手动安装Python）.需要将`pip3`加入环境变量。

##### 按键绑定

`M-d l r`重命名符号


### EAF

EAF是一个Emacs的插件，可以在Emacs中使用浏览器、PDF阅读器、视频播放器等功能。Doingemacs中内置对Eaf的支持，默认没有开启任何功能，请您自行开启。如果需要关闭Eaf，请将doingemacs-enable-eaf设为nil。

如果需要开启Eaf功能，请在`user/run-after-init`函数中添加对应的require语句，并且在Doingemacs中按下`M-d e i`进行安装，选择自己需要的包。

### 翻译

Doingemacs内置了翻译功能，使用`M-d t e`并输入内容翻译为英文，`M-d t c`翻译为中文。

## 自定制

当您想要自定义 DoingEmacs时，您可以在`user/run-after-init`和`user/run-after-init`函数中添加自己的配置。

如果您需要安装插件，请您将插件克隆到`user-site-lisp`文件夹中，并在`user/run-after-init`函数中添加对应的require语句（Doingemacs 会自动为您添加load-path,这点无需担心）。
