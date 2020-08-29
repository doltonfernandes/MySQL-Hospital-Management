#!/usr/bin/python
import MySQLdb
import json
from datetime import date
from random import randint

# Open database connection
db = MySQLdb.connect("localhost","Kalasala","Asdf123*4","Kalasala")

# prepare a cursor object using cursor() method
# abstraction meant for data set traversal
cursor = db.cursor()

def execute_query(query,x):
	try:
	   	# Execute the SQL command

		cursor.execute(query)
		# Commit your changes in the database
		db.commit()

		row = cursor.fetchall()
		if x == 1:
			for r in row:
				print(r)

		rc = cursor.rowcount
		if x == 1:
			print("\nRow count: ", rc)

		return row
	except:
	   	# Rollback in case there is any error
	   	db.rollback()
	   	return "-1"

def make(a):
	a = str(a)
	a = a.replace('(','')
	a = a.replace(')','')
	a = a.replace(',','')
	a = a.replace("'",'')
	return a

def Bill(PID):
	print("\nDoctor Bill = 1000\n")
	TID = execute_query("select Treatment_ID from Treatment where Patient_ID = " + str(PID) + ";",0)
	if TID[0][0] == None:
		TID = 0
	else:
		TID = int(TID[0][0])
	x1 = execute_query("select sum(Price) from Medicine where Medicine_ID in (select Medicine_ID from Bill where Treatment_ID = " + str(TID) + ");",0)
	# print("select Cost from Rooms where Room_ID=(select Room_ID from Patient_1 where Patient_ID = " + str(PID) + ");")
	x2 = execute_query("select Cost from Rooms where Room_ID=(select Room_ID from Patient_1 where Patient_ID = " + str(PID) + ");",0)
	if x1[0][0] == None:
		x1 = 0
	else:
		x1 = int(x1[0][0])
	if x2[0][0] == None:
		x2 = 0
	else:
		x2 = int(x2[0][0])
	print("Medicine Bill = " + str(x1) + "\n")
	print("Room Bill = " + str(x2) + "\n")
	print("Total Bill = " + str(x1+x2+1000) + "\n")

def calculateAge(birthDate): 
    today = date.today() 
    age = today.year - birthDate.year - ((today.month, today.day) < (birthDate.month, birthDate.day)) 
    return age

def Admit_Patient(ID,RID,sex,Fname,Mname,Lname,Address,Phno,DOB,Disease_ID):
	lol = DOB.split("-")
	age = calculateAge(date(int(lol[0]),int(lol[1]),int(lol[2])))
	TID = execute_query("select max(Treatment_ID) from Treatment;",0)
	if TID[0][0] == None or TID[0][0] == 0:
		TID = 1
	else:
		TID = int(TID[0][0]) + 1
	execute_query("INSERT INTO Rooms values ( '" + str(RID) + "' , '" + str(randint(500,1499)) + "' , '" + str(randint(0,4)) + "' );",1);
	mxi = execute_query("select count(Doctor_ID) from Doctor_1;",0)
	if mxi[0][0] == None or mxi[0][0] == 0:
		mxi = 1
	else:
		mxi = int(mxi[0][0])
	DID = randint(1,mxi)
	x1 = execute_query("select Patient_ID from Patient_1 where Patient_ID=" + str(ID) + ";",0)
	if x1 != ():
		print("Patient_ID already present")
		return 0
	execute_query("INSERT INTO Patient_1 values ( '" + str(ID) + "' , '" + str(RID) + "','" + str(DID) + "','" + str(Address) + "','" + str(sex) + "','" + str(Phno) + "','" + str(age) + "','" + str(DOB) + "' , 'Alive');",1)
	execute_query("INSERT INTO Patient_2 values ( '" + str(ID) + "','" + Fname + "','" +  Mname + "','" + Lname + "');",1)
	execute_query("INSERT INTO Illness values ( '" + str(Disease_ID) + "','" + str(ID) + "');",1)
	execute_query("INSERT INTO Treatment values ('" + str(TID) + "','" + str(ID) + "','" + str(randint(1000,1500)) + "','" + str(randint(2,10)) + "');",1)
	New_Bill(DID,0,RID,TID)
	return 0

def Hire_Nurse(ID,RID,Fname,Mname,Lname,sex,Phno,Qual):
	execute_query("insert into Nurse_1 values ( '" + str(ID) + "','" + str(RID) + "','" + sex + "','" + Phno + "' );",1)
	execute_query("insert into Nurse_2 values('" + Fname + "','" + Mname + "','" + Lname + "','" + str(ID) + "');",1)
	for i in Qual:
		execute_query("insert into Nurse_3 values ('" + str(ID) + "','" + i + "' );",1)

def Hire_Doctor(ID,Fname,Mname,Lname,sex,Phno,Class,Qual):
	execute_query("insert into Doctor_1 values('" + str(ID) + "','" + sex + "','" + Phno + "','" + Class + "');",1)
	execute_query("insert into Doctor_2 values('" + str(ID) + "','" + Fname + "','" + Mname + "','" + Lname + "');",1)
	for i in Qual:
		execute_query("insert into Doctor_3 values ('" + str(ID) + "','" + i + "' );",1)
	if Class == "Permanent":
		execute_query("insert into Permanent values ('" + str(ID) + "');",1)
	if Class == "Trainee":
		execute_query("insert into Trainee values ('" + str(ID) + "');",1)
	if Class == "Visiting":
		execute_query("insert into Visiting values ('" + str(ID) + "');",1)

def New_Bill(DId,MId,RId,TId):
	# print("insert into Bill values ('" + str(DId) + "','" + str(MId) + "','" + str(RId) + "','" + str(TId) + "');")
	execute_query("insert into Bill values ('" + str(DId) + "','" + str(MId) + "','" + str(RId) + "','" + str(TId) + "');",1)

def insert_into_table():
	a = execute_query("SHOW TABLES;",0)
	print("\nSelect Table Number\n")
	cnt = 0
	for i in ["Disease","Medicine","Patient_Attender","Rooms"]:
		cnt += 1
		print(str(cnt) + ") " + make(i))
	cnt += 1
	print(str(cnt) + ') Patient')
	cnt += 1
	print(str(cnt) + ') Nurse')
	cnt += 1
	print(str(cnt) + ') Doctor')
	print()
	x = input()
	if x == '':
		print("Invalid Input")
		print()
		return 0
	x = int(x)
	if x==1:
		x=2
	elif x==2:
		x=7
	elif x==3:
		x=13
	elif x==4:
		x=16
	elif x==5:
		x=20
	elif x==6:
		x=21
	elif x==7:
		x=22
	if x == 20:
		print("Enter the following seperated by a space :")
		print("ID , Room_ID , sex , Fname , Mname , Lname , Address , Phno , DOB , Disease_ID")
		inp = input().split()
		if len(inp) != 10:
			print("Invalid Input\n")
			return 0
		Admit_Patient(int(inp[0]),int(inp[1]),inp[2],inp[3],inp[4],inp[5],inp[6],inp[7],inp[8],int(inp[9]))
		return 0
	elif x == 21:
		print("Enter the following seperated by a space :")
		print("ID , RID , Fname , Mname , Lname , sex , Phno , Qualifications")
		inp = input().split()
		if len(inp) < 8:
			print("Invalid Input\n")
			return 0
		arr = []
		for i in range(7,len(inp)):
			arr.append(inp[i])
		Hire_Nurse(int(inp[0]),int(inp[1]),inp[2],inp[3],inp[4],inp[5],inp[6],arr)
		return 0
	elif x == 22:
		print("Enter the following seperated by a space :")
		print("ID , Fname , Mname , Lname , sex , Phno , Class , Qualifications")
		inp = input().split()
		if len(inp) < 8:
			print("Invalid Input\n")
			return 0
		arr = []
		for i in range(7,len(inp)):
			arr.append(inp[i])
		Hire_Doctor(int(inp[0]),inp[1],inp[2],inp[3],inp[4],inp[5],inp[6],arr)
		return 0
	a1 = execute_query("DESCRIBE " + make(a[x-1]) + ";",0)
	print("Enter the values of ",end="")
	for i in a1:
		print(i[0],end=" ")
	print("seperated by a space")
	inp = input().split(" ")
	if len(inp) != len(a1):
		print("Invalid Input\n")
		return 0
	st = "("
	cnt = 0
	for i in inp:
		cnt += 1
		st += "'"
		st += str(i)
		st += "'"
		if cnt == len(inp):
			st += ")"
		else:
			st += ","
	execute_query("INSERT INTO " + make(a[x-1]) + " values " + st + ";",1);

def show():
	a = execute_query("SHOW TABLES;",0)
	print("Select Table Number")
	print()
	cnt = 0
	for i in a:
		cnt += 1
		print(str(cnt) + ") " + make(i))
	print()
	x = input()
	if x == '':
		print("Invalid Input")
		return 0
	x = int(x)
	a1 = execute_query("DESCRIBE " + make(a[x-1]) + ";",0)
	for i in a1:
		print(i[0],end=" ")
	print()
	execute_query("SELECT * FROM " + make(a[x-1]) + ";",1)

def Delete_Medicine(Medicine_ID):
	execute_query("delete from Medicine where Medicine_ID = " + str(Medicine_ID) + ";",1)
	execute_query("delete from Prescription where Medicine_ID = " + str(Medicine_ID) + ";",1)

def Discharge_Patient(Patient_ID):
	execute_query("delete from Patient_1 where Patient_ID = " + str(Patient_ID) + ";",1)
	execute_query("delete from Patient_2 where Patient_ID = " + str(Patient_ID) + ";",1)
	execute_query("delete from Prescription where Patient_ID = " + str(Patient_ID) + ";",1)
	execute_query("delete from Patient_Attender where Patient_ID = " + str(Patient_ID) + ";",1)
	execute_query("delete from Illness where Patient_ID = " + str(Patient_ID) + ";",1)
	execute_query("delete from Bill where Treatment_ID = (select Treatment_ID from Treatment where Patient_ID = " + str(Patient_ID) + ");",1)
	execute_query("delete from Treatment where Patient_ID = " + str(Patient_ID) + ";",1)

def Fire_Doctor(Doctor_ID):
	x = execute_query("select Patient_ID from Patient_1 where Doctor_ID = " + str(Doctor_ID) + ";",0)
	if x != ():
		print("Patient present for doctor cant fire doctor")
	else:
		execute_query("delete from Doctor_1 where Doctor_ID = " + str(Patient_ID) + ";",1)
		execute_query("delete from Doctor_2 where Doctor_ID =" + str(Patient_ID) + ";",1)
		execute_query("delete from Doctor_3 where Doctor_ID = " + str(Patient_ID) + ";",1)

def Fire_Nurse(Nurse_ID):
	execute_query("delete from Nurse_1 where Nurse_ID = " + str(Patient_ID) + ";",1)
	execute_query("delete from Nurse_2 where Nurse_ID = " + str(Patient_ID) + ";",1)
	execute_query("delete from Nurse_3 where Nurse_ID = " + str(Patient_ID) + ";",1)

def delete_all():
	a = execute_query("SHOW TABLES;",0)
	for i in a:
		execute_query("delete from " + make(i) + ";",1)

def delete():
	print("Select Option")
	print("1) Delete Medicine")
	print("2) Discharge Patient")
	print("3) Fire Doctor")
	print("4) Fire Nurse")
	print("5) Delete All Rows from all Tables")
	x = input()
	if x == '':
		print("Invalid Input")
		return 0
	x = int(x)
	if x == 1:
		print("Enter the Medicine ID")
		Delete_Medicine(int(input()))
	elif x == 2:
		print("Enter the Patient ID")
		Discharge_Patient(int(input()))
	elif x == 3:
		print("Enter the Doctor ID")
		Fire_Doctor(int(input()))
	elif x == 4:
		print("Enter the Nurse ID")
		Fire_Nurse(int(input()))
	elif x == 5:
		delete_all()
	return 0

def Update_PatientCondition(PId,Cond):
	execute_query("update Patient_1 SET Condn = '" + Cond + "' WHERE Patient_ID = " + str(PId) + ";",1)

def Update_PatientMedicine(PId,From_Medicine,To_Medicine):
	TId = execute_query("select Treatment_ID from Treatment where Patient_ID = " + str(PId) + ";",0)
	if TId[0][0] == None:
		TId = 0
	else:
		TId = int(TId[0][0])
	if To_Medicine!=0 and From_Medicine!=0:
		execute_query("update Prescription SET Medicine_ID = " + str(To_Medicine) + " WHERE Patient_ID = " + str(PId) + " AND Medicine_ID = " + str(From_Medicine) + ";",1)
		execute_query("update Bill SET Medicine_ID = " + str(To_Medicine) + " WHERE Treatment_ID = " + str(PId) + " AND Medicine_ID = " + str(From_Medicine) + ";",1)
	elif To_Medicine==0 and From_Medicine!=0:
		execute_query("delete from Prescription WHERE Patient_ID = " + str(PId) + " AND Medicine_ID = " + str(From_Medicine) + ";",1)
		execute_query("delete from Bill WHERE Treatment_ID = " + str(TId) + " AND Medicine_ID = " + str(From_Medicine) + ";",1)
	elif To_Medicine!=0 and From_Medicine==0:
		execute_query("insert into Prescription values('" + str(To_Medicine) + "','" + str(PId) + "');",1)
		DId = execute_query("select Doctor_ID from Patient_1 where Patient_ID = " + str(PId) + ";",0)
		RId = execute_query("select Room_ID from Patient_1 where Patient_ID = " + str(PId) + ";",0)

		if DId[0][0] == None:
			DId = 0
		else:
			DId = int(DId[0][0])

		if RId[0][0] == None:
			RId = 0
		else:
			RId = int(RId[0][0])

		execute_query("insert into Bill values('" + str(DId) + "','" + str(To_Medicine) + "','" + str(RId) + "','" + str(TId) +"');",1)
	else:
		print("Error : Both Fields given as 0")

def modify():
	print("\n1) Update Patient Condition\n2) Update Patient Medicine\n")
	inp = input()
	if inp == '':
		print("Invalid Input")
		return 0
	inp = int(inp)
	if inp == 1:
		print("\nEnter Patient_ID and Condition seperated by a space\n")
		inn = input().split(" ")
		if len(inn) != 2:
			print("Invalid Input")
			return 0
		Update_PatientCondition(int(inn[0]),inn[1])
	elif inp == 2:
		print("\nEnter the following seperated by a space :\nPatient_Id , From_Medicine , To_Medicine ( 0 if not present )\n")
		inn = input().split(" ")
		if len(inp) != 3:
			print("Invalid Input")
			return 0
		Update_PatientMedicine(int(inn[0]),int(inn[1]),int(inn[2]))

def Create_Discharge_Summary(PId):
	print("\nPatient Name\n")
	execute_query("select * from Patient_2 where Patient_ID = " + str(PId) + ";",1)
	print("\nPatient Details\n")
	execute_query("select * from Patient_1 where Patient_ID = " + str(PId) + ";",1)
	print("\nDoctor Name\n")
	execute_query("select * from Doctor_2 where Doctor_ID = (select Doctor_ID from Patient_1 where Patient_ID = " + str(PId) + ");",1)
	print("\nPrescription\n")
	execute_query("select * from Prescription where Patient_ID = " + str(PId) + ";",1)
	TID = execute_query("select Treatment_ID from Treatment where Patient_ID = " + str(PId) + ";",0)
	if TID[0][0] == None:
		TID = 0
	else:
		TID = int(TID[0][0])

def Generate_report():
	print("\n1) Generate Discharge Summary\n2) Generate Bill\n")
	x = input()
	if x == '':
		print("Invalid Input")
		return 0
	x = int(x)
	if x == 1:
		print("\nEnter Patient_ID of Patient\n")
		inp = input()
		if inp == '':
			print("Invalid Input")
			return 0
		inp = int(inp)
		Create_Discharge_Summary(inp)
	elif x == 2:
		print("\nEnter Patient_ID of Patient\n")
		inp = input()
		if inp == '':
			print("Invalid Input")
			return 0
		inp = int(inp)
		Bill(inp)
# Main Code here

while True:
	print("\n1) Insert into Table")
	print("2) Modify Row in Table")
	print("3) Delete from Database")
	print("4) Generate Report")
	print("5) Show rows of a table")
	print("6) Exit\n")
	type = input()
	if type == '':
		print("Invalid Input")
		print()
		continue
	type = int(type)
	if type == 1:
		insert_into_table()
	elif type == 2:
		modify()
	elif type == 3:
		delete()
	elif type == 4:
		Generate_report()
	elif type == 5:
		show()
	elif type == 6:
		break
	else:
		print("Invalid Input")
		print()

#close the cursor
cursor.close()
# close the connection
db.close()