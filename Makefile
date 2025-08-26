# Makefile for Robot Framework

RESULTS_DIR=results

test:
	@echo "🧹 Cleaning old results..."
	@rm -rf $(RESULTS_DIR)
	@echo "🚀 Running Robot Framework tests..."
	@robot -d $(RESULTS_DIR) tests/
	@echo "🌐 Opening report..."
	@open $(RESULTS_DIR)/report.html   # Mac
	# For Linux, replace with: xdg-open $(RESULTS_DIR)/report.html
	# For Windows PowerShell: start $(RESULTS_DIR)/report.html



# Run only login tests
home_page:
	@echo "🧹 Cleaning old results..."
	@rm -rf $(RESULTS_DIR)
	@echo "🚀 Running ONLY login tests..."
	@robot -d $(RESULTS_DIR) tests/homepage/homepage_tests.robot
	@echo "🌐 Opening report..."
	@open $(RESULTS_DIR)/report.html   # Mac
	# For Linux: xdg-open $(RESULTS_DIR)/report.html
	# For Windows PowerShell: start $(RESULTS_DIR)/report.html

# Run only login tests
login:
	@echo "🧹 Cleaning old results..."
	@rm -rf $(RESULTS_DIR)
	@echo "🚀 Running ONLY login tests..."
	@robot -d $(RESULTS_DIR) tests/login/login_tests.robot
	@echo "🌐 Opening report..."
	@open $(RESULTS_DIR)/report.html   # Mac
	# For Linux: xdg-open $(RESULTS_DIR)/report.html
	# For Windows PowerShell: start $(RESULTS_DIR)/report.html
