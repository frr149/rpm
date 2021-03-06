﻿:NameSpace rpm_tests

      window_sees_3_by_3_TEST←{
          #.UT.expect←↑(0 0 0)(0 0 0)(0 0 0)
          b←#.rpm.new_board
          #.rpm.window b
      }
      
      vertical_staff_TEST←{
          #.UT.expect←↑(1 0 0)(1 0 0)(1 0 0)
          b←'vertical staff'#.rpm.shape(4 4)
          #.rpm.window b
      }
      
      horizontal_staff_TEST←{
          #.UT.expect←↑(1 1 1)(0 0 0)(0 0 0)
          b←'horizontal staff'#.rpm.shape(4 4)
          #.rpm.window b
      }
      
      square_TEST←{
          #.UT.expect←↑(1 1 0)(1 1 0)(0 0 0)
          b←'square'#.rpm.shape(4 4)
          #.rpm.window b
      }
                                                
      corners_TEST←{
          #.UT.expect←↑(1 0 1)(0 0 0)(1 0 1)
          b←'corners'#.rpm.shape(4 4)
          #.rpm.window b
      }
      
      layers_can_be_merged_TEST←{
          #.UT.expect←↑(0 1 0)(1 1 1)(0 1 0)
          l1←'vertical staff'#.rpm.shape(4 5)
          l2←'horizontal staff'#.rpm.shape(5 4)
          b←#.rpm.merge l1 l2
          #.rpm.window b
      }
      
      merged_layers_are_represented_with_filled_squares_TEST←{
          #.UT.expect←↑'■□■' '□□□' '■□■'
          b←'corners'#.rpm.shape(4 4)
          #.rpm.represent #.rpm.window b
      }

      layers_can_be_superimposed_TEST←{
          #.UT.expect←↑(0 2 0)(3 5 3)(0 2 0)
          l1←'vertical staff'#.rpm.shape(4 5)
          l2←'horizontal staff'#.rpm.shape(5 4)
          b←#.rpm.superimpose l1 l2
          #.rpm.window b
      }
      
      superimposed_layers_are_represented_with_grids_TEST←{
          #.UT.expect←↑'□▤□' '▥▦▥' '□▤□'
          #.rpm.represent↑(0 2 0)(3 5 3)(0 2 0)
      }
      
      move_layers_TEST←{
          #.UT.expect←↑(1 0 0)(1 0 1)(0 0 1)
          l1←'vertical staff'#.rpm.shape(2 4)
          l2←'vertical staff'#.rpm.shape(6 6)
          b←(¯1 0)(1 0)#.rpm.move l1 l2
          #.rpm.window #.rpm.merge b
      }
      
      merged_sequence_generated_TEST←{
          s1←↑(1 0 0)(0 0 0)(0 0 1)
          s2←↑(1 0 0)(1 0 1)(0 0 1)
          s3←↑(1 0 1)(1 0 1)(1 0 1)
          #.UT.expect←s1 s2 s3
          l1←'vertical staff'#.rpm.shape(2 4)
          l2←'vertical staff'#.rpm.shape(6 6)
          #.rpm.window¨(¯1 0)(1 0)#.rpm.merge_sequence l1 l2
      }
      
      superimposed_sequence_generated_TEST←{
          s1←↑(2 0 0)(0 0 0)(0 0 3)
          s2←↑(2 0 0)(2 0 3)(0 0 3)
          s3←↑(2 0 3)(2 0 3)(2 0 3)
          #.UT.expect←s1 s2 s3
          l1←'vertical staff'#.rpm.shape(2 4)
          l2←'vertical staff'#.rpm.shape(6 6)
          #.rpm.window¨(¯1 0)(1 0)#.rpm.superimpose_sequence l1 l2
      }

      coordinates_of_shape_in_layer_TEST←{
          #.UT.expect←(3 3)(3 4)(4 3)(4 4)
          l←'square'#.rpm.shape(3 3)
          #.rpm.coordinates l
      }
      
      shape_with_coordinate_inside_window_is_visible_TEST←{
          #.UT.expect←1
          l←'square'#.rpm.shape(3 3)
          #.rpm.visible l
      }
      
      shape_with_coordinates_outside_window_is_not_visible_TEST←{
          #.UT.expect←0
          l←'square'#.rpm.shape(1 1)
          #.rpm.visible l
      }
           
      starting_position_for_square_given_rule_to_ensure_visible_TEST←{
          #.UT.expect←,(1 3)∘+¨⍳(4 4)
          rule←(¯1 1)
          'square'#.rpm.visible_in_next_step rule
      }
      
      starting_position_for_vertical_staff_given_rule_to_ensure_visible_TEST←{
          #.UT.expect←,(1 4)∘+¨⍳4 3
          rule←(¯1 1)
          'vertical staff'#.rpm.visible_in_next_step rule
      }
      
      starting_position_for_horizontal_staff_given_rule_to_ensure_visible_TEST←{
          #.UT.expect←,2+⍳3 4
          rule←(¯1 1)
          'horizontal staff'#.rpm.visible_in_next_step rule
      }
      
      starting_position_for_corners_given_rule_to_ensure_visible_TEST←{
          #.UT.expect←,(1 2)∘+¨⍳4 4
          rule←(¯1 1)
          'corners'#.rpm.visible_in_next_step rule
      }
     
:EndNameSpace


