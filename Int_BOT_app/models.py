from django.db import models
# Create your models here.
class login_table(models.Model):
    username=models.CharField(max_length=100)
    password=models.CharField(max_length=100)
    type=models.CharField(max_length=100)
class user_table(models.Model):
    login=models.ForeignKey(login_table,on_delete=models.CASCADE)
    fname=models.CharField(max_length=100)
    lname=models.CharField(max_length=100)
    photo=models.FileField()
    place=models.CharField(max_length=100)
    post=models.CharField(max_length=100)
    pin=models.BigIntegerField()
    phone_number=models.BigIntegerField()
    CV=models.FileField()
    email=models.CharField(max_length=100)
    proof=models.FileField()
class job_table(models.Model):
    job=models.CharField(max_length=100)
    salary_range=models.CharField(max_length=100)
    number_of_positions=models.BigIntegerField()
    type=models.CharField(max_length=100)

class job_details_table(models.Model):
    job_table=models.ForeignKey(job_table,on_delete=models.CASCADE)
    details=models.TextField()

class QnA_table(models.Model):
    job_table=models.ForeignKey(job_table,on_delete=models.CASCADE)
    questions=models.TextField()
    answers=models.TextField()
    level=models.CharField(max_length=100)

class request_table(models.Model):
    user_table=models.ForeignKey(user_table,on_delete=models.CASCADE)
    job_table=models.ForeignKey(job_table,on_delete=models.CASCADE)
    date=models.DateField()
    status=models.CharField(max_length=100)

class complaint_table(models.Model):
    user_table=models.ForeignKey(user_table,on_delete=models.CASCADE)
    complaint=models.CharField(max_length=100)
    date=models.DateField()
    reply=models.CharField(max_length=100)


class feedback_table(models.Model):
    user_table=models.ForeignKey(user_table,on_delete=models.CASCADE)
    feedback=models.CharField(max_length=100)
    rating=models.FloatField()
    date=models.DateField()

class result_table(models.Model):
    request_table=models.ForeignKey(request_table,on_delete=models.CASCADE)
    result=models.TextField()
    date=models.DateField()
    QnA_table=models.ForeignKey(QnA_table,on_delete=models.CASCADE)
    emotion=models.CharField(max_length=100)
    mark=models.FloatField()
    status=models.CharField(max_length=100)







































