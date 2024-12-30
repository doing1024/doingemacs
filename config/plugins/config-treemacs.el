(if doingemacs-enable-treemacs
    (progn (require 'treemacs)
	   (kb "M-d f t" 'treemacs)))

(provide 'config-treemacs)
