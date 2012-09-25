iRank
=====

get app store rank

    today_rank: 
        call view_rank , return the result

    view_rank: 
        view the rank got by curl_rank
        usage: view_rank country paid|free|grossing|weather [app_name [change_times]]

    curl_rank: 
        get the rank through get_rank, called by crontab

    diff_rank: 
        record the rank whether diffirent, called by crontab
    
    get_rank: 
        get the rank from app store
        usage: get_rank country paid|free|grossing|weather

