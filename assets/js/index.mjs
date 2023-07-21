import * as params from '@params';

const maxWorkers = 1
const worker = new Worker(params.worker);

window.runButtonAction = async (innerHTML) =>{
    const code = extractCodes(innerHTML);
    //if code include #[starknet::contract]
    if (code.includes("#[starknet::contract]")) {
        return compileStarknetContract(code);
    }
    return runCairoProgram(code);
};

const runCairoProgram = async (cairo_program) => {
    return new Promise((resolve, reject) => {
        worker.postMessage({
            data: cairo_program,
            availableGas: undefined,
            printFullMemory: false,
            useDBGPrintHint: true,
            functionToRun: "runCairoProgram"
        });

        worker.onmessage = function(e) {
            resolve(e.data);
        };

        worker.onerror = function(error) {
            reject(error);
        };
    });
}

const compileStarknetContract = async (cairo_program) => {
    return new Promise((resolve, reject) => {
        worker.postMessage({
            data: cairo_program,
            functionToRun: "compileStarknetContract"
        });

        worker.onmessage = function(e) {
            resolve(e.data);
        };

        worker.onerror = function(error) {
            reject(error);
        };
    });
}

const extractCodes = (htmlString) => {
    const parser = new DOMParser();
    const doc = parser.parseFromString(htmlString, 'text/html');
    const codeElement = doc.querySelector('code');
    return codeElement.textContent;
}

