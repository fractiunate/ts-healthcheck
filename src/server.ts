import Fastify from "fastify";

declare global {
    namespace NodeJS {
        interface ProcessEnv {
            NODE_ENV: 'development' | 'production';
            PORT?: number;
            HOST?: string;
        }
    }
}

const server = Fastify();

const host = process.env.HOST ?? "0.0.0.0";
const port = process.env.PORT ?? 3000;



server.get('/healthcheck', async function () {
    return { status: 'OK' };
})


async function main() {
    try {
        await server.listen({ port, host }) // required for docker: host expected to be 0.0.0.0 instead of localhost
        console.log(`Server up and running @ http://${host}:${port}`);

    } catch (error) {
        console.error(error);
        process.exit(1);
    }
}

main();