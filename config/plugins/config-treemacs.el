(if doingemacs-enable-treemacs
    (progn (require 'treemacs)
	   (require 'treemacs-file-management)
	   (kb "M-d f t" 'treemacs)))

(provide 'config-treemacs)
