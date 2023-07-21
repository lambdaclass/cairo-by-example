import init, {greet, runCairoProgram, compileStarknetContract} from 'module/wasm-cairo';
import * as params from '@params';

(async () => {
    await init(params.wasm_file);
    console.log(greet("Cairo-by-Example"));
})();


onmessage = function (e) {
    const { data, functionToRun } = e.data;
    init(params.wasm_file).then(() => {
        let result;
        switch (functionToRun) {
            case "runCairoProgram":
                const { availableGas, printFullMemory, useDBGPrintHint } = e.data;
                result = runCairoProgram(data, availableGas, printFullMemory, useDBGPrintHint);
                break;
            case "compileStarknetContract":
                result = compileStarknetContract(data, false)
                break;
            default:
                console.error(`Unexpected function: ${functionToRun}`);
                return;
        }
        postMessage(result);
    });
}
