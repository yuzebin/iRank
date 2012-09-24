iRank
=====

get app store rank
    get_rank: get the rank from app store
        usage: get_rank country paid|free|grossing|weather

    view_rank: view the rank got by get_rank
        usage: view_rank country paid|free|grossing|weather [app_name [change_times]]

    diff_rank: record the rank whether diffirent, called by crontab

    curl_rank: get the rank by get_rank, called by crontab

    today_rank: view the rank change
