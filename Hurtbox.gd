#We give this a class name so that it can be searched for when we add a node
class_name Hurtbox
extends Area2D
#The collision layer and mask dictates what this area2d can interact with.
#We don't want the hurtboxes/hitboxes to affect or touch the floor, for example.
#That's why we separate hitboxes/hurtboxes and collisions.
#In this case, since the hitboxes/hurtboxes are supposed to affect each other,
#we make sure their layer/mask complement each other. One thing to note though,
#the value we make each equal to is based off bits. You can select an Area2D object
#and hover over the layers to see their value, but it basically goes like this:
#0, 1, 2, 4, 8, 16, 32... etc.
func _init() -> void:
	collision_layer = 0
	collision_mask = 2
	

