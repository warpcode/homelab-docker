STACKS_DIRS := $(shell for p in ./stacks/*; do  echo $$(basename "$$p"); done )

deploy: $(addprefix deploy-,$(SCENARIO_DIRS))

define stacks_template =
    .PHONY: deploy-$(1)

    deploy-$(1):
		cd stacks/$1; docker compose up -d
endef
$(foreach cmpnt,$(STACKS_DIRS),$(eval $(call stacks_template,$(cmpnt))))
