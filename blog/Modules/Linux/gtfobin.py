from blog.views import *
from blog.models import *

#this function returns a link that will be printed as iframe in the GUI
# for example : <iframe src="https://gtfobins.github.io/gtfobins/find/" width="400" height="400"></iframe>
def gtfo(request, command=''):
    if request.method=='POST':
        gtfobin_url='https://gtfobins.github.io/gtfobins/{}'.format(command)
        return gtfobin_url
    else:
        return render(request, 'blog/listeners.html')
