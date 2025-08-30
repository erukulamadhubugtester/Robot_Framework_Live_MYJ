# import time
# from robot.api.deco import keyword
# from SeleniumLibrary import SeleniumLibrary


# class HighlightLibrary(SeleniumLibrary):
#     def __init__(self, *args, **kwargs):
#         super().__init__(*args, **kwargs)

#     def _highlight(self, element):
#         """Highlight element with red border and yellow background."""
#         driver = self.driver  # ✅ use public driver attribute
#         driver.execute_script(
#             "arguments[0].setAttribute('style', arguments[0].getAttribute('style') + "
#             "'; border: 3px solid red !important');",
#             element,
#         )
#         time.sleep(0.5)

#     @keyword("Highlight Element")
#     def highlight_element(self, locator):
#         """Highlight element by locator."""
#         element = self.find_element(locator)
#         self._highlight(element)

import time
from robot.api.deco import keyword

# NOTE: do not import BuiltIn globally at the top
# because libdoc loads libraries outside Robot runtime


class HighlightLibrary:

    def __init__(self):
        self.sl = None  # SeleniumLibrary instance (lazy loaded)

    def _get_selenium_library(self):
        """Fetch SeleniumLibrary instance only when Robot is running."""
        if not self.sl:
            from robot.libraries.BuiltIn import BuiltIn

            self.sl = BuiltIn().get_library_instance("SeleniumLibrary")
        return self.sl

    def _highlight(self, element, driver):
        """Highlight element with red border and yellow background."""
        driver.execute_script(
            "arguments[0].setAttribute('style', arguments[0].getAttribute('style') + "
            "'; border: 3px solid red !important;');",
            element,
        )
        time.sleep(0.3)

    @keyword("Highlight Element")
    def highlight_element(self, locator):
        """Highlight element by locator using SeleniumLibrary driver."""
        sl = self._get_selenium_library()
        driver = sl.driver
        element = sl.find_element(locator)
        self._highlight(element, driver)
