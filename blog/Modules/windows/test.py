import os
current_path= os.path.dirname(os.path.abspath(__file__))
tools_path = os.path.normpath(current_path+os.sep+os.pardir)+"/Tools&Scripts"
print(tools_path)

