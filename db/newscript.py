import sys
import re

amigos = dict( ((i, []) for i in range(1000)) )

for line in sys.stdin:
	r = re.match(r'Friend\.create\(player_id:(\d+), player2_id:(\d+)\)',
	             line.strip())
	if r:
		id1, id2 = map(int, r.groups())
		amigos[id1].append(id2)
		amigos[id2].append(id1)

# ---

print "Player.create([" 
for key, value in amigos.items():
	sk, sv = map(str, (key, value))
	print "{id:" + sk + ", email:'test" + sk + "@example.com', password:Devise.friendly_token[0,20], first_name: 'test', last_name: 'test', friend: " + sv + "},"
print ")"
