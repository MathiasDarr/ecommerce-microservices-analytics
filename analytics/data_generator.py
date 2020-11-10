import json
import random
from collections import defaultdict


def sum_to_one(n):
    """
    This function generates a list of n values who sum is 1.0.
    :param n: number of values
    :return:
    """
    values = [0.0, 1.0] + [random.random() for _ in range(n - 1)]
    values.sort()
    return [values[i+1] - values[i] for i in range(n)]


# Opening JSON file
with open('products/products.json') as json_file:
    data = json.load(json_file)

values = sum_to_one(len(data))

# Dictionary which maps itemID to the item
items_dictionary = {}
# A list of items w/ associated item popularity
items_popularity_list = []

for i, item in enumerate(data):
  items_dictionary[item['productID']] = item
  items_popularity_list.append((values[i], item['productID']))


columns = list(zip(*items_popularity_list))

item_counts = defaultdict(int)
item_zip = list(zip(*items_popularity_list))
x = random.choices(item_zip[1], weights=item_zip[0], k=1000)
for item in x:
  item_counts[item] += 1
for key, value in item_counts.items():
  print("item ID: {} has count: {}".format(key, value))

