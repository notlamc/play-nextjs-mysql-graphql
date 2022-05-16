import { gql, ApolloServer } from "apollo-server-micro";

import { ApolloServerPluginLandingPageGraphQLPlayground } from "apollo-server-core";

import { NextApiRequest, NextApiResponse } from "next";

import flows from "../../flows";

const typeDefs = gql`
  type Author {
    id: String!

    name: String!

    books: [Book]!
  }

  type Book {
    id: String!

    authorId: String!

    name: String!

    year: String!

    author: Author
  }

  type Query {
    getAuthors: [Author]
  }
`;

const resolvers = {
  Query: {
    getAuthors: () =>
      flows.api.graphql.authors
        .doGetAll()

        .then((authors) =>
          flows.api.graphql.books
            .doGetAll()

            .then((books) =>
              authors.map((author) => ({
                ...author,

                books: books.filter((book) => book.authorId === author.id),
              }))
            )
        ),
  },
};

const apolloServer = new ApolloServer({
  typeDefs,

  resolvers,

  plugins: [ApolloServerPluginLandingPageGraphQLPlayground()],
});

const startServer = apolloServer.start();

export const config = {
  api: {
    bodyParser: false,
  },
};

const handler = async (
  nextApiRequest: NextApiRequest,

  nextApiResponse: NextApiResponse
) => {
  await startServer;

  await apolloServer.createHandler({
    path: "/api/graphql",
  })(nextApiRequest, nextApiResponse);
};

export default handler;
