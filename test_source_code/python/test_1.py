import os

def main():
    # Raises KeyError if SOME_KEY is not set
    value = os.environ['SOME_KEY']
    print(f"The value of SOME_KEY is: {value}")

if __name__ == '__main__':
    main()
