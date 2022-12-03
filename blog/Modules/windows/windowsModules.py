import os
from blog.views import *
from blog.models import *
from rest_framework.views import APIView

# current_path= os.path.dirname(os.path.abspath(__file__))

# #we need to send request from GUI user with agent(hidden parm) and path(opt)

# class DirectoryListingApi(APIView):
#     def post(self , request):
#         #print(request.data)
#         #data = request.data['agent']
#         agent = request.POST['agent']
#         path = request.POST['path']
#         task = "ls {}".format(path)
#         task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
#         with open(task_path, "w") as f:
#             f.write(task)
#             f.close()
#         return Response(True, status=status.HTTP_200_OK)