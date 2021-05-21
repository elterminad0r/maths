import random

def run_monty():
    doors = [0, 0, 1]
    random.shuffle(doors)
    contestant_choice = 0
    host_shows = random.randrange(1, 3)
    host_had_car = doors[host_shows]
    final_choice = ((host_shows - 1) ^ 1) + 1
    contestant_had_car = doors[final_choice]
    # assert {final_choice, host_shows} == {1, 2}
    return host_had_car, contestant_had_car

if __name__ == "__main__":
    total_goat_reveals = 0
    total_car_wins = 0
    while True:
        host_had_car, contestant_had_car = run_monty()
        if not host_had_car:
            total_goat_reveals += 1
            if contestant_had_car:
                total_car_wins += 1
        if total_goat_reveals % 5000 == 0:
            print("\rwon {} cars out of {} goat reveals ({:5.1%})".format(
                    total_car_wins, total_goat_reveals,
                    total_car_wins / total_goat_reveals
                        if total_goat_reveals != 0 else 0),
                end="")
