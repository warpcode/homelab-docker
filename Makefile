 STACKS_DIRS := $(shell for p in ./stacks/*; do  echo $$(basename "$$p"); done )

deploy: $(addprefix deploy-,$(STACKS_DIRS))
stop: $(addprefix stop-,$(STACKS_DIRS))
restart: $(addprefix restart-,$(STACKS_DIRS))
down: $(addprefix down-,$(STACKS_DIRS))

define deploy_template =
    .PHONY: deploy-$(1)

    deploy-$(1):
		cd stacks/$1; docker compose up -d
endef
$(foreach cmpnt,$(STACKS_DIRS),$(eval $(call deploy_template,$(cmpnt))))

define stop_template =
    .PHONY: stop-$(1)

    stop-$(1):
		cd stacks/$1; docker compose down
endef
$(foreach cmpnt,$(STACKS_DIRS),$(eval $(call stop_template,$(cmpnt))))

define restart_template =
    .PHONY: restart-$(1)

    restart-$(1):
		cd stacks/$1; docker compose restart
endef
$(foreach cmpnt,$(STACKS_DIRS),$(eval $(call restart_template,$(cmpnt))))


define down_template =
    .PHONY: down-$(1)

    down-$(1):
		cd stacks/$1; docker compose down
endef
$(foreach cmpnt,$(STACKS_DIRS),$(eval $(call down_template,$(cmpnt))))
