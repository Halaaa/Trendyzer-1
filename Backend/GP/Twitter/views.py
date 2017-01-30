from django.shortcuts import render
from django.http import HttpResponse
import subprocess
from django.db import connection


def search_form(request):
    return render(request , 'home.html')


def search(request):
   #
   # gpa = request.GET['search']
   # # cursor = connection.cursor()
   # # cursor.execute('SELECT nameStudent FROM student WHERE GPA = '+ gpa +';')
   # # row = cursor.fetchone()
   #
   # bytes = str.encode(gpa)
   # type(bytes)
   # f = open("test.txt", mode='wb', buffering=0)
   # f.write(bytes)
   # f.close()

   # command = 'C:/Program Files/R/R-3.3.1/bin/Rscript'
   #
   # arg = '--vanilla'
   #
   # path2script = 'D:/Fci/GP/Backend/Django/GP/twitter.R'
   #
   # retecode = subprocess.call([command,arg,path2script], shell=True)

   return render(request, 'index.html')




