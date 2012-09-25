iRank
=====

get app store rank

    cron_rank:
        get the rank through irank, called by crontab

    irank:
      get and view the app store top rank
          version 0.1
      usage: $0 <command> [options ...]
        <command>       Command to be executed

      Valid commands are:
        get   get the top rank from appstore
              usage : $0 get cn|jp free|paid|grossing|weather

        view  view the specific app's rank
              usage : $0 view cn|jp free|paid|grossing|weather [app_name [    _change_times]]

        diff  record the changes of rank
              usage : $0 diff cn|jp free|paid|grossing|weather


