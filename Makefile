# SHELL=/bin/bash

# .PHONY: build

# .PHONY: pylint
# # Run "black", our Python formatter, to verify that our source files
# # are properly formatted. Does not modify any files. Returns with a non-zero
# # status if anything is not properly formatted. (This isn't really
# # "linting"; we're not checking anything but code style.)
# pylint:
# 	if command -v "black" > /dev/null; then \
# 		$(BLACK) --check docs/ ; \
# 		$(BLACK) --check examples/ ; \
# 		$(BLACK) --check lib/streamlit/ --exclude=/*_pb2.py$/ ; \
# 		$(BLACK) --check lib/tests/ ; \
# 		$(BLACK) --check e2e/scripts/ ; \
# 	fi

# .PHONY: pyformat
# # Run "black", our Python formatter, to fix any source files that are not
# # properly formatted.
# pyformat:
# 	if command -v "black" > /dev/null; then \
# 		$(BLACK) docs/ ; \
# 		$(BLACK) examples/ ; \
# 		$(BLACK) lib/streamlit/ --exclude=/*_pb2.py$/ ; \
# 		$(BLACK) lib/tests/ ; \
# 		$(BLACK) e2e/scripts/ ; \
# 	fi


# .PHONY: pytest
# # Run Python unit tests.
# pytest:
# 	# Just testing. No code coverage.
# 	cd lib; \
# 		PYTHONPATH=. \
# 		pytest -v \
# 			--junitxml=test-reports/pytest/junit.xml \
# 			-l tests/ \
# 			$(PYTHON_MODULES)

# .PHONY: pycoverage
# # Show Python test coverage.
# pycoverage:
# 	# testing + code coverage
# 	cd lib; \
# 		PYTHONPATH=. \
# 		pytest -v \
# 			--junitxml=test-reports/pytest/junit.xml \
# 			-l $(foreach dir,$(PYTHON_MODULES),--cov=$(dir)) \
# 			--cov-report=term-missing tests/ \
# 			$(PYTHON_MODULES)

# .PHONY: deploy
# deploy:
# 	curl --netrc -X PATCH https://api.heroku.com/apps/$(APP)/formation \
#           -d '{
# 				"updates": [
# 					{
# 						"type": "web",
# 								"docker_image": "'"${IMAGE_ID}"'"
# 						}
# 					]}' \
#     -H "Content-Type: application/json" \
# 	-H "Accept: application/vnd.heroku+json; version=3.docker-releases"\
# 	-H "Authorization: Bearer ${HEROKU_KEY}"