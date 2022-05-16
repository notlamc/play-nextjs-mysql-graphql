import getDatabase from "../../../../helpers/getDatabase";

const getBooks = (): Promise<
  {
    id: string;

    authorId: string;

    name: string;

    year: string;
  }[]
> =>
  new Promise((resolve, reject) =>
    getDatabase.getConnection((error, connection) => {
      if (error) return reject("databaseConnectionError");

      connection.query(
        "SELECT books.id, books.authorId, books.name, books.year FROM books;",

        (
          error,

          books: {
            id: string;

            authorId: string;

            name: string;

            year: string;
          }[]
        ) => {
          connection.release();

          if (error) return reject("databaseQueryError");

          if (books.length === 0) return reject("booksNotFound");

          resolve(books);
        }
      );
    })
  );

const run = (): Promise<
  {
    id: string;

    authorId: string;

    name: string;

    year: string;
  }[]
> =>
  new Promise((resolve, reject) =>
    getBooks().then(
      (books) => resolve(books),

      (errorCode) => reject(errorCode)
    )
  );

export default run;
