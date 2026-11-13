STACK ?= vultr
STACKS := vultr linode
TF := terraform -chdir=stacks/$(STACK)
SHELLCHECK := $(shell command -v shellcheck 2>/dev/null || echo docker run --rm -v "$(CURDIR):/mnt" -w /mnt koalaman/shellcheck:stable)
TEST_IMAGE := devbox-bootstrap-test
TEST_CONTAINER := devbox-bootstrap-test

.PHONY: help fmt fmt-check validate lint schema check test-docker test-docker-clean \
	init plan apply destroy output ssh wait push-secrets

help:
	@echo "make check                  fmt-check + validate + lint + schema"
	@echo "make test-docker            run bootstrap.sh twice in ubuntu:24.04"
	@echo "make plan|apply|destroy     STACK=$(STACK) (vultr or linode)"
	@echo "make wait                   wait for cloud-init to finish on the box"
	@echo "make push-secrets           copy ~/.config/fish/private.fish to the box"

fmt:
	terraform fmt -recursive

fmt-check:
	terraform fmt -recursive -check

validate:
	@for s in $(STACKS); do \
		echo "==> validate stacks/$$s"; \
		terraform -chdir=stacks/$$s init -backend=false -input=false >/dev/null && \
		terraform -chdir=stacks/$$s validate || exit 1; \
	done

lint:
	$(SHELLCHECK) -x bootstrap/bootstrap.sh

# Renders user data with dummy inputs and checks it with cloud-init's schema.
schema:
	@mkdir -p .rendered
	terraform -chdir=test/render init -input=false >/dev/null
	terraform -chdir=test/render apply -auto-approve -input=false >/dev/null
	terraform -chdir=test/render output -raw user_data > .rendered/user-data.yaml
	docker run --rm -v "$(CURDIR)/.rendered:/r:ro" ubuntu:24.04 bash -c \
		'apt-get update -qq >/dev/null && DEBIAN_FRONTEND=noninteractive apt-get install -yqq cloud-init >/dev/null && cloud-init schema --config-file /r/user-data.yaml'

check: fmt-check validate lint schema

# Runs bootstrap twice in a fresh container. The second run must report only ok/skipped.
test-docker:
	docker build -q -t $(TEST_IMAGE) test
	-docker rm -f $(TEST_CONTAINER) >/dev/null 2>&1
	docker run -d --name $(TEST_CONTAINER) -v "$(CURDIR)/bootstrap:/opt/devbox/bootstrap:ro" \
		-e DOTFILES_GITHUB_USER=heypoom $(TEST_IMAGE) sleep infinity
	docker exec $(TEST_CONTAINER) bash -lc /opt/devbox/bootstrap/bootstrap.sh
	docker exec $(TEST_CONTAINER) bash -lc /opt/devbox/bootstrap/bootstrap.sh | tee .rendered/second-run.log
	@! grep -E '^  changed ' .rendered/second-run.log || (echo "second run changed something" && exit 1)
	@echo "==> second run changed nothing"

test-docker-clean:
	-docker rm -f $(TEST_CONTAINER)

init:
	$(TF) init -input=false

plan: init
	$(TF) plan

apply: init
	$(TF) apply

destroy:
	$(TF) destroy

output:
	$(TF) output

ssh:
	$$($(TF) output -raw ssh)

wait:
	$$($(TF) output -raw wait_for_bootstrap)

# Secrets never go through Terraform: they would land in state in plain text.
push-secrets:
	@ip=$$($(TF) output -raw ip); user=$$(echo 'var.username' | $(TF) console | tr -d '"'); \
	scp ~/.config/fish/private.fish $$user@$$ip:.config/fish/private.fish && \
	ssh $$user@$$ip chmod 600 .config/fish/private.fish && echo "==> copied private.fish to $$ip"
