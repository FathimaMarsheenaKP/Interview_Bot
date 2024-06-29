from datetime import datetime
from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
from django.db.models import Q
from django.http import HttpResponse
from django.shortcuts import render, redirect
# Create your views here.
# from .em import camclick
import speech_recognition as sr
import pyttsx3
from .encode_faces import enf
from _thread import start_new_thread
from Int_BOT_app.models import *
cemotion=""
status=True
facelist=[]
uid=0

@login_required(login_url='/')
def Company_Home(request):
    return render(request,'adminindex.html')
def LoginCode(request):
    ob=user_table.objects.all()
    r=[]
    for i in ob:
        r.append([i.id,r"E:\ekc\New folder\Int_BOT\media/"+str(i.photo)])
    # return render(request, 'web.html')
    # enf(r)

    return render(request, 'User/login.html')
def selectqus(request,id,jid):
    # ob = QnA_table.objects.get(id=id)
    request.session['rid']=id
    request.session['jid']=jid
    request.session['qno']=0
    qus=[0,0,0]
    request.session['qus']=qus
    return redirect('/selectqus1')
def selectqus1(request):
    print(request.session['rid'])
    print(request.session['jid'])
    print("======================")
    print("======================")
    print("======================")
    print("======================")
    print (cemotion)
    start_new_thread(camclick, ())
    global uid
    obb=user_table.objects.get(login__id=request.session['lid'])
    uid=obb.id

    request.session['type']='Beginner'
    return render(request, 'User/Qstart.html',{"q":"Introduce Yourself"})
def cb(q1,q2):
    print("++++++++++++++++++++++++######################")
    print("++++++++++++++++++++++++######################")
    print("++++++++++++++++++++++++######################")
    print(q1)
    print(q2)

    print("++++++++++++++++++++++++######################")
    print("++++++++++++++++++++++++######################")
    print("++++++++++++++++++++++++######################")
    import re, math
    WORD = re.compile(r'\w+')

    from collections import Counter
    def text_to_vector(text):
        words = WORD.findall(text)
        return Counter(words)

    def get_cosine(vec1, vec2):
        intersection = set(vec1.keys()) & set(vec2.keys())
        numerator = sum([vec1[x] * vec2[x] for x in intersection])
        sum1 = sum([vec1[x] ** 2 for x in vec1.keys()])
        sum2 = sum([vec2[x] ** 2 for x in vec2.keys()])
        denominator = math.sqrt(sum1) * math.sqrt(sum2)

        if not denominator:
            return 0.0
        else:
            return float(numerator) / denominator
    q1=text_to_vector(q1)
    q2=text_to_vector(q2)
    return get_cosine(q1,q2)

def main1(request):
    global cemotion
    global status
    print(cemotion,"cemotion")
    print(cemotion,"cemotion")
    print(cemotion,"cemotion")
    print(cemotion,"cemotion")
    print(status,"status")
    print(status,"status")
    print(status,"status")
    print(status,"status")

    global facelist
    print(len(facelist))
    print(len(facelist))
    print(len(facelist))
    print("len(facelist)")
    print("len(facelist)")
    print("len(facelist)")
    print("len(facelist)")
    print(len(facelist))
    print(len(facelist))
    print(len(facelist))
    print("len(facelist)")
    print("len(facelist)")
    print("len(facelist)")
    print("len(facelist)")
    if status=="unknown":
        status = "completed"
        return HttpResponse(
            '''<script>alert('Finished unknown face detected');window.location='/ViewRequests'</script>''')
    if len(facelist)>=10:
        status = "completed"
        return HttpResponse('''<script>alert('Finished unknown face detected');window.location='/ViewRequests'</script>''')
    btn=request.POST['btn']
    if btn=='START':
        myt="sorry"
        try:
            r = sr.Recognizer()

            def ST(command):
                en = pyttsx3.init()
                en.say(command)
                en.runAndWait()

            with sr.Microphone() as sourse:
                r.adjust_for_ambient_noise(sourse, duration=0.2)
                audio = r.listen(sourse)

                MyT = r.recognize_google(audio)
                myt = MyT.lower()
                print(myt)
                # ST(myt)
        except Exception as e:
            print(e)
            pass

        return render(request,"User/Qstart.html",{"t":myt})
    else:
        try:
            print (cemotion,"cemotion")
            print (cemotion,"cemotion")
            print (cemotion,"cemotion")
            obr = result_table.objects.filter(request_table__id=request.session['rid'],QnA_table__level=request.session['type'])
            nq=len(obr)
            print(nq,"nq")
            print(nq,"nq")
            print(nq,"nq")
            print(nq,"nq")
            print(request.session['type'])
            qno=int(request.session['qno'])
            if qno+nq==0:
                print(request.session['jid'],"===================================")

                ob = QnA_table.objects.filter(level='Beginner',job_table__id=request.session['jid']).order_by("id")

                print(ob)
                cq=ob[qno]
                request.session['qno'] = 1
                return render(request, 'User/Qstart.html', {"q":cq.questions ,"t":""})

            else:
                mark=0
                if request.session['type']=='Beginner':



                    ob = QnA_table.objects.filter(level='Beginner', job_table__id=request.session['jid']).order_by("id")
                    ans=request.POST['t'].lower()
                    qid=ob[qno+nq-1]
                    oans=ob[qno+nq-1].answers.lower()

                    res=cb(oans,ans)
                    mark=10*res
                elif request.session['type'] == 'Beginner':
                    ob = QnA_table.objects.filter(level='Beginner', job_table__id=request.session['jid']).order_by("id")
                    ans = request.POST['t'].lower()
                    qid = ob[qno+nq - 1]
                    oans = ob[qno+nq - 1].answers.lower()

                    res = cb(oans, ans)
                    mark = 10 * res
                elif request.session['type'] == 'Intermediate':
                    ob = QnA_table.objects.filter(level='Intermediate', job_table__id=request.session['jid']).order_by("id")
                    ans = request.POST['t'].lower()
                    qid = ob[qno+nq - 1]
                    oans = ob[qno+nq - 1].answers.lower()

                    res = cb(oans, ans)
                    mark = 10 * res

                elif request.session['type'] == 'Expert':

                    ob = QnA_table.objects.filter(level='Expert', job_table__id=request.session['jid']).order_by("id")
                    ans = request.POST['t'].lower()
                    qid = ob[qno+nq - 1]
                    oans = ob[qno+nq - 1].answers.lower()

                    res = cb(oans, ans)
                    mark = 10 * res
                obr = result_table()
                obr.request_table = request_table.objects.get(id=request.session['rid'])
                obr.result = ans
                obr.emotion = cemotion
                obr.date = datetime.now()
                obr.mark = mark
                obr.QnA_table = QnA_table.objects.get(id=qid.id)
                qid = ob[qno + nq]
                request.session['qno'] = qno + 1
                obr.save()
                print(mark,"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
                print(mark,"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
                print(mark,"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
                print(mark,"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
                print(mark,"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
                print(mark,"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
                print(mark,"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
                if mark>5:
                    obr=result_table.objects.filter(request_table__id=request.session['rid'],QnA_table__level=request.session['type'],mark__gt=5)
                    if len(obr)>=3:
                        if mark<2:
                            status = "completed"
                            return HttpResponse(
                                '''<script>alert('Finished');window.location='/ViewRequests'</script>''')
                            request.session['type'] = 'Beginner'
                        if request.session['type'] == 'Beginner':
                            request.session['type']='Intermediate'
                            obr = result_table.objects.filter(request_table__id=request.session['rid'],
                                                              QnA_table__level=request.session['type'])
                            nq = len(obr)
                            request.session['qno'] = 1
                            ob = QnA_table.objects.filter(level='Intermediate', job_table__id=request.session['jid']).order_by("id")
                            qid=ob[int(request.session['qno'])+nq-1]

                            return render(request, 'User/Qstart.html', {"q": qid.questions, "t": ""})

                        if request.session['type'] == 'Intermediate':
                            request.session['type']='Expert'
                            obr = result_table.objects.filter(request_table__id=request.session['rid'],
                                                              QnA_table__level=request.session['type'])
                            nq = len(obr)
                            request.session['qno'] = 1
                            ob = QnA_table.objects.filter(level='Expert', job_table__id=request.session['jid']).order_by("id")
                            qid=ob[int(request.session['qno'])+nq-1]
                            return render(request, 'User/Qstart.html', {"q": qid.questions, "t": ""})

                        if request.session['type'] == 'Expert':
                            return HttpResponse('''<script>alert("Completed");window.location="/User_Home"</script>''')

                    else:
                        if request.session['type'] == 'Beginner':
                            request.session['type'] = 'Beginner'
                            obr = result_table.objects.filter(request_table__id=request.session['rid'],
                                                              QnA_table__level=request.session['type'])
                            nq = len(obr)
                            request.session['qno'] = 1
                            ob = QnA_table.objects.filter(level='Beginner',
                                                          job_table__id=request.session['jid']).order_by("id")
                            qid = ob[int(request.session['qno']) + nq - 1]
                            return render(request, 'User/Qstart.html', {"q": qid.questions, "t": ""})

                        if request.session['type'] == 'Intermediate':
                            request.session['type'] = 'Intermediate'
                            obr = result_table.objects.filter(request_table__id=request.session['rid'],
                                                              QnA_table__level=request.session['type'])
                            nq = len(obr)
                            request.session['qno'] = 1
                            ob = QnA_table.objects.filter(level='Intermediate',
                                                          job_table__id=request.session['jid']).order_by("id")
                            qid = ob[int(request.session['qno']) + nq - 1]
                            return render(request, 'User/Qstart.html', {"q": qid.questions, "t": ""})

                        if request.session['type'] == 'Expert':
                            request.session['type'] = 'Expert'
                            if len(obr)>=3:
                                return HttpResponse(
                                    '''<script>alert('Finished');window.location='/ViewRequests'</script>''')

                            obr = result_table.objects.filter(request_table__id=request.session['rid'],
                                                              QnA_table__level=request.session['type'])
                            nq = len(obr)
                            request.session['qno'] = 1
                            ob = QnA_table.objects.filter(level='Expert', job_table__id=request.session['jid']).order_by("id")
                            qid = ob[int(request.session['qno']) + nq - 1]
                            return render(request, 'User/Qstart.html', {"q": qid.questions, "t": ""})

                elif mark<5:


                    if request.session['type'] == 'Beginner':
                        request.session['type']='Beginner'
                        obr = result_table.objects.filter(request_table__id=request.session['rid'],QnA_table__level=request.session['type'])
                        nq = len(obr)
                        request.session['qno'] = 1
                        ob = QnA_table.objects.filter(level='Beginner', job_table__id=request.session['jid']).order_by("id")
                        if int(request.session['qno'])+nq>=5:
                            status = "completed"
                            return HttpResponse(
                                '''<script>alert('Finished');window.location='/ViewRequests'</script>''')
                            request.session['type'] = 'Beginner'
                        qid=ob[int(request.session['qno'])+nq-1]
                        return render(request, 'User/Qstart.html', {"q": qid.questions, "t": ""})

                    if request.session['type'] == 'Intermediate':
                        status = "completed"
                        return HttpResponse(
                            '''<script>alert('Finished');window.location='/ViewRequests'</script>''')
                        request.session['type']='Beginner'
                        obr = result_table.objects.filter(request_table__id=request.session['rid'],
                                                          QnA_table__level=request.session['type'])
                        nq = len(obr)
                        request.session['qno'] = 1
                        if int(request.session['qno'])+nq>=5:
                            return HttpResponse('''<script>alert('Finished');window.location='/ViewRequests'</script>''')
                        ob = QnA_table.objects.filter(level='Beginner', job_table__id=request.session['jid']).order_by("id")
                        qid=ob[int(request.session['qno'])+nq-1]
                        return render(request, 'User/Qstart.html', {"q": qid.questions, "t": ""})

                    if request.session['type'] == 'Expert':
                        try:
                            status = "completed"
                            return HttpResponse(
                                '''<script>alert('Finished');window.location='/ViewRequests'</script>''')
                            request.session['type']='Intermediate'
                            obr = result_table.objects.filter(request_table__id=request.session['rid'],QnA_table__level=request.session['type'])
                            nq = len(obr)
                            request.session['qno'] = 1
                            if int(request.session['qno'])+nq>=5:
                                return HttpResponse('''<script>alert('Finished');window.location='/ViewRequests'</script>''')
                            ob = QnA_table.objects.filter(level='Intermediate', job_table__id=request.session['jid']).order_by("id")
                            qid=ob[int(request.session['qno'])+nq -1]
                            return render(request, 'User/Qstart.html', {"q": qid.questions, "t": ""})
                        except:
                            status = "completed"
                            return HttpResponse(
                                '''<script>alert('Finished');window.location='/ViewRequests'</script>''')

            return render(request, 'User/Qstart.html', {"q": qid.questions, "t": ""})
        except Exception as e:
            print(e,"==================")
            print(e,"==================")
            print(e,"==================")
            print(e,"==================")
            print(e,"==================")
            print(e,"==================")
            print(e,"==================")
            status = "completed"
            return HttpResponse(
                '''<script>alert('Finished');window.location='/ViewRequests'</script>''')

def login(request):
    try:
        uname=request.POST['textfield']
        pswd=request.POST['textfield2']
        ob=login_table.objects.get(username=uname,password=pswd)
        print(ob,"-------------")
        if ob.type == 'admin':
            ob1=auth.authenticate(username='admin',password='admin')
            if ob1 is not None:
                   auth.login(request,ob1)
            return HttpResponse('''<script>alert("welcome");window.location="/Company_Home"</script>''')
        elif ob.type == 'user':
            request.session['lid']=ob.id
            ob1 = auth.authenticate(username='admin', password='admin')
            if ob1 is not None:
                auth.login(request, ob1)
            return HttpResponse('''<script>alert("welcome");window.location="/User_Home"</script>''')
    except:
        return HttpResponse('''<script>alert("invalid");window.location="/"</script>''')

def logout(request):
    auth.logout(request)
    return render(request, 'User/login.html')

@login_required(login_url='/')
def ManageJobSearch(request):
    job = request.POST["textfield"]
    TYPE = request.POST["select1"]
    print(TYPE)
    ob = job_table.objects.filter(type=TYPE,job__icontains=job)
    return render(request, 'Company/manage_job.html',{"val":ob})

@login_required(login_url='/')
def ManageJob(request):
    ob=job_table.objects.all()
    return render(request,'Company/manage_job.html',{"val":ob})

@login_required(login_url='/')
def JobDetail(request,id):
    o = job_details_table.objects.filter(job_table__id=id)
    if len(o) == 0:
        return HttpResponse('''<script>alert("ADD DETAILS");window.location="/ManageJob#about"</script>''')
    else:
        ob=job_details_table.objects.filter(job_table__id=id)
        return render(request,'Company/job_details.html',{'data':ob})

@login_required(login_url='/')
def AddJob(request):
    return render(request,'Company/Add_job.html')

@login_required(login_url='/')
def addjobs(request):
    job=request.POST['textfield']
    Salary =request.POST['textfield2']
    vacancy =request.POST['textfield3']
    type =request.POST['select1']
    ob=job_table()
    ob.job=job
    ob.salary_range=Salary
    ob.number_of_positions=vacancy
    ob.type=type
    ob.save()
    return HttpResponse('''<script>alert("Succesfully Added");window.location="/ManageJob#about"</script>''')


@login_required(login_url='/')
def edit_job(request,id):
    ob=job_table.objects.get(id=id)
    request.session['jid']=ob.id
    return render(request,'Company/edit_job.html',{'val':ob})


@login_required(login_url='/')
def editjob(request):
    job = request.POST['textfield']
    Salary = request.POST['textfield2']
    vacancy = request.POST['textfield3']
    type = request.POST['select1']

    ob = job_table.objects.get(id=request.session['jid'])
    ob.job = job
    ob.salary_range = Salary
    ob.number_of_positions = vacancy
    ob.type = type
    ob.save()
    return HttpResponse('''<script>alert("Succesfully Edited");window.location="/ManageJob#about"</script>''')

@login_required(login_url='/')
def ViewDetails(request,id):
    request.session['jidd'] = id
    ob=job_details_table.objects.filter(job_table__id=id)
    if len(ob)!=0:
        return HttpResponse('''<script>alert("Already Added");window.location='/ManageJob#about'</script>''')
    else:
        return render(request,'Company/add_details.html')

@login_required(login_url='/')
def edit_details(request,id):
    request.session['did']=id
    ob=job_details_table.objects.get(id=id)
    return render(request, 'Company/edit_details.html',{"data":ob})

@login_required(login_url='/')
def edited_details(request):
    det=request.POST['txt']
    ob = job_details_table.objects.get(id=request.session['did'])
    ob.details=det
    ob.save()
    return HttpResponse('''<script>alert("Updated");window.location='/ManageJob#about'</script>''')


@login_required(login_url='/')
def AddDetails(request):
    detail = request.POST['txt']
    ob=job_details_table()
    ob.job_table=job_table.objects.get(id=request.session['jidd'])
    ob.details = detail
    ob.save()
    return HttpResponse('''<script>alert("Succesfully Added");window.location="/ManageJob"</script>''')

@login_required(login_url='/')
def deletejob(request,id):
    ob = job_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert("Succesfully Deleted");window.location="/ManageJob#about"</script>''')

@login_required(login_url='/')
def ManageQnA(request):
    ob = QnA_table.objects.all()
    return render(request, 'Company/Mangae_Q&A.html', {"val": ob})

@login_required(login_url='/')
def ManageQnASearch(request):
    job = request.POST["textfield"]
    ob = QnA_table.objects.filter(job_table__job__icontains=job)
    return render(request, 'Company/Mangae_Q&A.html',{"val":ob})

@login_required(login_url='/')
def AddQnA(request):
    ob=job_table.objects.all()
    return render(request,'Company/Add_Q&A.html',{"val":ob})

@login_required(login_url='/')
def addqns(request):

    job = request.POST['select']
    que = request.POST['textfield']
    ans = request.POST['textfield1']
    level = request.POST['select1']
    ob = QnA_table()
    ob.job_table=job_table.objects.get(id=job)
    ob.questions = que
    ob.answers = ans
    ob.level = level
    ob.save()
    return HttpResponse('''<script>alert("Succesfully Added");window.location="/ManageQnA#about"</script>''')

@login_required(login_url='/')
def edit_qns(request,id):
    ob=QnA_table.objects.get(id=id)
    print(ob)
    request.session['qid']=ob.id
    obb=job_table.objects.all()
    return render(request,'Company/edit_Q&A.html',{'oo':ob,'val':obb})

@login_required(login_url='/')
def editqns(request):
    job = request.POST['select']
    que = request.POST['txt']
    ans = request.POST['txt1']
    level = request.POST['select1']

    ob = QnA_table.objects.get(id= request.session['qid'])
    ob.job_table = job_table.objects.get(id=job)
    ob.questions = que
    ob.answers = ans
    ob.level = level
    ob.save()
    return HttpResponse('''<script>alert("Succesfully Edited");window.location="/ManageQnA#about"</script>''')

@login_required(login_url='/')
def delete_qns(request,id):
    ob=QnA_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert("Succesfully deleted");window.location="/ManageQnA#about"</script>''')


@login_required(login_url='/')
def ViewRequest(request):
    ob = request_table.objects.all()
    return render(request,'Company/View_request.html',{"val3": ob})

@login_required(login_url='/')
def RequestSearch(request):
    date = request.POST["textfield"]
    ob = request_table.objects.filter(date__icontains=date)
    return render(request, 'Company/View_request.html',{"val3":ob})

@login_required(login_url='/')
def ViewProfile(request,id):
    ob = user_table.objects.get(id=id)
    return render(request,'Company/profile_index.html',{"val4": ob})

@login_required(login_url='/')
def RequestAccept(request,id):
    ob = request_table.objects.get(id=id)
    ob.status="Accepted"
    ob.save()
    return HttpResponse('''<script>alert(" Accepted");window.location="/ViewRequest#about"</script>''')

@login_required(login_url='/')
def RequestReject(request,id):
    ob = request_table.objects.get(id=id)
    ob.status="Rejected"
    ob.save()
    return HttpResponse('''<script>alert(" Rejected");window.location="/ViewRequest#about"</script>''')

@login_required(login_url='/')
def ViewComplaint(request):
    ob = complaint_table.objects.all()
    return render(request,'Company/view_complaint.html',{"val5": ob})

@login_required(login_url='/')
def ComplaintSearch(request):
    date = request.POST["textfield"]
    ob = complaint_table.objects.filter(date__icontains=date)
    return render(request, 'Company/view_complaint.html',{"val5":ob})

@login_required(login_url='/')
def ComplaintReply(request,id):
    ob = complaint_table.objects.get(id=id)
    request.session["cid"]=id
    return render(request,'Company/complaint_reply.html',{"val5": ob})

@login_required(login_url='/')
def sendreply(request):
    reply=request.POST["textfield"]
    ob = complaint_table.objects.get(id=request.session["cid"])
    ob.reply=reply
    ob.save()
    return HttpResponse('''<script>alert(" send successfully");window.location="/ViewComplaint#about"</script>''')

@login_required(login_url='/')
def ViewFeedback(request):
    ob = feedback_table.objects.all()
    return render(request,'Company/view_feedback.html',{"val6": ob})

@login_required(login_url='/')
def ViewResult(request):
    data=[]
    lst=[]
    percentage=0
    # for i in ob:
    ob1=request_table.objects.all()
    for k in ob1:
        ob = result_table.objects.filter(request_table__id=k.id)
        if len(ob)>0:
            tm=0
            mymark=0
            for i in ob:

                if i.QnA_table.level=="Beginner":
                    mymark = mymark + int(i.mark)
                    tm=tm+10
                elif i.QnA_table.level=="Intermediate":
                    mymark = mymark + int(i.mark)*2
                    tm=tm+20
                else:
                    mymark = mymark + int(i.mark)*3
                    tm=tm+30
            if tm!=0:
                k.per=(mymark/tm)*100
                percentage=(mymark/tm)*100
            else:
                k.per="Not attended"

                percentage ="No"
            ob={"id":k.id,"sname":k.user_table.fname+""+k.user_table.lname,"job":k.job_table.job,"mark":percentage,"status":k.status}
            data.append(ob)

        print(data,"=====================")
    return render(request,'Company/view_result.html',{"data": data})

@login_required(login_url='/')
def ResultSearch(request):
    job = request.POST["textfield"]
    # ob = result_table.objects.filter(QnA_table__job_table__job__icontains=job)
    data = []
    lst = []
    # for i in ob:
    ob1 = request_table.objects.filter(job_table__job__icontains=job)
    for k in ob1:
        ob = result_table.objects.filter(request_table__id=k.id)
        tm = 0
        mymark = 0
        for i in ob:
            mymark = mymark + int(i.mark)
            if i.QnA_table.level == "Beginner":
                tm = tm + 5
            elif i.QnA_table.level == "Intermediate":
                tm = tm + 10
            else:
                tm = tm + 15
        if tm != 0:
            k.per = (mymark / tm) * 100
        else:
            k.per = "Not attended"
    print(data, "=====================")
    return render(request, 'Company/view_result.html', {"data": ob1})
@login_required(login_url='/')
def ViewMore(request,id):
    request.session['jid']=id
    # ob = result_table.objects.filter(request_table__id=id,request_table__user_table__login__id=request.session['lid'])
    ob = result_table.objects.filter(request_table__id=id)
    print("%%%%%%%%%%%%%%%%%", ob)
    return render(request,'Company/view_more.html',{"val8": ob})

@login_required(login_url='/')
def ResultAccept(request,id):
    # ob = result_table.objects.get(id=id)
    ob=request_table.objects.get(id=id)
    ob.status="Selected"
    ob.save()
    return HttpResponse('''<script>alert(" Accepted");window.location="/ViewResult#about"</script>''')

@login_required(login_url='/')
def ResultReject(request,id):
    ob = request_table.objects.get(id=id)
    ob.status="Rejected"
    ob.save()
    return HttpResponse('''<script>alert(" Rejected");window.location="/ViewResult#about"</script>''')

@login_required(login_url='/')
def User_Home(request):
    return render(request,'User/user_index.html',)

@login_required(login_url='/')
def ViewEditProfile(request):
    ob = user_table.objects.get(login=request.session['lid'])
    return render(request,'User/edit_profile.html',{"val9": ob})

@login_required(login_url='/')
def ViewAddEditProfile(request):
    if 'file' in request.FILES and 'file2' in request.FILES:
        print("+++++++++++++++++++++++++++")
        fname = request.POST['textfield']
        lname = request.POST['textfield2']
        Photo = request.FILES['file']
        FS = FileSystemStorage()
        fn1 = FS.save(Photo.name, Photo)
        Place = request.POST['textfield4']
        Post = request.POST['textfield5']
        Pin = request.POST['textfield6']
        pnumber = request.POST['textfield7']
        CV = request.FILES['file2']
        fn2 = FS.save(CV.name, CV)
        Email = request.POST['textfield9']
        ob1 = user_table.objects.get(login=request.session['lid'])
        ob1.fname = fname
        ob1.lname = lname
        ob1.photo = fn1
        ob1.place = Place
        ob1.post = Post
        ob1.pin = Pin
        ob1.phone_number = pnumber
        ob1.CV = fn2
        ob1.email = Email
        ob1.save()
        return HttpResponse('''<script>alert(" Updated");window.location="/User_Home#about"</script>''')

    elif 'file2' in request.FILES and 'file3' in request.FILES:
        print("------------------------")
        fname = request.POST['textfield']
        lname = request.POST['textfield2']
        FS = FileSystemStorage()
        Place = request.POST['textfield4']
        Post = request.POST['textfield5']
        Pin = request.POST['textfield6']
        pnumber = request.POST['textfield7']
        CV = request.FILES['file2']
        fn2 = FS.save(CV.name, CV)
        Email = request.POST['textfield9']
        Proof = request.FILES['file3']
        fn3 = FS.save(Proof.name, Proof)

        ob1 = user_table.objects.get(login=request.session['lid'])
        ob1.fname = fname
        ob1.lname = lname
        ob1.place = Place
        ob1.post = Post
        ob1.pin = Pin
        ob1.phone_number = pnumber
        ob1.CV = fn2
        ob1.email = Email
        ob1.proof = fn3
        ob1.save()
        return HttpResponse('''<script>alert(" Updated");window.location="/User_Home#about"</script>''')

    elif 'file' in request.FILES and 'file3' in request.FILES:
        print("****************************")
        fname = request.POST['textfield']
        lname = request.POST['textfield2']
        Photo = request.FILES['file']
        FS = FileSystemStorage()
        fn1 = FS.save(Photo.name, Photo)
        Place = request.POST['textfield4']
        Post = request.POST['textfield5']
        Pin = request.POST['textfield6']
        pnumber = request.POST['textfield7']
        Email = request.POST['textfield9']
        Proof = request.FILES['file3']
        fn3 = FS.save(Proof.name, Proof)

        ob1 = user_table.objects.get(login=request.session['lid'])
        ob1.fname = fname
        ob1.lname = lname
        ob1.photo = fn1
        ob1.place = Place
        ob1.post = Post
        ob1.pin = Pin
        ob1.phone_number = pnumber
        ob1.email = Email
        ob1.proof = fn3
        ob1.save()
        return HttpResponse('''<script>alert(" Updated");window.location="/User_Home#about"</script>''')
    elif 'file' in request.FILES:
        print("/////////////////////////")
        fname = request.POST['textfield']
        lname = request.POST['textfield2']
        Photo = request.FILES['file']
        FS = FileSystemStorage()
        fn1 = FS.save(Photo.name, Photo)
        Place = request.POST['textfield4']
        Post = request.POST['textfield5']
        Pin = request.POST['textfield6']
        pnumber = request.POST['textfield7']
        Email = request.POST['textfield9']

        ob1 = user_table.objects.get(login=request.session['lid'])
        ob1.fname = fname
        ob1.lname = lname
        ob1.photo = fn1
        ob1.place = Place
        ob1.post = Post
        ob1.pin = Pin
        ob1.phone_number = pnumber
        ob1.email = Email
        ob1.save()
        return HttpResponse('''<script>alert(" Updated");window.location="/User_Home#about"</script>''')
    elif 'file2' in request.FILES:
        print("$$$$$$$$$$$$$$$$$$$$$$$$$$$")
        fname = request.POST['textfield']
        lname = request.POST['textfield2']
        FS = FileSystemStorage()
        Place = request.POST['textfield4']
        Post = request.POST['textfield5']
        Pin = request.POST['textfield6']
        pnumber = request.POST['textfield7']
        CV = request.FILES['file2']
        fn2 = FS.save(CV.name, CV)
        Email = request.POST['textfield9']

        ob1 = user_table.objects.get(login=request.session['lid'])
        ob1.fname = fname
        ob1.lname = lname
        ob1.place = Place
        ob1.post = Post
        ob1.pin = Pin
        ob1.phone_number = pnumber
        ob1.CV = fn2
        ob1.email = Email
        ob1.save()
        return HttpResponse('''<script>alert(" Updated");window.location="/User_Home#about"</script>''')
    elif 'file3' in request.FILES:
        print("%%%%%%%%%%%%%%%%%%%%%%%%%%")
        fname = request.POST['textfield']
        lname = request.POST['textfield2']
        FS = FileSystemStorage()
        Place = request.POST['textfield4']
        Post = request.POST['textfield5']
        Pin = request.POST['textfield6']
        pnumber = request.POST['textfield7']
        Email = request.POST['textfield9']
        Proof = request.FILES['file3']
        fn3 = FS.save(Proof.name, Proof)

        ob1 = user_table.objects.get(login=request.session['lid'])
        ob1.fname = fname
        ob1.lname = lname
        ob1.place = Place
        ob1.post = Post
        ob1.pin = Pin
        ob1.phone_number = pnumber
        ob1.email = Email
        ob1.proof = fn3
        ob1.save()
        return HttpResponse('''<script>alert(" Updated");window.location="/User_Home#about"</script>''')
    else:
        fname = request.POST['textfield']
        lname = request.POST['textfield2']
        Place = request.POST['textfield4']
        Post = request.POST['textfield5']
        Pin = request.POST['textfield6']
        pnumber = request.POST['textfield7']
        Email = request.POST['textfield9']

        ob1 = user_table.objects.get(login=request.session['lid'])
        ob1.fname = fname
        ob1.lname = lname
        ob1.place = Place
        ob1.post = Post
        ob1.pin = Pin
        ob1.phone_number = pnumber
        ob1.email = Email
        ob1.save()
        return HttpResponse('''<script>alert(" Updated");window.location="/User_Home#about"</script>''')

def Register(request):
    return render(request,'User/reg_index.html')


def Register_post(request):
    fname=request.POST['textfield']
    lname=request.POST['textfield2']
    Photo=request.FILES['file']
    FS=FileSystemStorage()
    fn1=FS.save(Photo.name,Photo)
    Place=request.POST['textfield4']
    Post=request.POST['textfield5']
    Pin=request.POST['textfield6']
    pnumber=request.POST['textfield7']
    CV=request.FILES['file2']
    fn2=FS.save(CV.name,CV)
    Email=request.POST['textfield9']
    Proof=request.FILES['file3']
    fn3=FS.save(Proof.name,Proof)
    Username=request.POST['textfield11']
    Password=request.POST['textfield122']

    ob=login_table()
    ob.username=Username
    ob.password=Password
    ob.type='user'
    ob.save()

    ob1=user_table()
    ob1.login=ob
    ob1.fname=fname
    ob1.lname=lname
    ob1.photo=fn1
    ob1.place=Place
    ob1.post=Post
    ob1.pin=Pin
    ob1.phone_number=pnumber
    ob1.CV=fn2
    ob1.email=Email
    ob1.proof=fn3
    ob1.save()

    return HttpResponse('''<script>alert(" Registered");window.location="/"</script>''')

@login_required(login_url='/')
def EditProfile(request):
    return render(request,'User/edit_profile.html')

@login_required(login_url='/')
def SearchJob(request):
    ob=job_table.objects.all()

    for i in ob:
        oj=request_table.objects.filter(job_table__id=i.id,user_table__login__id=request.session['lid'])
        if len(oj) == 0:
            i.status="pending"
        else:
            i.status="requested"
    return render(request,'User/search_job.html',{"val10": ob})

@login_required(login_url='/')
def JobDetails(request,id):
    request.session['jid']=id
    # try:
    #     ob=job_details_table.objects.get(job_table=id)
    return redirect(JobDetails1)
    # except:
    #     return HttpResponse('''<script>alert(" no details");window.location="/SearchJob#about"</script>''')


@login_required(login_url='/')
def JobDetails1(request):
    try:
        ob=job_details_table.objects.get(job_table=request.session['jid'])
        return render(request,'User/job_name.html',{"val":ob})
    except:
        return HttpResponse('''<script>alert(" no details");window.location="/SearchJob#about"</script>''')


@login_required(login_url='/')
def Job_Search(request):
    job = request.POST["textfield"]
    ob = job_table.objects.filter(job__istartswith=job)
    for i in ob:
        oj = request_table.objects.filter(job_table__id=i.id, user_table__login__id=request.session['lid'])
        if len(oj) == 0:
            i.status = "pending"
        else:
            i.status = "requested"
    return render(request, 'User/search_job.html',{"val10":ob})

@login_required(login_url='/')
def ViewRequests(request):
    ob = request_table.objects.filter(~Q(status="Selected"),user_table__login__id=request.session['lid'])
    for i in ob:
        obb=result_table.objects.filter(request_table__id=i.id)
        if len(obb)>0:
            i.s="1"
        else:
            i.s="0"
    return render(request,'User/view_request.html',{"val11": ob})

@login_required(login_url='/')
def SearchJobRequest(request):
    job = request.POST["textfield"]
    ob = request_table.objects.filter(job_table__job__icontains=job,user_table__login__id=request.session['lid'])
    return render(request, 'User/view_request.html', {"val11": ob})

@login_required(login_url='/')
def SendRequests(request,id):
    ob = request_table()
    ob.user_table=user_table.objects.get(login__id=request.session['lid'])
    ob.job_table=job_table.objects.get(id=id)
    ob.date=datetime.now()
    ob.status = "Requested"
    ob.save()
    return HttpResponse('''<script>alert(" Requested");window.location="/SearchJob#about"</script>''')

@login_required(login_url='/')
def ViewSelectionResult(request):
    # ob = result_table.objects.filter(request_table__user_table__login_id=request.session['lid'])
    # ob1 = result_table.objects.get(QnA_table__job_table__job_id=request.session['jid'])
    ob=request_table.objects.filter(user_table__login=request.session["lid"],status="Selected")
    return render(request,'User/view_selection_result.html', {'val':ob})

@login_required(login_url='/')
def SearchSelectionResultJob(request):
    job = request.POST["textfield"]
    ob = result_table.objects.filter(request_table__user_table__login__id=request.session['lid'],QnA_table__job_table__job__icontains=job)
    return render(request, 'User/view_selection_result.html', {"val": ob})

@login_required(login_url='/')
def SendComplaint(request):
    return render(request,'User/send_complaint.html')

@login_required(login_url='/')
def Send_complaint(request):
    ob = complaint_table()
    ob.user_table = user_table.objects.get(login__id=request.session['lid'])
    ob.date = datetime.now()
    complaint = request.POST["textfield"]
    ob.complaint = complaint
    ob.reply = "pending"
    ob.save()
    return HttpResponse('''<script>alert(" Sent Successfully");window.location="/ViewReply#about"</script>''')

@login_required(login_url='/')
def ViewReply(request):
    ob = complaint_table.objects.filter(user_table__login__id=request.session["lid"])
    return render(request,'User/view_reply.html',{"val":ob})

@login_required(login_url='/')
def SendFeedback(request):
    return render(request,'User/send_feedback.html')

@login_required(login_url='/')
def ViewSendFeedback(request):
    ob = feedback_table()
    ob.user_table = user_table.objects.get(login__id=request.session['lid'])
    ob.date = datetime.now()
    Feedback=request.POST["textfield"]
    Rating=request.POST["textfield2"]

    ob.feedback=Feedback
    ob.rating=Rating
    ob.date=datetime.now()
    ob.save()
    return HttpResponse('''<script>alert(" Sent Successfully");window.location="/User_Home#about"</script>''')


def camclick():
    emotions = ('angry', 'disgust', 'fear', 'confident', 'sad', 'surprise', 'neutral')
    global cemotion
    global uid
    global status
    global facelist
    import cv2
    from keras.models import model_from_json
    from keras.preprocessing import image
    from keras.preprocessing.image import ImageDataGenerator
    import requests
    import numpy as np
    import face_recognition
    import argparse
    import pickle
    import cv2
    model = model_from_json(
        open(r"C:\Users\fathi\OneDrive\Desktop\Project\finalbackup\Int_BOT cam and face (2)\Int_BOT\Int_BOT_app\facial_expression_model_structure.json", "r").read())
    model.load_weights(r"C:\Users\fathi\OneDrive\Desktop\Project\finalbackup\Int_BOT cam and face (2)\Int_BOT\Int_BOT_app\facial_expression_model_weights.h5")  # load weights
    face_cascade = cv2.CascadeClassifier(r"C:\Users\fathi\OneDrive\Desktop\Project\finalbackup\Int_BOT cam and face (2)\Int_BOT\Int_BOT_app\haarcascade_frontalface_default.xml")
    cap = cv2.VideoCapture(0)
    print(uid,"---------------+++++++++++++++++++_______")
    i=0
    data = pickle.loads(open(r'faces.pickles', "rb").read())
    while(True):
        if status=="completed":
            cap.release()
            cv2.destroyAllWindows()
            break
        ret, img = cap.read()

        # img = cv2.imread('../11.jpg')
        # cv2.imwrite(str(i)+".jpg",img)


        cv2.imwrite("a.jpg", img)
        i=i+1

        detected_name = []
        # idddss = imagepath.split('/')

        ap = argparse.ArgumentParser()



        # load the input image and convert it from BGR to RGB
        imagepath = "a.jpg"
        image2 = cv2.imread(imagepath)
        # print(image)
        h, w, ch = image2.shape

        rgb = cv2.cvtColor(image2, cv2.COLOR_BGR2RGB)

        # detect the (x, y)-coordinates of the bounding boxes corresponding
        # to each face in the input image, then compute the facial embeddings
        # for each face

        boxes = face_recognition.face_locations(rgb,
                                                model='hog', )
        encodings = face_recognition.face_encodings(rgb, boxes)

        # initialize the list of names for each face detected
        names = []
        name=""
        type=""

        # loop over the facial embeddings
        for encoding in encodings:
            # attempt to match each face in the input image to our known
            # encodings
            matches = face_recognition.compare_faces(data["encodings"],
                                                     encoding, tolerance=0.4)
            name = "Unknown"
            print(matches)

            # check to see if we have found a match
            if True in matches:
                # find the indexes of all matched faces then initialize a
                # dictionary to count the total number of times each face
                # was matched
                matchedIdxs = [i for (i, b) in enumerate(matches) if b]
                counts = {}

                for i in matchedIdxs:

                    name = data["names"][i]
                    type = data["type"][i]
                    counts[name] = counts.get(name, 0) + 1
                    # print(name, "================")
                    if name not in detected_name:
                        detected_name.append(name)
                print(counts, " rount ")

                name = max(counts, key=counts.get)
                print("result1111111", name,type)
        if len(detected_name)>0:
            if uid not in detected_name:
                status=False
                facelist.append("false")
            else:
                facelist=[]
        else:
            facelist.append("false")
        if len(facelist)>10:
            cap.release()
            cv2.destroyAllWindows()
            status="unknown"
            break

        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

        faces = face_cascade.detectMultiScale(gray, 1.3, 5)


        for (x, y, w, h) in faces:
            cv2.rectangle(img, (x, y), (x + w, y + h), (255, 0, 0), 2)  # draw rectangle to main image

            detected_face = img[int(y):int(y + h), int(x):int(x + w)]  # crop detected face
            detected_face = cv2.cvtColor(detected_face, cv2.COLOR_BGR2GRAY)  # transform to gray scale
            detected_face = cv2.resize(detected_face, (48, 48))  # resize to 48x48

            img_pixels = image.img_to_array(detected_face)
            img_pixels = np.expand_dims(img_pixels, axis=0)

            img_pixels /= 255

            predictions = model.predict(img_pixels)  # store probabilities of 7 expressions

            max_index = np.argmax(predictions[0])

            emotion = emotions[max_index]
            cv2.putText(img, emotion, (x, y - 5), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 0, 0), 2)
            print(emotion)
            cemotion=emotion
