import os

def main():
    # Raises KeyError if SOME_KEY is not set
    value = os.environ['SOME_KEY']
    value = os.getenv('SOME_OTHER_KEY')
    value = os.getenv("SOME_OTHER_OTHER_KEY")
    value = os.environ["SOME_OTHER_OTHER_OTHER_KEY"]
    print(f"The value of SOME_KEY is: {value}")

if __name__ == '__main__':
    main()
