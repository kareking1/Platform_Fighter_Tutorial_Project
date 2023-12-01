extends StaticBody2D

@export var health := 50
#Check every frame to see if health is <= 0, if so we delete the Enemy
func _process(_delta):
	if health <= 0:
		#"." in this case refers to this script/node itself.
		#Using the $ allows you to get any node within this node
		$".".queue_free()

func take_damage(amount: int) -> void:
	#Make sure health doesn't go below 0
	if health <= amount:
		health = 0
		#These prints can be viewed in the Output tab. You can select it at the bottom
		print("Health left: " + str(health))
	else: 
		health -= amount
		print("Health left: " + str(health))

#Connect the signal from the hurtbox attached to this enemy
#When you use 'area_entered', the parameter is going to be an Area2D.
#The thing is, we don't want any Area2D, we want a hitbox Area2D... therefore,
#we make sure that the parameter is of type Hitbox. This is done with the
#':' symbol. Using that makes sure that the parameter is either the type we declare, or null
func _on_hurtbox_area_entered(hitbox: Hitbox) -> void:
	if hitbox == null:
		return
		
	take_damage(hitbox.damage)
