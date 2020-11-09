SELECT * FROM MAPDATA m WHERE DONG ='양산동';

-- 구로 찾으면 안산시상록구 처럼 시와 구가 같은 si data에 들어가 있기 때문에
-- 문제가 발생한다. 따라서 DONG으로 Select하는게 좋다.