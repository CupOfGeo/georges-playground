from ..test_functions import add_numbers


def test_hello_france() -> None:
    """
    This is just a test

    :return:
    """
    assert add_numbers(40, 2) == 42
