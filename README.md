# Cairo by Example

## Introduction

The objective of this tutorial is to quickly on-board new developers to Cairo. The first experience newcomers have with Cairo and Starknet should be smooth and in 15' they should have everything setup and a good overview on what the language is all about.

Go to webpage to learn how to install and write [Cairo](https://cairo-lang.org) in simple and direct steps.

Most of the CSS and hugo code was taken modified from [noir-by-example](https://github.com/sambarnes/noir-by-example/).
Most of the code is taken from [Cairo Book](https://cairo-book.github.io/) and community contributions.

## Running the project

1. Clone the repository
2. Run `make build` in your terminal
3. Run `make serve` in your terminal and you will have the website running in `localhost:1313`

## 🛠 Contributing

The open-source community is a fantastic place for learning, inspiration, and creation, and this is all thanks to contributions from people like you. Your contributions are greatly appreciated.

If you have any suggestions for how to improve the project, please feel free to fork the repo and create a pull request, or open an issue with the tag 'enhancement'.

If you would like to contribute but don't know how to start you can check our issues labeled as ***good first issues***

### How to contribute

1. Fork the Project
2. Create your Feature Branch (git checkout -b feat/NewExample)
3. Commit your Changes (git commit -m 'feat: add new example')
    - In the case you just want to add a new example you need to create a new `markdown` file in `content/en/examples`, please keep in mind the following:
      - This text should be at the beggining of each file:
           ``` 
            ---
                title: "new-example"
                weight: X
                draft: false
            ---
        ```
    
        X determines the position of the example in the main page list.
      - The example should always include a `main` function.
      - Remember to **test and compile the example** in a separate project before copying the code.

    -  If you wish to submit a new translation to Spanish you just need to copy the example to `content/es/examples` and then make the necessary changes. Not everything should be translated. Some specific vocabulary in Software Development is better to keep it in English. For example: `Felt` doesn't have a natural translation.
4. Push to the Branch (git push origin feat/NewExample)
5. Open a Pull Request

And don't forget to give the project a star! ⭐ Thank you again for your support.

## References

- [Cairo Book](https://cairo-book.github.io/)
- [solidity-by-example](https://github.com/raineorshine/solidity-by-example)
- [noir-by-example](https://github.com/sambarnes/noir-by-example/)
