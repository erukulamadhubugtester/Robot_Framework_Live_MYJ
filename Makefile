# Makefile for Robot Framework

# RESULTS_DIR=results

# test:
# 	@echo "🧹 Cleaning old results..."
# 	@rm -rf $(RESULTS_DIR)
# 	@echo "🚀 Running Robot Framework tests..."
# 	@robot -d $(RESULTS_DIR) tests/
# 	@echo "🌐 Opening report..."
# 	@open $(RESULTS_DIR)/report.html   # Mac
# 	# For Linux, replace with: xdg-open $(RESULTS_DIR)/report.html
# 	# For Windows PowerShell: start $(RESULTS_DIR)/report.html



# # Run only login tests
# home_page:
# 	@echo "🧹 Cleaning old results..."
# 	@rm -rf $(RESULTS_DIR)
# 	@echo "🚀 Running ONLY login tests..."
# 	@robot -d $(RESULTS_DIR) tests/homepage/homepage_tests.robot
# 	@echo "🌐 Opening report..."
# 	@open $(RESULTS_DIR)/report.html   # Mac
# 	# For Linux: xdg-open $(RESULTS_DIR)/report.html
# 	# For Windows PowerShell: start $(RESULTS_DIR)/report.html

# # Run only login tests
# login:
# 	@echo "🧹 Cleaning old results..."
# 	@rm -rf $(RESULTS_DIR)
# 	@echo "🚀 Running ONLY login tests..."
# 	@robot -d $(RESULTS_DIR) tests/login/login_tests.robot
# 	@echo "🌐 Opening report..."
# 	@open $(RESULTS_DIR)/report.html   # Mac
# 	# For Linux: xdg-open $(RESULTS_DIR)/report.html
# 	# For Windows PowerShell: start $(RESULTS_DIR)/report.html


RESULTS_DIR=results
test:
	robot --outputdir results tests/

define CLEAN_RESULTS
	@echo "🧹 Cleaning old results..."
	@python -c "import shutil; shutil.rmtree('$(RESULTS_DIR)', ignore_errors=True)"
endef

define OPEN_REPORT
	@echo "🌐 Opening report..."
	@if [ "$$OS" = "Windows_NT" ]; then \
		start $(RESULTS_DIR)\report.html; \
	elif command -v open >/dev/null 2>&1; then \
		open $(RESULTS_DIR)/report.html; \
	else \
		xdg-open $(RESULTS_DIR)/report.html; \
	fi
endef

test:
	$(CLEAN_RESULTS)
	@echo "🚀 Running Robot Framework tests..."
	@python -m robot -d $(RESULTS_DIR) tests/
	$(OPEN_REPORT)

landing_page:
	$(CLEAN_RESULTS)
	@echo "🚀 Running ONLY home page tests..."
	@python -m robot -d $(RESULTS_DIR) tests/landing_page.robot
	$(OPEN_REPORT)

login:
	$(CLEAN_RESULTS)
	@echo "🚀 Running ONLY login tests..."
	@python -m robot -d $(RESULTS_DIR) tests/login_tests.robot
	$(OPEN_REPORT)


dashboard:
	$(CLEAN_RESULTS)
	@echo "🚀 Running ONLY login tests..."
	@python -m robot -d $(RESULTS_DIR) tests/dashboard_module_test.robot
	$(OPEN_REPORT)

profile:
	$(CLEAN_RESULTS)
	@echo "🚀 Running ONLY login tests..."
	@python -m robot -d $(RESULTS_DIR) tests/profile_module_test.robot
	$(OPEN_REPORT)

vip:
	$(CLEAN_RESULTS)
	@echo "🚀 Running ONLY login tests..."
	@python -m robot -d $(RESULTS_DIR) tests/vip_module_test.robot
	$(OPEN_REPORT)

connections:
	$(CLEAN_RESULTS)
	@echo "🚀 Running ONLY login tests..."
	@python -m robot -d $(RESULTS_DIR) tests/connections_module_test.robot
	$(OPEN_REPORT)


notifications:
	$(CLEAN_RESULTS)
	@echo "🚀 Running ONLY login tests..."
	@python -m robot -d $(RESULTS_DIR) tests/notifications_module_test.robot
	$(OPEN_REPORT)

account_seetings:
	$(CLEAN_RESULTS)
	@echo "🚀 Running ONLY login tests..."
	@python -m robot -d $(RESULTS_DIR) tests/account_seetings_module_test.robot
	$(OPEN_REPORT)

perference_seetings:
	$(CLEAN_RESULTS)
	@echo "🚀 Running ONLY login tests..."
	@python -m robot -d $(RESULTS_DIR) tests/perference_seetings_module_test.robot
	$(OPEN_REPORT)


recent_profile_visitors:
	$(CLEAN_RESULTS)
	@echo "🚀 Running ONLY login tests..."
	@python -m robot -d $(RESULTS_DIR) tests/recent_profile_visitors_test.robot
	$(OPEN_REPORT)



rewards_and_referrals:
	$(CLEAN_RESULTS)
	@echo "🚀 Running ONLY login tests..."
	@python -m robot -d $(RESULTS_DIR) tests/rewards_and_referrals_test.robot
	$(OPEN_REPORT)


help:
	$(CLEAN_RESULTS)
	@echo "🚀 Running ONLY login tests..."
	@python -m robot -d $(RESULTS_DIR) tests/help.robot
	$(OPEN_REPORT)