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
	f.write("Player.create(id:"+ str(i) +", email: 'test"+ str(i) +"@example.com', password: Devise.friendly_token[0,20], first_name: 'test', last_name: 'test')\n")
for i in range(n):
	for j in range(n):
		if relations[i][j] == 1:
			f.write("Friend.create(player_id:"+ str(i) +", player2_id:"+ str(j) +")\n")
			f.write("Friend.create(player_id:"+ str(j) +", player2_id:"+ str(i) +")\n")
f.close()

