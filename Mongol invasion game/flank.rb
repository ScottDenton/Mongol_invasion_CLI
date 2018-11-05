def attack_flank
  if $flank_counter == 0
    horseman_attacking = (mongols_total / 3) - $mongol_lances
    puts "\n"

    puts """
  You take a move straight out of Ghengis' playbook and send 2/3
  of your men on a diversionary attack whilst your remaining forces
  get into position to flank the enemy.

  The men you held back sneak away out the back of your ranks and
  take a wide arching loop hidden from sight by your main forces.

  As your main force is about to engage the enemy they pull back at the
  last second, confounding the enemy Generals. Whilst the enemies attention
  is on them, your secondary force hits the enemy flank at full power.
    """

    if $mongol_lances > 0
      puts """
  Your #{$mongol_lances} Lancers hit the unprepared enemy and tear
  through their lines. Every Lancer taking down on average 3 enemy soldiers.
  Your horseman attacking with their arrows at the same time.
      """
      $enemy_soldiers -= ($mongol_lances * 3).abs
      $mongol_lances -= ($enemy_archers / 15).abs

    end

    puts """
  Once your horseman come in range of the enemy they immediatelly
  release their arrows. Thankfully you caught them so unprepared
  their archers were undefended as their soldiers were so distracted by
  your primary forces.

  Each Mongol Horseman kills atleast one archer before turning their
  attention to the foot soldiers closest to them.
    """
    archers_lost = horseman_attacking
    $enemy_archers -= archers_lost
    $enemy_soldiers -= horseman_attacking

    $mongol_horsemen -= enemy_total / 35
    puts """
  With the element of surprise lost, your forces withdraw to re group with
  the rest of your army. Hopefully this move was enough to change the
  outcome of this battle, as they wont be caught unprepared again.
    """

    $flank_counter += 1

    remaining

  else
    puts """
  The enemy isnt stupid. You will not catch them unprepared again.
  Try a different strategy
     """

    options
  end
end
