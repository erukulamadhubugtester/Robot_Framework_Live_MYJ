---
# Doc link 
https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#why-robot-framework

@@@@@@@@@@@@@@

🖥️ Robot Framework Terminal Commands
1️⃣ Run All Tests
robot tests/

2️⃣ Run A Single Test File
robot tests/login/login_tests.robot

3️⃣ Run A Specific Test Case (inside a file)
robot --test "Login With Valid Credentials" tests/login/login_tests.robot

4️⃣ Run Tests By Tag
robot --include smoke tests/
robot --exclude regression tests/

5️⃣ Set Output Directory (where reports/logs go)
robot -d results tests/

6️⃣ Clean Old Results Automatically (Mac/Linux)
rm -rf results && robot -d results tests/

7️⃣ Run With Variables
robot --variable BROWSER:chrome --variable BASE_URL:https://makeyourjodi.com tests/

8️⃣ Run With Different Browsers
robot -v BROWSER:chrome tests/
robot -v BROWSER:firefox tests/
robot -v BROWSER:edge tests/

9️⃣ Parallel Execution (with pabot)

👉 If you install pabot
:

pabot -d results tests/

🔟 Help / Check Installation
robot --version
python -m robot --version
robot --help

📂 Common Project Commands

# Create virtual environment

python -m venv venv

# Activate venv (Mac/Linux)

source venv/bin/activate

# Activate venv (Windows PowerShell)

venv\Scripts\activate

# Install Robot Framework + SeleniumLibrary

pip install robotframework
pip install robotframework-seleniumlibrary

# Run Robot tests

## robot tests/

---

---

🚀 Robot Framework SeleniumLibrary Commands
🔹 Browser Control
Open Browser https://example.com chrome
Close Browser
Close All Browsers
Maximize Browser Window
Go To https://example.com/home
Reload Page

🔹 Navigation
Go Back
Go To https://example.com/page2
Get Location # returns current URL

🔹 Element Interaction
Click Element xpath=//button[@id="login"]
Double Click Element id=submit
Click Link link=Forgot Password?
Input Text id=username myuser
Input Password id=password secret123
Clear Element Text id=username
Press Keys id=username CTRL+a+DELETE

🔹 Waits
Wait Until Element Is Visible id=loginBtn 10s
Wait Until Element Is Enabled xpath=//input[@id="username"] 5s
Wait Until Page Contains Welcome 15s
Wait Until Page Contains Element xpath=//h1[text()="Dashboard"] 10s
Sleep 3s # (not recommended, only for debugging)

🔹 Assertions / Validations
Page Should Contain Welcome
Page Should Contain Element id=profileLink
Element Should Be Visible xpath=//h1[text()="Login"]
Element Should Be Enabled id=continueBtn
Element Text Should Be id=welcomeMsg Hello User
Element Attribute Value Should Be id=username placeholder Enter username

🔹 Selectors (Dropdowns, Radio, Checkboxes)
Select From List By Label id=country India
Select From List By Value id=gender male
Unselect From List By Label id=country India

Select Radio Button groupname option1
Checkbox Should Be Selected id=agree
Select Checkbox id=agree
Unselect Checkbox id=agree

🔹 Frames & Windows
Select Frame id=iframe1
Unselect Frame
Select Window title=My App
Get Window Titles

🔹 Alerts / Popups
Handle Alert accept
Handle Alert dismiss
Alert Should Be Present Are you sure?

🔹 Screenshots & Logs
Capture Page Screenshot
Capture Element Screenshot id=profilePic
Log To Console This is test log

🔹 Mouse & Keyboard
Mouse Over xpath=//div[@class="menu"]
Mouse Down id=dragItem
Mouse Up id=dropArea
Drag And Drop id=dragItem id=dropArea
Press Keys id=searchBox ENTER

🔹 Useful Utility Keywords
Get Text id=welcomeMsg
Get Title
Get Element Attribute id=username placeholder
Get Value id=phone
Get Element Count xpath=//div[@class="profile-card"]

---
