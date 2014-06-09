import random
n = int(raw_input("Numero de usuarios: "))
relations = []
f = open('seeds.rb','w')
for i in range(n):
    friends = []
    for j in range(n):
        if j < i:
            friends.append(0)
        else:
            friends.append(random.choice([0,1]))
    relations.append(friends)
for i in range(n):
	f.write("newplayer = Player.new\nnewplayer.id ="+str(i)+"\nnewplayer.email = 'test"+str(i)+"@example.com'\nnewplayer.password = Devise.friendly_token[0,20]\nnewplayer.first_name = 'test'\nnewplayer.last_name = 'test'\n")
	for j in range(n):
		if (relations[i][j] == 1) or (relations[j][i] == 1):
			f.write("newplayer.friend << '"+str(j)+"'\n")		
	f.write("newplayer.save\n")		
f.close()

