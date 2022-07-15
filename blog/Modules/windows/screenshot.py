import pyautogui

def ScreenShot():
    myScreenshot = pyautogui.screenshot()
    myScreenshot.save(r'F:\test.png')