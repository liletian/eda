procedure(CCFprintSomeInfo(@optional (obj geGetEditCellView()) "d")
  if(obj~>objType=="cellView" then
    when(obj~>instances
      printf("CCFprintSomeInfo: cellview %s %s %s has instances:\n"
	obj~>libName obj~>cellName obj~>viewName)
      foreach(inst obj~>instances
	if(inst~>purpose=="pin"
	  printf("Pin type %s, net:%s, term:%s\n"
	    inst~>cellName inst~>net~>name inst~>pin~>term~>name)
	  printf("Instance %s: terminals %L connected to %L\n"
	    inst~>name inst~>instTerms~>name inst~>instTerms~>net~>name)
	)
      ); foreach
      t
    ); when
  else
    printf(strcat("CCFprintSomeInfo: object of type %s\n"
      "  in cellview %s %s %s has attributes:\n%L") obj~>objType
      obj~>cellView~>libName obj~>cellView~>cellName obj~>cellView~>viewName
      obj~>??)
  ); if
); procedure CCFprintSomeInfo
