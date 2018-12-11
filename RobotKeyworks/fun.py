#coding=utf-8

def add(a, b):
    try:
        return int(a)+int(b)
    except ValueError:
        raise ValueError("Cannot bu ren shi '%s'and '%s' to an integer." % (a,b))


def extend_to_list(list1, list2):
    """Adds ``list2`` to the end of ``list1``.
    """
	
    for value in list2:
        list1.append(value)
	
if __name__ == "__main__":
    a = add(4,5)
    print a