from __future__ import print_function
import pymysql
import collections
import datetime
from prettytable import PrettyTable
con = pymysql.connect('localhost','root','','instadb')
cur = con.cursor()
ch = 0
while ch!=9:
    print("1. Max Likes\n2. Min Likes\n3. Who Liked Most\n4. Music Pictures\n5. Popular Tag\n6. Most Liked User\n7. Old Tagging\n8. Delete Inactive User\n9. Exit ")
    ch = int(input("Enter Your Choice -: "))
    if ch==1:
    	try:
    		cur.execute("select * from pictures")
    		data = cur.fetchall()
    		t = PrettyTable(['Picture_id','Picture_Path','Date Of Posting','Picture Caption','No. of Likes'])
    		for i in data:
    			t.add_row([i[0],i[1],i[2],i[3],i[4]])
    		print(t)
    		cur.execute("select * from pictures")
    		data = cur.fetchall()
    		maxlikes = None
    		for i in data:
    			if i[4]>maxlikes:
    				maxlikes = i[4]
    				pic_id = i[0]
    		print("Maximum Likes for Picture with id ",pic_id," is ",maxlikes,end="\n\n")
    	except Exception as e:
    		print(e)
    elif ch==2:
    	try:
    		cur.execute("select * from pictures")
    		data = cur.fetchall()
    		t = PrettyTable(['Picture_id','Picture_Path','Date Of Posting','Picture Caption','No. of Likes'])
    		for i in data:
    			t.add_row([i[0],i[1],i[2],i[3],i[4]])
    		print(t)
    		minlikes = data[0][4]
    		for i in data:
    			if i[4]<minlikes:
    				minlikes = i[4]
    				pic_id = i[0]
    		print("Minimum Likes for Picture with id ",pic_id," is ",minlikes,end="\n\n")
    	except Exception as e:
    		print(e)
    elif ch==3:
    	try:
    		cur.execute("select * from likes")
    		data = cur.fetchall()
    		t = PrettyTable(['Picture_id','User_id'])
    		for i in data:
    			t.add_row([i[0],i[1]])
    		print(t)
    		l = []
    		for i in data:
    			l.append(i[1])
    		counter = collections.Counter(l)
    		maxlikes = max(counter.values())
    		for k,v in counter.items():
    			if v==maxlikes:
    				print("User id who liked my pictures most is -: ",k,"\nNumber of likes is -: ",v,end="\n\n")
    	except Exception as e:
    		print(e)
    elif ch==4:
    	try:
    		cur.execute("select * from tags")
    		tagsdata = cur.fetchall()
    		cur.execute("select * from picture_tags")
    		pictagdata = cur.fetchall()
    		t = PrettyTable(['Tag_id','Tag_Name'])
    		for i in tagsdata:
    			t.add_row([i[0],i[1]])
    		print(t,end="\n")
    		t = PrettyTable(['Picture_id','Tag_id'])
    		for i in pictagdata:
    			t.add_row([i[0],i[1]])
    		print(t)
    		l = []
    		for i in tagsdata:
    			if i[1]=='Music':
    				l.append(i[0])
    		for i in l:
    			for j in pictagdata:
    				if i==j[1]:
    					print("Picture id Related to music is -: ",j[0],end="\n")
    	except Exception as e:
    		print(e)
    elif ch==5:
    	try:
    		cur.execute("select * from tags")
    		tagsdata = cur.fetchall()
    		t = PrettyTable(['Tag_id','Tag_Name'])
    		for i in tagsdata:
    			t.add_row([i[0],i[1]])
    		print(t,end="\n")
    		l = []
    		for i in tagsdata:
    			l.append(i[1])
    		counter = collections.Counter(l)
    		popular = max(counter.values())
    		for k,v in counter.items():
    			if popular==v:
    				print("Most Popular Tag is -: ",k,end="\n")
    	except Exception as e:
    		print(e)
    elif ch==6:
    	try:
    		cur.execute("select * from likes")
    		data = cur.fetchall()
    		cur.execute("select * from pictures_posted")
    		picdata = cur.fetchall()
    		t = PrettyTable(['Picture_id','User_id'])
    		for i in data:
    			t.add_row([i[0],i[1]])
    		print(t,end="\n")
    		t = PrettyTable(['User_id','Picture_id'])
    		for i in picdata:
    			t.add_row([i[0],i[1]])
    		print(t,end="\n")
    		l = []
    		for i in data:
    			l.append(i[0])
    		counter = collections.Counter(l)
    		mostlike = max(counter.values())
    		for k,v in counter.items():
    			if mostlike==v:
    				pic_id = k
    		for i in picdata:
    			if pic_id==i[1]:
    				print("pictures (user id) have been liked most -: ",i[0],end="\n")
    	except Exception as e:
    		print(e)
    elif ch==7:
    	d = datetime.datetime.now()
    	cur.execute("select * from pictures")
    	data = cur.fetchall()
    	t = PrettyTable(['Picture_id','Picture_Path','Date Of Posting','Picture Caption','No. of Likes'])
    	for i in data:
    		t.add_row([i[0],i[1],i[2],i[3],i[4]])
    	print(t,end="\n")
    	cur.execute("select * from picture_tags")
    	picdata = cur.fetchall()
    	m = PrettyTable(['Picture_id','Tag_id'])
    	for i in picdata:
    		m.add_row([i[0],i[1]])
    	print(m)
    	l = []
    	pic_id = []
    	print("Current Date is -: ",d,end="\n\n")
    	for i in data:
    		s = str(i[2])
    		if d.year - int(s[:4])>3:
    			pic_id.append(i[0])
    	for i in pic_id:
    		for j in picdata:
    			if i==j[0]:
    				print("Tag id of picture older than 3 years is -: ",j[1])
    	print("\n\n")