.PHONY: dry_run_meta dry_run_generator dry_run publish_meta publish_generator publish fix_meta fix_generator fix test_meta test_generator test

# Reusable function for confirmation
define confirm
	@read -p "Are you sure you want to continue? [y/N] " ans; \
	if [ "$$ans" != "y" ] && [ "$$ans" != "Y" ]; then \
		echo "Aborted."; \
		exit 1; \
	fi
endef

# Dry-run targets
dry_run_meta:
	dart pub -C packages/bloc_meta publish --dry-run

dry_run_generator:
	dart pub -C packages/bloc_meta_generator publish --dry-run

dry_run: dry_run_meta dry_run_generator

# Actual publish targets
publish_meta:
	dart test packages/bloc_meta && dart pub -C packages/bloc_meta publish

publish_generator:
	dart test packages/bloc_meta_generator && dart pub -C packages/bloc_meta_generator publish

publish:
	$(confirm)
	@$(MAKE) publish_meta
	@$(MAKE) publish_generator


# Apply dart fix to targets
fix_meta:
	dart fix packages/bloc_meta --apply

fix_generator:
	dart fix packages/bloc_meta_generator --apply

fix:
	$(confirm)
	@$(MAKE) fix_meta
	@$(MAKE) fix_generator

# Run tests for targets
test_meta:
	dart test packages/bloc_meta

test_generator:
	dart test packages/bloc_meta_generator

test:
	$(confirm)
	@$(MAKE) test_meta
	@$(MAKE) test_generator
