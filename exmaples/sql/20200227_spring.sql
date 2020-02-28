select 
  
    case when exists (select fid from board_upload_file buf where board.bnum=buf.bnum) then 'Y' else 'N' END
    as 사진유무
    , board.*
  from board ;
  
  
  select bcategory,
  case when 1=1
  then 'Y'
  else 'N'
  END
  from board;