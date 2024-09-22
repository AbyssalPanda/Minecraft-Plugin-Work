bank_teller_assignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
        - trigger name:chat state:true
    interact scripts:
    - welcome_message

welcome_message:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - narrate "Hello <player.name>, and welcome to The Abyssal Banking Service, where your money is protected from anything and everything."
                - narrate "We currently have the following services available:"
                - narrate "1: Check your Balance."
                - narrate "2: Deposit into your account."
                - narrate "3: Withdraw from your account."
                - narrate "To access these services please just type the number of the service you require."
                - zap welcome_message 2
        2:
            chat trigger:
                1:
                    trigger: /1/
                    script:
                        - narrate "You have <player.formatted_money> available in your account."
                        - zap welcome_message 1
                2:
                    trigger: /2/
                    script:
                    - narrate "How much are you depositing?"
                    - zap welcome_message 3
                3:
                    trigger: /3/
                    script:
                    - narrate "How much are you withdrawing?"
                    - zap welcome_message 4
        3:
            chat trigger:
                1:
                    trigger: /regex:\d+/
                    script:
                        - if <player.inventory.quantity_item[coin]> >= <context.keyword>:
                            - take item:coin quantity:<context.keyword>
                            - money give quantity:<context.keyword> players:<player>
                            - narrate "We have deposited <context.keyword> coins to your account. Thank you for banking with us."
                            - zap welcome_message 1
                        - else:
                            - narrate "Apologies but you do not have enough coins on you to deposit them here."
                            - zap welcome_message 1
        4:
            chat trigger:
                1:
                    trigger: /regex:\d+/
                    script:
                        - if <player.money> >= <context.keyword>:
                            - give item:coin quantity:<context.keyword>
                            - money take quantity:<context.keyword> players:<player>
                            - narrate "we have withdrawn <context.keyword> coins. Thank you for banking with us."
                            - zap welcome_message 1
                        - else:
                            - narrate "Apologies but you do not have enough coins deposited with us."
                            - zap welcome_message 1
