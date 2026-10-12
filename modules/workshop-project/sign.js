const { createHmac } = require("crypto")

async function read(stream) {
    const chunks = []
    for await (const chunk of stream) chunks.push(chunk)
    return Buffer.concat(chunks).toString("utf8")
}

function sign(data, secret) {
    return createHmac("sha256", secret)
            .update(data)
            .digest("hex")
}

async function main() {
    const { id, expires, secret } = JSON.parse(await read(process.stdin))
    const data = `${id}.${expires}`
    const token = sign(data, secret)
    process.stdout.write(JSON.stringify({
        id,
        expires,
        token,
    }))
}

main().catch(e => { console.log(e); process.exit(1); })