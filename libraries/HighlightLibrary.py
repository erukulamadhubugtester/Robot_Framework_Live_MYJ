import time
from robot.api.deco import keyword
from SeleniumLibrary import SeleniumLibrary


class HighlightLibrary(SeleniumLibrary):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def _highlight(self, element):
        """Highlight element with red border and yellow background."""
        driver = self.driver  # ✅ use public driver attribute
        driver.execute_script(
            "arguments[0].setAttribute('style', arguments[0].getAttribute('style') + "
            "'; border: 3px solid red !important');",
            element,
        )
        time.sleep(0.5)

    @keyword("Highlight Element")
    def highlight_element(self, locator):
        """Highlight element by locator."""
        element = self.find_element(locator)
        self._highlight(element)
