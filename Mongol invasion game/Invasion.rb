$mongol_horsemen = 45000
$mongol_lances = 10000
def mongols_total
  $total_mongols = $mongol_horsemen + $mongol_lances
end

$enemy_soldiers = 150000
$enemy_archers = 50000

def enemy_total
  $total_enemy = $enemy_soldiers + $enemy_archers
end


def welcome
  puts "\n"
  puts "Its the year 1215 AD and you are a General in the army of the great Genghis Khan."
  puts "You have been tasked by Genghis himself to take the Mongol Horde and"
  puts "finally rid the Chin provence of Xia Xia of any remaining resistance."
  puts "\n"
  puts "The Chin emperor has ammassed an army that vastly outnumbers your own."
  puts "Now is your chance to impress Genghis and take your rightful place in the Mongol Empire."
  puts "Are you ready to lead your tumans to victory"
  print "> "
  answer = $stdin.gets.chomp

  if answer.include?("y") || answer.include?("Y")
     opening_scene
  else
    failure
  end
end



def opening_scene
  puts "\n"
  puts "You currently have #{mongols_total} Mongolian Warriors under your command."
  puts "Consisting of #{$mongol_horsemen} Mongolian Horseman, armed with a bow and sword."
  puts "These exceptional bowman have a range advantage over all other archers."
  puts "Assisting them are #{$mongol_lances} Lancers, armed with a large"
  puts "pike and a sword. Exceptional at breaking through the enemy ranks..."
  puts "if they can get close enough."
  puts "\n"

  puts"""
The enemy army consists of #{$enemy_soldiers} foot soldiers and #{$enemy_archers} archers.
With a total army of #{enemy_total}, you will be vastly outnumbered and will have to
rely on clever tactics and skill if you are to survive.
"""
options
end

def options
  puts """
With the enemy remaining in a defensive position, the decision on how to procede is entirely up to you.

Do you
  - Charge straight at the enemy
  - Harass their lines with your archers
  - Try and attack their flank and catch them off guard
  - Run away like a coward
  """
  print "> "
  option = $stdin.gets.chomp

  if option.include?("charge") || option.include?("Charge")
    charge
  elsif option.include?("harass") || option.include?("Harass")
    harass
  elsif option.include?("flank") || option.include?("Flank")
    attack_flank
  else
    failure
  end
end

def remaining
  puts "\n"
  puts "You now have: "
  puts "#{$mongol_horsemen} horeseman left."
  puts "#{$mongol_lances} lancers left."
  puts "\n"
  puts "The enemy has: "
  puts "#{$enemy_soldiers} foot soldiers left."
  puts "#{$enemy_archers} archers left."
  puts "\n"
  puts "Will you attack again ? (Y/N)"
  answer = $stdin.gets.chomp
  if answer == "Y" || answer =="y"
  options
  else
  failure
end
end

def charge
  puts "\n"
  if $mongol_lances > 0
    puts "You decided to charge the enemy head on, with your Lancers up front,"
    puts "followed by the remaining horesemen, with their bows drawn and ready."
  else
    puts "Your Mongol Horesmen charge the enemy head on with the bows drawn and ready."
  end

  puts "\n"
  puts "Your horeseman use the advantage of their mighty bows and stike the enemy foot soldiers"
  puts "before they even reach the enemy lines."
# each mongol horeseman kills one enemy soldier
  puts "Your horseman each release 3 or 4 arrows before they reach the enemy lines"
  puts "The initial vollies kill #{$mongol_horsemen} enemy soldiers, leaving #{$enemy_soldiers - $mongol_horsemen} still on the field of battle."
  puts "Now that your Mongol Warriors have reached the enemy, how will they fare ?"
  puts "\n"
#calculates the remaining enemy soldiers
  $enemy_soldiers = $enemy_soldiers - $mongol_horsemen

#armies initially collide
  if $enemy_archers / 4 < $mongol_lances
    puts "As your army reaches the enemy lines their archers let loose, taking down #{$enemy_archers / 4} of your Lancers "
    $mongol_lances -= ($enemy_archers / 4)
  elsif $mongol_lances == 0
    horseman_lost = ($mongol_lances - ($enemy_archers / 4)).abs
    puts "You lost #{horseman_lost} horseman as they came into range of the enemy archers."
    $mongol_horsemen -= horseman_lost
    $mongol_lances = 0
  else
    horseman_lost = ($mongol_lances - ($enemy_archers / 4)).abs
    puts "The enemy had too many archers and you lost all #{$mongol_lances} of your Lancers and #{horseman_lost} horseman before they were even close enough to use their lances and swords."
    $mongol_horsemen -= horseman_lost
    $mongol_lances = 0
  end

if $mongol_horsemen > 0
  puts "\n"
  puts "Your army took heavy damages: "
  puts "You have #{$mongol_lances} lancers left and #{$mongol_horsemen} horseman left."
  puts "The enemy has #{$enemy_soldiers} foot soldiers and #{$enemy_archers} archers remaining."
  puts "\n"
  puts "Do you still have a large enough force to secure victory."
  puts "This is your last chance to retreat before the two forces collide head on."
  puts "Enter 'Retreat' now if you wish to pull back and re group,"
  puts "otherwise hit 'enter' to see how your remaining forces will fare."
  print "> "
  response = $stdin.gets.chomp
  if response == 'Retreat'|| response == 'retreat'
    horseman_lost = $mongol_horsemen *0.15
    $mongol_horsemen -= horseman_lost.to_i
    puts "In your haste to pull back you lost a further #{horseman_lost.to_i} horseman."
    remaining
  end
  else
    defeat
end

# if you have any lancers remaining
if $mongol_lances > 0
  puts "Your lancers crash through the enemy front lines, each taking 8 enemy down before they too fall"
  if $enemy_soldiers >  $mongol_lances * 8
    $enemy_soldiers = $enemy_soldiers -  $mongol_lances * 8
    $mongol_lances = 0

  else
    $mongol_lances -= ($enemy_soldiers/8)
    archers_lost = $enemy_soldiers - ($mongol_lances * 8)
    $enemy_archers -= archers_lost
    $enemy_soldiers = 0
  end
end

#after lances attack (if any) your horseman go in
puts "mongol horseman: #{$mongol_horsemen}"
puts "enemy soldiers: #{$enemy_soldiers}"
puts "enemy archers: #{$enemy_archers}"
puts "\n"
puts "Your reamining Mongol Horsemen reach the enemy lines."
puts "Your horsemen have an immediate advantage over the enemy foot soldiers."
puts "Each of your #{$mongol_horsemen} mongol horseman takes 3 enemy soldiers with him before he falls."
puts "\n"
#calculate remaining soldiers left on each side after initial meeting.
   soldiers_left = $enemy_soldiers
   $enemy_soldiers -= ($mongol_horsemen *3)
   $mongol_horsemen -= (soldiers_left / 3)

  if $mongol_horsemen <= 0
    puts "Unfortunately the enemy was just too many."
    puts "Perhaps next time you should try weakening the enemy before charging head first at them."
    puts "Well there would be a next time if you weren't dead !!!"
    puts "\n"

    defeat
  end

if $enemy_soldiers > 0
puts "leaving #{$enemy_soldiers} enemy soldiers left"
else
  puts "You manage to wipe out all the enemies remaining foot soldiers."
  puts "and have #{mongols_total} Mongol Warriors left to finish off the enemy"
  puts "The enemies last line of defence is the #{$enemy_archers} archers standing between you and victory."
  $enemy_soldiers = 0
end

puts "\n"
puts "Retreat is no longer an option, your remaining forces push on attacking the enemy wildly."
puts "\n"
archers_defeated = $mongol_horsemen * 5
$mongol_horsemen -= $enemy_soldiers / 3
$mongol_horsemen -= $enemy_archers / 5
$enemy_archers -= archers_defeated

if $mongol_horsemen >= 0
  puts "Congratulations, you have achieved victory. You have #{$mongol_horsemen} soldiers remaining."
  puts "Will it be enough be enough to keep the great Khan happy."
else
  puts "Your remaining forces would have made Genghis proud but there was just too many of them."
  puts "After all you warriors fell:"
  if $enemy_soldiers > 0
    puts "The enemy still has #{$enemy_soldiers} foot soldiers and #{$enemy_archers} archers."
    puts "\n"
    puts "The great Khan will have to come finish what you started himself."
    defeat
  else
      puts "The enemy still has #{$enemy_archers} archers left."
      puts "\n"
      puts "The great Khan will have to come finish what you started himself."
      defeat
    end
  end


puts "\n"
puts "mongol horseman: #{$mongol_horsemen}"
puts "enemy soldiers: #{$enemy_soldiers}"
puts "enemy archers: #{$enemy_archers}"
puts "\n"




  # remaining
end

def harass
  puts "You decided to harass the enemy with your archers"
  remaining
end

def attack_flank
  puts "You attacked their flank"
  remaining
end

def failure
  puts "Genghis was displeased by your disobeiance."
  puts "As a result he killed you and your entire family to make an example."
  puts "The crows and vulchurs will feast for days on your carcass."
  exit(0)
end

def defeat
  puts "You lost all your soldiers."
  puts "You have shamed Genghis and your entire nation."
  puts "Fortunately for you, you died with your men."
  puts "You lose."
  exit(0)
end
