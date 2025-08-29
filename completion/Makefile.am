EXTRA_DIST = utimer-completion.bash

# Install bash completion script
if HAVE_BASH_COMPLETION
bashcompletiondir = $(BASH_COMPLETION_DIR)
# Install with the command name for auto-loading
install-data-local:
	$(MKDIR_P) $(DESTDIR)$(bashcompletiondir)
	$(INSTALL_DATA) $(srcdir)/utimer-completion.bash $(DESTDIR)$(bashcompletiondir)/utimer
else
bashcompletiondir = $(sysconfdir)/bash_completion.d
dist_bashcompletion_DATA = utimer-completion.bash
endif
