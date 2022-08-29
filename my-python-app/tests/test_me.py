from my_functions import add_numbers


def test_hello_france() -> None:
    """
    This is just a test

    :return:
    """
    assert add_numbers(40, 2) == 42


def test_failing() -> None:
    """
    Bad test

    :return:
    """
    assert add_numbers(2, 2) == 5
