# This is not a full-featured Makefile and it is not intended to be used
# to install MWIM package to your system.  Its purposes are:
#
# - to byte-compile "mwim.el" (using 'make') - to make sure that there
#   are no compilation warnings;
#
# - to run the tests (using 'make check').

EMACS = emacs

TOP := $(dir $(lastword $(MAKEFILE_LIST)))
LOAD_PATH = -L $(TOP)
EMACS_BATCH = $(EMACS) -batch -Q $(LOAD_PATH)

ELS = mwim.el
ELCS = $(ELS:.el=.elc)

all: $(ELCS)

%.elc: %.el
	@printf "Compiling $<\n"
	@$(EMACS_BATCH) --eval "\
	  (when (file-exists-p \"$@\")\
	    (delete-file \"$@\"))" \
	-f batch-byte-compile $<

check:
	@$(EMACS_BATCH) --eval "(progn\
	(load-file \"tests/mwim-tests.el\")\
	(ert-run-tests-batch-and-exit))"

clean:
	@printf "Removing *.elc...\n"
	@$(RM) $(ELCS)
