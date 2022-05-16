import getDatabase from "../../../../helpers/getDatabase";

const getAuthors = (): Promise<
  {
    id: string;

    name: string;
  }[]
> =>
  new Promise((resolve, reject) =>
    getDatabase.getConnection((error, connection) => {
      if (error) return reject("databaseConnectionError");

      connection.query(
        "SELECT authors.id, authors.name FROM authors;",

        (
          error,

          authors: {
            id: string;

            name: string;
          }[]
        ) => {
          connection.release();

          if (error) return reject("databaseQueryError");

          if (authors.length === 0) return reject("authorsNotFound");

          resolve(authors);
        }
      );
    })
  );

const run = (): Promise<
  {
    id: string;

    name: string;
  }[]
> =>
  new Promise((resolve, reject) =>
    getAuthors().then(
      (authors) => resolve(authors),

      (errorCode) => reject(errorCode)
    )
  );

export default run;
