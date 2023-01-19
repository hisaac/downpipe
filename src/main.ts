import {
	Application,
	Router,
	FlashServer,
	hasFlash,
} from "https://deno.land/x/oak@v11.1.0/mod.ts";

const appOptions = hasFlash() ? { serverConstructor: FlashServer } : undefined;
const app = new Application(appOptions);

const router = new Router();
router.get("/", (ctx) => {
	ctx.response.body = "Hello World!";
});

app.use(router.routes());
app.use(router.allowedMethods());

await app.listen({ port: 8080 });
