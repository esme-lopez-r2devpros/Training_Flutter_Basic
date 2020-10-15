

bool isNumeric ( String s ) {

  if(s.isEmpty) return false;

  final n= num.tryParse(s);
  
  if( n==null ){
    return false;
  }
  else
  {
    return true;
  }

}