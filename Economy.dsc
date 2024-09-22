Economy_script:

    type: economy
    priority: normal
    name single: Coin
    name plural: Coins
    digits: 0
    format: <[amount]> Tellycoins
    balance: <player.flag[money]>
    has: <player.flag[money].is[or_more].than[<[amount]>]>
    withdraw:
    - flag <player> money:-:<[amount]>
    deposit:
    - flag <player> money:+:<[amount]>
