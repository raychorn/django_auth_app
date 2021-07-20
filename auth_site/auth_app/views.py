from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import render
from django.template import Context
from django.template.loader import get_template
 
def index(request):
    context = {
        'say': 'HAHA'
    }
    return render(request, 'index.html', context)
    #return HttpResponse('This page shows a list of most recent posts.')
