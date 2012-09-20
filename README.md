iRank
=====

get app store rank
    get_rank: get the rank from app store
        usage: get_rank all|weather

    view_rank: view the rank got by get_rank 
        usage: view_rank all|weather app_name change_times
        usage: view_rank all|weather 0 0

    diff_cn: record the rank whether diffirent, called by crontab

    curl_top_cn: get the rank by get_rank, called by crontab 

    today_rank: view the rank change 
    
    view_changes: view the rank whether changes 
